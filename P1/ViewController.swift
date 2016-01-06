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

	var buttons = [UIButton]()

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
		buttons = views.getInvisibleButtons(self)
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

		if sender == buttons[0] {
			changeToColor(cardView1.subviews[0].backgroundColor!)
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

		if sender == buttons[1] {
			changeToColor(cardView2.subviews[0].backgroundColor!)
			moveTo(cardView2, rect: rects[0])

			if cardView0.tag < cardView1.tag {
				view.bringSubviewToFront(cardView1)
				moveTo(cardView1, rect: rects[2])
				moveTo(cardView0, rect: rects[1])
			} else {
				view.bringSubviewToFront(cardView0)
				moveTo(cardView0, rect: rects[2])
			}
		}

		view.bringSubviewToFront(buttons[0])
		view.bringSubviewToFront(buttons[1])

	}

	func changeToColor(color: UIColor) {
		UIView.animateWithDuration(1.0) { () -> Void in
			self.view.backgroundColor = color
		}
	}


	func moveTo(view: UIView, rect: CGRect) {

		let duration = Double(self.view.frame.height * 0.00140845)

		UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.999, initialSpringVelocity: 7.0, options: [], animations: { () -> Void in
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







