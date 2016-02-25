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
    var programme : Programme = Programme.getTestProgramme()
    
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
        programmeCell.activityBeginning.text = programme.getAtIndex(indexPath.section, activityIndex: indexPath.row)?.beginHourToString()
        programmeCell.activityName.text = programme.getAtIndex(indexPath.section, activityIndex: indexPath.row)?.name
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.programme.getAtIndex(section)!.dayToString()
    }
}
