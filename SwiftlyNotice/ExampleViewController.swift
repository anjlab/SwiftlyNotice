//
//  ViewController.swift
//  SwiftlyNotice
//
//  Created by Mikhail Pchelnikov on 19/02/16.
//  Copyright © 2016 Michael Pchelnikov. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    
    private let _swiftlyNotice = SwiftlyNotice.shared
    
    private let _showErrorButton           = UIButton(type: .System) as UIButton
    private let _showInfoButton            = UIButton(type: .System) as UIButton
    private let _showSuccessButton         = UIButton(type: .System) as UIButton
    private let _showExtendedErrorButton   = UIButton(type: .System) as UIButton
    private let _showExtendedInfoButton    = UIButton(type: .System) as UIButton
    private let _showExtendedSuccessButton = UIButton(type: .System) as UIButton

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        _showErrorButton.translatesAutoresizingMaskIntoConstraints = false
        _showErrorButton.setTitle("Show Error Message", forState: .Normal)
        _showErrorButton.addTarget(self, action: "_showErrorNotice", forControlEvents: .TouchUpInside)
        _showErrorButton.frame.size = CGSizeMake(150, 20)
        
        _showInfoButton.translatesAutoresizingMaskIntoConstraints = false
        _showInfoButton.setTitle("Show Info Message", forState: .Normal)
        _showInfoButton.addTarget(self, action: "_showInfoNotice", forControlEvents: .TouchUpInside)
        _showInfoButton.frame.size = CGSizeMake(150, 20)
        
        _showSuccessButton.translatesAutoresizingMaskIntoConstraints = false
        _showSuccessButton.setTitle("Show Success Message", forState: .Normal)
        _showSuccessButton.addTarget(self, action: "_showSuccessNotice", forControlEvents: .TouchUpInside)
        _showSuccessButton.frame.size = CGSizeMake(150, 20)
        
        _showExtendedErrorButton.translatesAutoresizingMaskIntoConstraints = false
        _showExtendedErrorButton.setTitle("Show Extended Error Message", forState: .Normal)
        _showExtendedErrorButton.addTarget(self, action: "_showExtendedErrorNotice", forControlEvents: .TouchUpInside)
        _showExtendedErrorButton.frame.size = CGSizeMake(150, 20)
        
        _showExtendedInfoButton.translatesAutoresizingMaskIntoConstraints = false
        _showExtendedInfoButton.setTitle("Show Extended Info Message", forState: .Normal)
        _showExtendedInfoButton.addTarget(self, action: "_showExtendedInfoNotice", forControlEvents: .TouchUpInside)
        _showExtendedInfoButton.frame.size = CGSizeMake(150, 20)
        
        _showExtendedSuccessButton.translatesAutoresizingMaskIntoConstraints = false
        _showExtendedSuccessButton.setTitle("Show Extended Success Message", forState: .Normal)
        _showExtendedSuccessButton.addTarget(self, action: "_showExtendedSuccessNotice", forControlEvents: .TouchUpInside)
        _showExtendedSuccessButton.frame.size = CGSizeMake(150, 20)
        
        [_showErrorButton, _showInfoButton,
            _showSuccessButton, _showExtendedErrorButton,
            _showExtendedInfoButton, _showExtendedSuccessButton
        ].forEach(view.addSubview)
        
        _setupConstraints()
    }
    
    private func _setupConstraints() {
        view.addConstraint(NSLayoutConstraint(item: _showErrorButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: _showErrorButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 60.0))
        
        view.addConstraint(NSLayoutConstraint(item: _showInfoButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: _showInfoButton, attribute: .Top, relatedBy: .Equal, toItem: _showErrorButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
        
        view.addConstraint(NSLayoutConstraint(item: _showSuccessButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: _showSuccessButton, attribute: .Top, relatedBy: .Equal, toItem: _showInfoButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
        
        view.addConstraint(NSLayoutConstraint(item: _showExtendedErrorButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: _showExtendedErrorButton, attribute: .Top, relatedBy: .Equal, toItem: _showSuccessButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
        
        view.addConstraint(NSLayoutConstraint(item: _showExtendedInfoButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: _showExtendedInfoButton, attribute: .Top, relatedBy: .Equal, toItem: _showExtendedErrorButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
        
        view.addConstraint(NSLayoutConstraint(item: _showExtendedSuccessButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: _showExtendedSuccessButton, attribute: .Top, relatedBy: .Equal, toItem: _showExtendedInfoButton, attribute: .Bottom, multiplier: 1.0, constant: 20.0))
    }

    private dynamic func _showErrorNotice() {
        _swiftlyNotice.displayTime = 5
        _swiftlyNotice.showErrorMessage("An unknown error occurred")
    }
    
    private dynamic func _showInfoNotice() {
        _swiftlyNotice.showInfoMessage("Lorem ipsum dolor sit amet", displayTime: 4)
    }
    
    private dynamic func _showSuccessNotice() {
        _swiftlyNotice.showSuccessMessage("The operation completed succesfully", displayTime: 6)
    }
    
    private dynamic func _showExtendedErrorNotice() {
        _swiftlyNotice.displayTime = 5
        _swiftlyNotice.showExtendedErrorMessage("Sorry, something went wrong.\n Please try again later.")
    }
    
    private dynamic func _showExtendedInfoNotice() {
        _swiftlyNotice.showExtendedInfoMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Collige omnia, quae soletis: Praesidium amicorum.", displayTime: 4)
    }
    
    private dynamic func _showExtendedSuccessNotice() {
        _swiftlyNotice.showExtendedSuccessMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Collige omnia, quae soletis: Praesidium amicorum.", displayTime: 6)
    }
}

