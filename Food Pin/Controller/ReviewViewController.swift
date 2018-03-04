//
//  ReviewViewController.swift
//  Food Pin
//
//  Created by Timothy Moore on 3/3/18.
//  Copyright © 2018 Tim Moore. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    @IBOutlet var closeButton: UIButton!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: restaurant.image)
        
        // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // Set rate buttons off screen to the right on load
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        // Make the rate buttons invisible and move off the screen
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        // Set Close button off screen to the top on load
        let moveUpTransform = CGAffineTransform.init(translationX: 0, y: -100)
        
        // Make the close button inivisible and move off screen
        closeButton.alpha = 0
        closeButton.transform = moveUpTransform
    }

    override func viewWillAppear(_ animated: Bool) {
        // Slide in the close button
        UIView.animate(withDuration: 0.4, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: [], animations: {
            self.closeButton.alpha = 1.0
            self.closeButton.transform = .identity
        }, completion: nil)
        
        // Slide in the rate buttons
        var delay = 0.1
        for button in 0...self.rateButtons.count-1 {
            UIView.animate(withDuration: 0.4, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: [], animations: {
                self.rateButtons[button].alpha = 1.0
                self.rateButtons[button].transform = .identity
            }, completion: nil)
            delay += 0.05
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
