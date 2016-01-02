//
//  Views.swift
//  P1
//
//  Created by 文川术 on 1/2/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

typealias getButton = (UIButton) -> Void

class Views {

	let screenSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
	let screenCenter = CGPoint(x: UIScreen.mainScreen().bounds.width / 2, y: UIScreen.mainScreen().bounds.height / 2)

//	func genMainView(addButton: getButton) -> UIView {
//		let mainView = UIView()
//		mainView.frame = CGRectMake(0, 0, screenSize.width, screenSize.height)
//		mainView.backgroundColor = UIColor.clearColor()
//		mainView.alpha = 0.7
//
//		let point0 = CGPointMake(0, 20)
//		let color0 = UIColor.orangeColor()
//		let cardView0 = genCardView(point0, color: color0)
//		cardView0.tag = 10
//		mainView.addSubview(cardView0)
//
//		let point1 = CGPointMake(0, screenSize.height - 80)
//		let color1 = UIColor.greenColor()
//		let cardView1 = genCardView(point1, color: color1)
//		cardView1.tag = 11
//		mainView.addSubview(cardView1)
//
//		let point2 = CGPointMake(0, screenSize.height - 40)
//		let color2 = UIColor.blueColor()
//		let cardView2 = genCardView(point2, color: color2)
//		cardView2.tag = 12
//		mainView.addSubview(cardView2)
//
//		for i in 0..<3 {
//			if let button = mainView.subviews[i].subviews[0] as? UIButton {
//				button.tag = 100 + i
//				addButton(button)
//			}
//		}
//
//		return mainView
//	}

	func genCardView(point: CGPoint, color: UIColor, title: String) -> UIView {
		let cardView = UIView()
		cardView.frame.origin = point
		cardView.frame.size = CGSizeMake(screenSize.width, screenSize.height * 0.7)
		cardView.backgroundColor = UIColor.whiteColor()
		cardView.layer.cornerRadius = 10
		cardView.clipsToBounds = true

		let titleButton = UIButton(type: .System)
		titleButton.frame.origin = CGPoint.zero
		titleButton.frame.size = CGSizeMake(screenSize.width, 40)
		titleButton.backgroundColor = color
		titleButton.tag = Int(point.y)
		titleButton.setTitle(title, forState: .Normal)
		titleButton.tintColor = UIColor.whiteColor()
		cardView.addSubview(titleButton)

		return cardView
	}

	func genQAView(delegate: UITextFieldDelegate, rect: CGRect) -> UIView {
		let contentView = UIView(frame: rect)

		let texts = ["私活", "失火", "似乎"]
		let width = (screenSize.width - 20) / 3

		for i in 0..<3 {
			let label = UILabel(frame: CGRectMake(10 + (width * CGFloat(i)), 0, width, 50))
			label.textAlignment = .Center
			label.textColor = UIColor.redColor()
			label.font = UIFont.boldSystemFontOfSize(18)
			label.text = texts[i]
			contentView.addSubview(label)

			let textField = UITextField(frame: CGRectMake(10 + width * CGFloat(i), 55, width, 30))
			textField.tag = 1000 + i
			textField.placeholder = "here"
			textField.textAlignment = .Center
			textField.keyboardType = .ASCIICapable
			textField.spellCheckingType = .No
			textField.autocorrectionType = .No
			textField.delegate = delegate
			contentView.addSubview(textField)

		}

		return contentView
	}












}