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
	var mainView = UIView()
	var cardView0 = UIView()
	var cardView1 = UIView()
	var cardView2 = UIView()

	var cardViews = [UIView]()

	var point0 = CGPoint()
	var point1 = CGPoint()
	var point2 = CGPoint()

	var QAView = UIView()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = UIColor.blackColor()

		QAView = views.genQAView(self, rect: CGRectMake(0, 50, view.frame.width, 100))

		point0 = CGPointMake(0, 20)
		point1 = CGPointMake(0, view.frame.height - 80)
		point2 = CGPointMake(0, view.frame.height - 40)

		cardViews = [cardView0, cardView1, cardView2]
		let points = [point0, point1, point2]
		let colors = [UIColor.orangeColor(), UIColor.greenColor(), UIColor.blueColor()]

		for i in 0..<3 {
			cardViews[i] = views.genCardView(points[i], color: colors[i], title: String(i))
			cardViews[i].tag = 10 + i
			if let button = cardViews[i].subviews[0] as? UIButton {
				button.tag = 100 + i
				button.addTarget(self, action: "selected1:", forControlEvents: .TouchUpInside)
			}
			view.addSubview(cardViews[i])
		}

		cardViews[0].addSubview(QAView)

		let tapGesture = UITapGestureRecognizer(target: self, action: "tapped")
		view.addGestureRecognizer(tapGesture)

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		let sub = cardViews[0].subviews[0]
			for subView in sub.subviews {
				if let textField = subView as? UITextField {
					if textField.tag == 1000 {
						textField.becomeFirstResponder()
					}
				}
			}

	}

	func tapped() {
		for textField in QAView.subviews {
			if textField.isKindOfClass(UITextField) {
				textField.resignFirstResponder()
			}
		}
	}

	func selected1(sender: UIButton) {

		for card in cardViews {
			if card.frame.origin == point0 {
				cardView0 = card
			}

			if card.frame.origin == point1 {
				cardView1 = card
			}

			if card.frame.origin == point2 {
				cardView2 = card
			}
		}

		if sender == cardView1.subviews[0] as! UIButton {
			cardView1.addSubview(QAView)
			moveTo(cardView1, point: point0)

			if cardView0.tag < cardView2.tag {
				view.bringSubviewToFront(cardView2)
				moveTo(cardView0, point: point1)
			} else {
				moveTo(cardView2, point: point1)
				view.bringSubviewToFront(cardView0)
				moveTo(cardView0, point: point2)
			}
		}

		if sender == cardView2 .subviews[0] as! UIButton {
			cardView2.addSubview(QAView)
			moveTo(cardView2, point: point0)

			if cardView0.tag < cardView1.tag {
				view.bringSubviewToFront(cardView1)
				moveTo(cardView1, point: point2)
				moveTo(cardView0, point: point1)
			} else {
				moveTo(cardView0, point: point2)
			}
		}
	}

	func selected(sender: UIButton) {
		let index = sender.tag - 100
		let selectedCard = cardViews[index]

		if selectedCard.frame.origin != point0 {

			for topCard in cardViews {
				if topCard.frame.origin == point0 {
					if topCard.tag == 10 {
						moveTo(topCard, point: point1)
					} else {
						view.bringSubviewToFront(view.viewWithTag(topCard.tag)!)
						moveTo(topCard, point: point2)
					}
				}
			}

			moveTo(selectedCard, point: point0)


		}
	}

	func moveTo(view: UIView, point: CGPoint) {
		UIView.animateWithDuration(0.8) { () -> Void in
			view.frame.origin = point
		}
	}

	func moveUp(view: UIView) {
		let distance = view.frame.origin.y - 20
		UIView.animateWithDuration(0.8) { () -> Void in
			view.transform = CGAffineTransformMakeTranslation(0, -distance)
		}
	}

	func moveDown(view: UIView) {
		let distance = view.tag != 12 ? view.frame.height - 100 : view.frame.height - 60
		UIView.animateWithDuration(0.8) { () -> Void in
			view.transform = CGAffineTransformMakeTranslation(0, distance)
		}
	}

}

extension ViewController: UITextFieldDelegate {

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		print(textField.tag)
		return true
	}
}







