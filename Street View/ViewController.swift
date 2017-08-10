//
//  ViewController.swift
//  Street View
//
//  Created by Simon Ng on 3/8/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var panoramaView: GMSPanoramaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panoramaView.delegate = self
        panoramaView.moveNearCoordinate(CLLocationCoordinate2D(latitude: 12.3, longitude: 98.2))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.panoramaView.animate(to: GMSPanoramaCamera(heading: 90, pitch: 0, zoom: 1), animationDuration: 2)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: GMSPanoramaViewDelegate {
    func panoramaView(_ view: GMSPanoramaView, error: Error, onMoveNearCoordinate coordinate: CLLocationCoordinate2D) {
        print(error.localizedDescription)
    }
}
