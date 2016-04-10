//
//  WeekScheduleViewController.swift
//  FISU_application
//
//  Created by LoïcDumas on 09/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit

class WeekScheduleViewController: UIViewController {
    var restaurant : Restaurant? = nil

    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    @IBOutlet weak var ModayOpenningLabel: UILabel!
    @IBOutlet weak var TuesdayOpenningLabel: UILabel!
    @IBOutlet weak var WednesdayOpenningLabel: UILabel!
    @IBOutlet weak var ThursdayOpenningLabel: UILabel!
    @IBOutlet weak var FridayOpenningLabel: UILabel!
    @IBOutlet weak var SaturdayOpenningLabel: UILabel!
    @IBOutlet weak var SundayOpenningLabel: UILabel!
    @IBOutlet weak var mondayClosingLabel: UILabel!
    @IBOutlet weak var tuesdayClosingLabel: UILabel!
    @IBOutlet weak var wednesdayClosingLabel: UILabel!
    @IBOutlet weak var thursdayClosingLabel: UILabel!
    @IBOutlet weak var fridayClosingLabel: UILabel!
    @IBOutlet weak var saturdayClosingLabel: UILabel!
    @IBOutlet weak var sundayClosingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0  ..< 7  {
            //let dailySchedule = restaurant?.weekSchedule.getAtIndex(i)
            //print("Pour le jour n° \(i), ouvre à \(dailySchedule!.opening?.hour) ")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
