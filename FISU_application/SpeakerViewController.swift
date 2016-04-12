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
    @IBOutlet var speakerImage: UIImageView!
    
    var speaker : Speaker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleNavigationItem.title = self.speaker?.name
        self.descriptionTextView.text = self.speaker?.descriptionSpeaker
//        guard let image = UIImage(named: "\(self.speaker?.name).png") else {
//            print("lama")
//            return
//        }
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
