//
//  ViewController.swift
//  SwiftlyNotice
//
//  Created by Mikhail Pchelnikov on 19/02/16.
//  Copyright © 2016 Michael Pchelnikov. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    
    let swiftlyNotice = SwiftlyNotice.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        let showErrorButton = UIButton(type: .System) as UIButton
        showErrorButton.translatesAutoresizingMaskIntoConstraints = false
        showErrorButton.setTitle("Show Error Message", forState: .Normal)
        showErrorButton.addTarget(self, action: "_showErrorNotice", forControlEvents: .TouchUpInside)
        showErrorButton.frame.size = CGSizeMake(150, 20)
        
        let showInfoButton = UIButton(type: .System) as UIButton
        showInfoButton.translatesAutoresizingMaskIntoConstraints = false
        showInfoButton.setTitle("Show Info Message", forState: .Normal)
        showInfoButton.addTarget(self, action: "_showInfoNotice", forControlEvents: .TouchUpInside)
        showInfoButton.frame.size = CGSizeMake(150, 20)
        
        let showSuccessButton = UIButton(type: .System) as UIButton
        showSuccessButton.translatesAutoresizingMaskIntoConstraints = false
        showSuccessButton.setTitle("Show Success Message", forState: .Normal)
        showSuccessButton.addTarget(self, action: "_showSuccessNotice", forControlEvents: .TouchUpInside)
        showSuccessButton.frame.size = CGSizeMake(150, 20)
        
        let showExtendedErrorButton = UIButton(type: .System) as UIButton
        showExtendedErrorButton.translatesAutoresizingMaskIntoConstraints = false
        showExtendedErrorButton.setTitle("Show Extended Error Message", forState: .Normal)
        showExtendedErrorButton.addTarget(self, action: "_showExtendedErrorNotice", forControlEvents: .TouchUpInside)
        showExtendedErrorButton.frame.size = CGSizeMake(150, 20)
        
        let showExtendedInfoButton = UIButton(type: .System) as UIButton
        showExtendedInfoButton.translatesAutoresizingMaskIntoConstraints = false
        showExtendedInfoButton.setTitle("Show Extended Info Message", forState: .Normal)
        showExtendedInfoButton.addTarget(self, action: "_showExtendedInfoNotice", forControlEvents: .TouchUpInside)
        showExtendedInfoButton.frame.size = CGSizeMake(150, 20)
        
        let showExtendedSuccessButton = UIButton(type: .System) as UIButton
        showExtendedSuccessButton.translatesAutoresizingMaskIntoConstraints = false
        showExtendedSuccessButton.setTitle("Show Extended Success Message", forState: .Normal)
        showExtendedSuccessButton.addTarget(self, action: "_showExtendedSuccessNotice", forControlEvents: .TouchUpInside)
        showExtendedSuccessButton.frame.size = CGSizeMake(150, 20)
        
        [showErrorButton, showInfoButton,
            showSuccessButton, showExtendedErrorButton,
            showExtendedInfoButton, showExtendedSuccessButton
        ].forEach(view.addSubview)
        
        view.addConstraint(NSLayoutConstraint(item: showErrorButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: showErrorButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 60.0))

        view.addConstraint(NSLayoutConstraint(item: showInfoButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: showInfoButton, attribute: .Top, relatedBy: .Equal, toItem: showErrorButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
        
        view.addConstraint(NSLayoutConstraint(item: showSuccessButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: showSuccessButton, attribute: .Top, relatedBy: .Equal, toItem: showInfoButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
        
        view.addConstraint(NSLayoutConstraint(item: showExtendedErrorButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: showExtendedErrorButton, attribute: .Top, relatedBy: .Equal, toItem: showSuccessButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
        
        view.addConstraint(NSLayoutConstraint(item: showExtendedInfoButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: showExtendedInfoButton, attribute: .Top, relatedBy: .Equal, toItem: showExtendedErrorButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
        
        view.addConstraint(NSLayoutConstraint(item: showExtendedSuccessButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: showExtendedSuccessButton, attribute: .Top, relatedBy: .Equal, toItem: showExtendedInfoButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
        
    }

    private dynamic func _showErrorNotice() {
        swiftlyNotice.displayTime = 5
        swiftlyNotice.showErrorMessage("An unknown error occurred")
    }
    
    private dynamic func _showInfoNotice() {
        swiftlyNotice.showInfoMessage("Lorem ipsum dolor sit amet", displayTime: 4)
    }
    
    private dynamic func _showSuccessNotice() {
        swiftlyNotice.showSuccessMessage("The operation completed succesfully", displayTime: 6)
    }
    
    private dynamic func _showExtendedErrorNotice() {
        swiftlyNotice.displayTime = 5
        swiftlyNotice.showExtendedErrorMessage("Sorry, something went wrong.\n Please try again later.")
    }
    
    private dynamic func _showExtendedInfoNotice() {
        swiftlyNotice.showExtendedInfoMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Collige omnia, quae soletis: Praesidium amicorum.", displayTime: 4)
    }
    
    private dynamic func _showExtendedSuccessNotice() {
        swiftlyNotice.showExtendedSuccessMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Collige omnia, quae soletis: Praesidium amicorum.", displayTime: 6)
    }
}

