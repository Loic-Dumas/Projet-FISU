//
//  EventViewController.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 01/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit
import CoreData

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var activity : Activity? = nil
    @IBOutlet weak var titleNavigatonItem: UINavigationItem!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourBeginLabel: UILabel!
    @IBOutlet weak var hourEndLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet weak var speakerTableView: UITableView!
    @IBOutlet var goingSwitch: UISwitch!

    @IBAction func goingActionSwitch(sender: AnyObject) {
        self.activity?.going = !(self.activity?.going)!
        
        do {
            try self.activity?.managedObjectContext?.save()
        } catch let error as NSError  {
            print("Could not save (switch) \(error), \(error.userInfo)")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.speakerTableView.delegate = self
        self.speakerTableView.dataSource = self
        guard let activityNotNil = self.activity else {
            return
        }
        self.titleNavigatonItem.title = activityNotNil.name
        self.dayLabel.text = activityNotNil.dayToString()
        self.hourBeginLabel.text = activityNotNil.beginHourToString()
        self.hourEndLabel.text = activityNotNil.endHourToString()
        self.locationLabel.text = activityNotNil.location!.title
        self.descriptionTextView.text = activityNotNil.descriptionActivity
        self.descriptionTextView.editable = false
        self.categoryLabel.text = activityNotNil.category?.name
        self.goingSwitch.on = activityNotNil.going
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var nbRow = 0
        nbRow = (self.activity?.speakers?.count)!
        return nbRow
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SpeakerTableViewCellId", forIndexPath: indexPath)
        let speakerCell = cell as! SpeakerTableViewCell
        
        speakerCell.speaker = self.activity?.speakerSet.getAtIndex(indexPath.row)
        speakerCell.speakerNameLabel.text = speakerCell.speaker!.name
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let speakerViewController = segue.destinationViewController as! SpeakerViewController
        
        let cellSender = sender as! SpeakerTableViewCell
        
        speakerViewController.speaker = cellSender.speaker
    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Bye bye")
    }
    

}
