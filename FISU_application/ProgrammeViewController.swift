//
//  ProgrammeViewController.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 23/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit

class ProgrammeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var programmeTableView: UITableView!
    
    var programme : Programme {
        get {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            return appDelegate.event!.programme
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.programmeTableView.dataSource = self
        self.programmeTableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.programme.numberOfDays()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.programme.numberOfActivityForDay(section)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProgrammeTableViewCellId", forIndexPath: indexPath)
        let programmeCell = cell as! ProgrammeTableViewCell
        programmeCell.activity = programme.getAtIndex(indexPath.section, activityIndex: indexPath.row)
        programmeCell.activityBeginning.text = programmeCell.activity?.beginHourToString()
        programmeCell.activityName.text = programmeCell.activity?.name
        
        
        //add the icons
        switch programmeCell.activity!.category!.name! {
        case "Miscellaneous":
            if (programmeCell.activity?.going == true) {
                programmeCell.iconImageView.image = UIImage(named: "miscChecked.png")
            } else {
                programmeCell.iconImageView.image = UIImage(named: "misc.png")
            }
            
        case "Sport":
            if (programmeCell.activity?.going == true) {
                programmeCell.iconImageView.image = UIImage(named: "sportChecked.png")
            } else {
                programmeCell.iconImageView.image = UIImage(named: "sport.png")
            }
        default:
            if (programmeCell.activity?.going == true) {
                programmeCell.iconImageView.image = UIImage(named: "microChecked.png")
            } else {
                programmeCell.iconImageView.image = UIImage(named: "micro.png")
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.programme.getAtIndex(section)!.dayToString()
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        self.programmeTableView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let eventViewController = segue.destinationViewController as! EventViewController
        
        let cellSender = sender as! ProgrammeTableViewCell
        
        eventViewController.activity = cellSender.activity
    }
}
