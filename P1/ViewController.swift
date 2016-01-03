//
//  ViewController.swift
//  P1
//
//  Created by 文川术 on 1/2/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let views = Views()
	var cardView0 = UIView()
	var cardView1 = UIView()
	var cardView2 = UIView()

	var cardViews = [UIView]()
	var colors = [UIColor]()
	var rects = [CGRect]()

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		colors = views.getColors()
		self.view.backgroundColor = colors[0]

		views.getFakeBlurView(self)

		rects = views.getFrames(view.frame)
		cardViews = views.getCardViews(self)

	}


	func selected(sender: UIButton) {

		for card in cardViews {
			if card.frame == rects[0] {
				cardView0 = card
			}

			if card.frame == rects[1] {
				cardView1 = card
			}

			if card.frame == rects[2] {
				cardView2 = card
			}
		}

		if sender == cardView1.subviews[0] as! UIButton {
			changeToColor(sender.backgroundColor!)
			moveTo(cardView1, rect: rects[0])

			if cardView0.tag < cardView2.tag {
				view.bringSubviewToFront(cardView2)
				moveTo(cardView0, rect: rects[1])
			} else {
				moveTo(cardView2, rect: rects[1])
				view.bringSubviewToFront(cardView0)
				moveTo(cardView0, rect: rects[2])
			}
		}

		if sender == cardView2 .subviews[0] as! UIButton {
			changeToColor(sender.backgroundColor!)
			moveTo(cardView2, rect: rects[0])

			if cardView0.tag < cardView1.tag {
				view.bringSubviewToFront(cardView1)
				moveTo(cardView1, rect: rects[2])
				moveTo(cardView0, rect: rects[1])
			} else {
				moveTo(cardView0, rect: rects[2])
			}
		}
	}

	func changeToColor(color: UIColor) {
		UIView.animateWithDuration(1.0) { () -> Void in
			self.view.backgroundColor = color
		}
	}


	func moveTo(view: UIView, rect: CGRect) {

		let duration = Double(self.view.frame.height * 0.00140845)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.999, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
			view.frame = rect

			}, completion: nil)

	}

}

extension ViewController: UITextFieldDelegate {

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		print(textField.tag)
		return true
	}
}







