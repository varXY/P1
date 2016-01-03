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

	let backgroundColor = UIColor(red: 236/255, green: 235/255, blue: 243/255, alpha: 1.0)


	func getCardViews(viewController: UIViewController) -> [UIView] {
		var cardViews = [UIView]()

		let rects = getFrames(viewController.view.frame)
		let colors = getColors()
		let titles = ["Characters", "Words", "Sentences"]

		for i in 0..<3 {
			let card = cardView(rects[i], color: colors[i], title: titles[i])
			card.tag = 10 + i
			if let button = card.subviews[0] as? UIButton {
				button.tag = 100 + i
				button.addTarget(viewController, action: "selected:", forControlEvents: .TouchUpInside)
			}
			cardViews.append(card)
			viewController.view.addSubview(card)
		}

		return cardViews
	}

	func getPoint(rect: CGRect) -> [CGPoint] {
		let point0 = CGPointMake(0, 20)
		let point1 = CGPointMake(0, rect.height - 100)
		let point2 = CGPointMake(0, rect.height - 50)

		let points = [point0, point1, point2]
		return points
	}

	func getFrames(rect: CGRect) -> [CGRect] {
		let frame0 = CGRectMake(2, 20, rect.width - 4, rect.height * 0.75 - (rect.height * 0.0125))
		let frame1 = CGRectMake(5, rect.height - 95, rect.width - 10, rect.height * 0.75 - (rect.height * 0.3125))
		let frame2 = CGRectMake(2, rect.height - 48, rect.width - 4, rect.height * 0.75 - (rect.height * 0.0125))

		let frames = [frame0, frame1, frame2]
		return frames
	}

	func getColors() -> [UIColor] {
		let color0 = UIColor(red: 175/255, green: 70/255, blue: 70/255, alpha: 1.0)
		let color1 = UIColor(red: 139/255, green: 144/255, blue: 97/255, alpha: 1.0)
		let color2 = UIColor(red: 106/255, green: 96/255, blue: 119/255, alpha: 1.0)

		let colors = [color0, color1, color2]
		return colors
	}

	func getBlurView(viewController: UIViewController) {
		let effect = UIBlurEffect(style: .ExtraLight)
		let blurView = UIVisualEffectView(effect: effect)
		blurView.frame = viewController.view.bounds

		viewController.view.addSubview(blurView)
	}

	func getFakeBlurView(viewController: UIViewController) {
		let fakeBlurView = UIView(frame: viewController.view.bounds)
		fakeBlurView.backgroundColor = UIColor.blackColor()
		fakeBlurView.alpha = 0.5

		viewController.view.addSubview(fakeBlurView)
	}

	func cardView(rect: CGRect, color: UIColor, title: String) -> UIView {
		let cardView = UIView()
		cardView.frame = rect
		cardView.backgroundColor = backgroundColor
		cardView.layer.cornerRadius = 10
		cardView.clipsToBounds = true

		let titleButton = UIButton(type: .System)
		titleButton.frame.origin = CGPoint.zero
		titleButton.frame.size = CGSizeMake(screenSize.width, 50)
		titleButton.backgroundColor = color
		let titleLabel = buttonTitleLabel(title)
		titleButton.addSubview(titleLabel)

		cardView.addSubview(titleButton)

		if color == getColors()[0] {
			let frame = CGRect(x: 10, y: 30, width: cardView.frame.width - 20, height: cardView.frame.height * 0.6)
			let labelView = charactersLabelView(frame, text0: "迟", text1: "词")
			cardView.addSubview(labelView)
		}

		return cardView
	}

	func buttonTitleLabel(text: String) -> UILabel {
		let label = UILabel()
		label.frame.origin = CGPointMake(10, 5)
		label.frame.size = CGSizeMake(screenSize.width / 2, 40)
		label.text = text
		label.textColor = UIColor.whiteColor()
		label.font = UIFont.boldSystemFontOfSize(18)
		return label
	}

	func charactersLabelView(frame: CGRect, text0: String, text1: String) -> UIView {
		let labelView = UIView(frame: frame)

		let label0 = UILabel(frame: CGRect(x: 0, y: 0, width: labelView.frame.width / 2, height: labelView.frame.height))
		label0.text = text0
		label0.textColor = getColors()[0]
		label0.textAlignment = .Center
		label0.font = UIFont.boldSystemFontOfSize(18)
		labelView.addSubview(label0)

		let label1 = UILabel(frame: CGRect(x: labelView.frame.width / 2, y: 0, width: labelView.frame.width / 2, height: labelView.frame.height))
		label1.text = text1
		label1.textColor = getColors()[0]
		label1.textAlignment = .Center
		label1.font = UIFont.boldSystemFontOfSize(18)
		labelView.addSubview(label1)

		return labelView
	}













}