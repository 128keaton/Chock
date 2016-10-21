//
//  ScreenBlemish.swift
//  Chock
//
//  Created by Keaton Burleson on 10/20/16.
//  Copyright © 2016 Keaton Burleson. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
class ScreenBlemish: UIViewController {
	var backgroundColours = [UIColor()]
	var backgroundLoop = 0
	var isWhite = false
	var shouldAnimate = true
	
	@IBOutlet var whiteLabel: UIButton?
	@IBOutlet var nextButton: UIButton?

	override func viewDidLoad() {
		backgroundColours = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.cyan, UIColor.darkGray, UIColor.green]
		backgroundLoop = 0
		self.animateBackgroundColour()
		let whiteGesture = UITapGestureRecognizer.init(target: self, action: #selector(pauseOnWhite))
		self.view.addGestureRecognizer(whiteGesture);
		nextButton?.tintColor = UIColor.white
	}
	func pauseOnWhite() {
		if isWhite == false {
			shouldAnimate = false
			self.view.layer.removeAllAnimations()
			backgroundLoop = 0
			self.backgroundColours = []
			view.backgroundColor = UIColor.white
			nextButton?.tintColor = self.view.tintColor
			whiteLabel?.tintColor = UIColor.black
		
			isWhite = true
		} else {
			self.view.layer.removeAllAnimations()
			backgroundColours = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.cyan, UIColor.darkGray, UIColor.green]
			
			backgroundLoop = 0
			isWhite = false
			shouldAnimate = true
			animateBackgroundColour()
		}

	}
	func animateBackgroundColour () {
		if shouldAnimate == true {
			if backgroundLoop < backgroundColours.count - 1 {
				backgroundLoop += 1
			} else {
				backgroundLoop = 0
			}
	
			

			UIView.animate(withDuration: 3, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
				self.view.backgroundColor = self.backgroundColours[self.backgroundLoop]
				self.nextButton?.tintColor = self.backgroundColours[self.backgroundLoop].getComplementaryColor()
				self.whiteLabel?.tintColor = self.backgroundColours[self.backgroundLoop].getComplementaryColor()
				
			               }) { (Bool) -> Void in
				self.animateBackgroundColour();
			}
		}
	}
}
// from https://gist.github.com/klein-artur/025a0fa4f167a648d9ea
extension UIColor {
	func getComplementaryColor() -> UIColor {
		
		let ciColor = CIColor(color: self)
		
		// get the current values and make the difference from white:
		let compRed: CGFloat = 1.0 - ciColor.red
		let compGreen: CGFloat = 1.0 - ciColor.green
		let compBlue: CGFloat = 1.0 - ciColor.blue
		
		return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
	}
}
