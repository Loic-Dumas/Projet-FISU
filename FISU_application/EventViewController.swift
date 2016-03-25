//
//  EventViewController.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 01/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    var activity : Activity? = nil
    @IBOutlet weak var titleNavigatonItem: UINavigationItem!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourBeginLabel: UILabel!
    @IBOutlet weak var hourEndLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var speakerTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let activityNotNil = self.activity else {
            return
        }
        self.titleNavigatonItem.title = activityNotNil.name
        self.dayLabel.text = activityNotNil.dayToString()
        self.hourBeginLabel.text = activityNotNil.beginHourToString()
        self.hourEndLabel.text = activityNotNil.endHourToString()
        self.locationLabel.text = activityNotNil.locate!.title
        self.descriptionTextView.text = activityNotNil.name
        self.descriptionTextView.editable = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("Coucou")
    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Bye bye")
    }
    

}
