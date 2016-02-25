//
//  Notice.swift
//  NoticeController
//
//  Created by Mikhail Pchelnikov on 07/11/15.
//  Copyright © 2015 Michael Pchelnikov. All rights reserved.
//

import UIKit

enum NoticeType: Int {
    case Info = 0, Success, Error, ExtendedInfo, ExtendedSuccess, ExtendedError
}

class SwiftlyNotice {

    static let shared = SwiftlyNotice()
    
    var displayTime: CGFloat = 7.0

    private var _windows = [UIWindow]()
    private var _height: CGFloat = 0.0
    private var _window: UIWindow!

    func showErrorMessage(message: String) {
        _showMessage(message: message, type: .Error, displayTime: displayTime)
    }

    func showExtendedErrorMessage(message: String) {
        _showMessage(message: message, type: .ExtendedError, displayTime: displayTime)
    }

    func showInfoMessage(message: String) {
        _showMessage(message: message, type: .Info, displayTime: displayTime)
    }
    
    func showExtendedInfoMessage(message: String) {
        _showMessage(message: message, type: .ExtendedInfo, displayTime: displayTime)
    }

    func showSuccessMessage(message: String) {
        _showMessage(message: message, type: .Success, displayTime: displayTime)
    }

    func showExtendedSuccessMessage(message: String) {
        _showMessage(message: message, type: .ExtendedSuccess, displayTime: displayTime)
    }

    func showErrorMessage(message: String, displayTime: CGFloat) {
        _showMessage(message: message, type: .Error, displayTime: displayTime)
    }

    func showExtendedErrorMessage(message: String, displayTime: CGFloat) {
        _showMessage(message: message, type: .ExtendedError, displayTime: displayTime)
    }

    func showInfoMessage(message: String, displayTime: CGFloat) {
        _showMessage(message: message, type: .Info, displayTime: displayTime)
    }
    
    func showExtendedInfoMessage(message: String, displayTime: CGFloat) {
        _showMessage(message: message, type: .ExtendedInfo, displayTime: displayTime)
    }

    func showSuccessMessage(message: String, displayTime: CGFloat) {
        _showMessage(message: message, type: .Success, displayTime: displayTime)
    }

    func showExtendedSuccessMessage(message: String, displayTime: CGFloat) {
        _showMessage(message: message, type: .ExtendedSuccess, displayTime: displayTime)
    }
    
    func hideMessage() {
        _hideWindow()
    }

    private func _backgroundColorForNoticeType(type: NoticeType) -> UIColor {
        switch type {
        case .Info, .ExtendedInfo:
            return Color.noticeInfo
        case .Success, .ExtendedSuccess:
            return Color.noticeSuccess
        case .Error, .ExtendedError:
            return Color.noticeError
        }
    }

    private func _showMessage(message message: String, type: NoticeType, displayTime: CGFloat) {
        _height = isExtendedType(type) ? 20.0 : 10.0

        var frame = UIApplication.sharedApplication().statusBarFrame

        if isExtendedType(type) {
            frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height * 2)
        }

        if let window = _window {
            window.hidden = true
        }

        _window = UIWindow(frame: frame)
        _window.backgroundColor = UIColor.clearColor()

        let view = UIView(frame: frame)
        view.backgroundColor = _backgroundColorForNoticeType(type)

        let label = UILabel(frame: frame)
        
        if isExtendedType(type) {
            label.numberOfLines = 2
        } else {
            label.numberOfLines = 1
        }

        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.Center
        label.font          = UIFont.systemFontOfSize(12)
        label.textColor     = UIColor.whiteColor()
        label.text          = message

        view.addSubview(label)
        _setupLabelConstraints(item: label, to: view)

        if (isExtendedType(type) || displayTime < 0.1) {
            let closeButtonView = CloseButtonView(frame: CGRectMake(0, 0, 20, 20))
            
            closeButtonView.translatesAutoresizingMaskIntoConstraints = false
            closeButtonView.backgroundColor = UIColor.clearColor()
            
            let hideWindowTapGesture = UITapGestureRecognizer(target: self, action: "_hideWindow")
            closeButtonView.addGestureRecognizer(hideWindowTapGesture)

            view.addSubview(closeButtonView)
            _setupCloseButtonConstraints(item: closeButtonView, to: view)
        }

        _window.windowLevel = UIWindowLevelStatusBar
        _window.addSubview(view)
        _windows.append(_window)

        _window.hidden = false
        _window.alpha = 0
        _window.transform = CGAffineTransformTranslate(_window.transform, 0, -_height)

        UIView.animateWithDuration(0.4, delay: 0.3, options: .OverrideInheritedOptions, animations: { _ in
                self._window.alpha = 1
                self._window.transform = CGAffineTransformIdentity
            }) { finished in
                if displayTime > 0.0 {
                    self._dispatch_after_delay(NSTimeInterval(displayTime), queue: dispatch_get_main_queue(), block: { _ in
                        if self._windows.count != 0 {
                            if self._windows.count > 1 {
                                self._windows.removeFirst()
                            } else {
                                self._windows.removeAll()
                                self._hideWindow()
                            }
                        }
                    })
                }
        }
    }

    private dynamic func _hideWindow() {
        _window.transform = CGAffineTransformIdentity
        UIView.animateWithDuration(0.5, animations: { _ in
                self._window.alpha = 0
                self._window.transform = CGAffineTransformTranslate(self._window.transform, 0, -self._height)
            }) { finished in
                self._window.hidden = true
            }
    }
    
    private func isExtendedType(type: NoticeType) -> Bool {
        if (type == .ExtendedError || type == .ExtendedSuccess || type == .ExtendedInfo) {
            return true
        }
        
        return false
    }

    private func _dispatch_after_delay(delay: NSTimeInterval, queue: dispatch_queue_t, block: dispatch_block_t) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, queue, block)
    }
    
    private func _setupLabelConstraints(item item: AnyObject, to view: UIView) {
        view.addConstraint(NSLayoutConstraint(item: item, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 15.0))
        view.addConstraint(NSLayoutConstraint(item: item, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: -35.0))
        view.addConstraint(NSLayoutConstraint(item: item, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    private func _setupCloseButtonConstraints(item item: AnyObject, to view: UIView) {
        view.addConstraint(NSLayoutConstraint(item: item, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: item, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: -5.0))
        view.addConstraint(NSLayoutConstraint(item: item, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 20.0))
        view.addConstraint(NSLayoutConstraint(item: item, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 20.0))
    }
}

class CloseButtonView: UIView {
    override func drawRect(rect: CGRect) {
        let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(0, 0))
        bezierPath.addLineToPoint(CGPointMake(20, 20))
        bezierPath.miterLimit = 10;
        
        bezierPath.lineCapStyle = .Square;
        
        strokeColor.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        let bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(20, 0))
        bezier2Path.addLineToPoint(CGPointMake(0, 20))
        bezier2Path.miterLimit = 10;
        
        bezier2Path.lineCapStyle = .Square;
        
        strokeColor.setStroke()
        bezier2Path.lineWidth = 1
        bezier2Path.stroke()
    }
}

struct Color {
    static var noticeInfo: UIColor { return UIColor(netHex: 0xf47a20) }
    static var noticeSuccess: UIColor { return UIColor(netHex: 0x30b834) }
    static var noticeError: UIColor { return UIColor(netHex: 0xf23d3d) }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
