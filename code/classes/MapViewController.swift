//
//  MapViewController.swift
//  FrenchKit
//
//  Created by Julien on 28/12/2016.
//  Copyright © 2016 Sinplicity. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let centerCoordinate = CLLocationCoordinate2D(latitude: 48.857809, longitude: 2.389043)

        let annotation = AccessibleAnotation()
        annotation.coordinate = centerCoordinate
        annotation.title = "EventName".localized
        annotation.accessibilityIdentifier = "eventlocation"
        annotation.accessibilityLabel = "eventlocation"
        annotation.isAccessibilityElement = true

        mapView.addAnnotation(annotation)

        let region = MKCoordinateRegion(center: centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
        mapView.setRegion(region, animated: false)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.title = "Map".localized
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? AccessibleAnotation else {
            print("Unhandled annotation type")
            return nil
        }

        let reuseIdentifier = "annotation"

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation")
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        }

        annotationView?.canShowCallout = true
        annotationView?.accessibilityIdentifier = annotation.accessibilityIdentifier

        return annotationView
    }

    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

class AccessibleAnotation: MKPointAnnotation, UIAccessibilityIdentification {
    var accessibilityIdentifier: String?
}
