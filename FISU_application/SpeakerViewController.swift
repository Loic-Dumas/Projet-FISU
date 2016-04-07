//
//  SpeakerViewController.swift
//  FISU_application
//
//  Created by LoïcDumas on 07/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit

class SpeakerViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    var speaker : Speaker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleNavigationItem.title = self.speaker?.name
        self.descriptionTextView.text = self.speaker?.descriptionSpeaker
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
