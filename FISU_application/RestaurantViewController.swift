//
//  RestaurantViewController.swift
//  FISU_application
//
//  Created by LoïcDumas on 09/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit

// viewController who displays all restaurants
class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var restaurantTableView: UITableView!
    
    var restaurantSet : RestaurantSet {
        get {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            return appDelegate.event!.map.restaurantSet
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.restaurantTableView.delegate = self
        self.restaurantTableView.dataSource = self

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
        nbRow = (self.restaurantSet.count())
        return nbRow
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestaurantTableViewCellId", forIndexPath: indexPath)
        let restaurantCell = cell as! RestaurantTableViewCell
        
        restaurantCell.restaurant = self.restaurantSet.getAtIndex(indexPath.row)
        restaurantCell.nameLabel.text = restaurantCell.restaurant?.name
        restaurantCell.rateLabel.text = rateInStar(restaurantCell.restaurant?.rate as! Int)
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let restaurantPageViewController = segue.destinationViewController as! RestaurantPageViewController
        
        let cellSender = sender as! RestaurantTableViewCell
        
        restaurantPageViewController.restaurant = cellSender.restaurant
    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Bye bye")
    }
    
    
    
    
    private func rateInStar(rateNumber : Int) -> String {
        var rateString = ""
        for i in 1  ..< 6  {
            if i <= rateNumber {
                rateString += "★"
            } else {
                rateString += "☆"
            }
        }
        return rateString
    }
    


}
