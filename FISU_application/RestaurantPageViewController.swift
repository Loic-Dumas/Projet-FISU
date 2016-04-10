//
//  RestaurantPageViewController.swift
//  FISU_application
//
//  Created by LoïcDumas on 09/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit
import MapKit

class RestaurantPageViewController: UIViewController {
    var restaurant : Restaurant? = nil
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var nameNavvigationItem: UINavigationItem!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var restaurantMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameNavvigationItem.title = restaurant?.name
        self.descriptionTextView.text = restaurant?.descriptionRestaurant
        self.rateLabel.text = rateInStar(restaurant?.rate as! Int)
        
        let restaurantLocation = self.restaurant?.location
        
        let initialLocation = CLLocation(latitude: restaurantLocation?.latitude as! Double, longitude: restaurantLocation?.longitude as! Double)
        centerMapOnLocation(initialLocation)
        
        
        let restaurantAnnotation = PlaceAnnotation(title: (restaurant?.name)!,
                              locationName: "Montpellier",
                              type: (restaurantLocation?.type!.name)!,
                              coordinate:  CLLocationCoordinate2D(latitude: restaurantLocation?.latitude as! Double, longitude: restaurantLocation?.longitude as! Double),
                              subtitle : "Restaurant")
        
        restaurantMapView.addAnnotation(restaurantAnnotation)
        
    }
    
    let regionRadius: CLLocationDistance = 1800
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        self.restaurantMapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    
    
    
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let weekScheduleViewController = segue.destinationViewController as! WeekScheduleViewController
        
        weekScheduleViewController.restaurant = self.restaurant
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
