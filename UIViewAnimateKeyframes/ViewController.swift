//
//  ViewController.swift
//  UIViewAnimateKeyframes
//
//  Created by Roni Leshes on 26/03/2018.
//  Copyright © 2018 Roni Leshes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    override func viewDidLayoutSubviews() {

        //Setup button ui
        self.button.layer.cornerRadius = self.button.frame.height / 2
    }
    

    @IBAction func buttonPressed(_ sender: Any) {
//        animateWithUIView()
        animateWithKeyFrames()
    }
    
    func animateWithUIView(){
        UIView.animate(withDuration: 0.25, animations: {
        //1.Expansion
            self.button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (completed) in
            UIView.animate(withDuration: 0.25, animations: {
                //2.Shrink
                self.button.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            }) { (completed) in
                UIView.animate(withDuration: 0.25, animations: {
                    //3.Grant momentum
                    self.button.frame.origin.x -= 16
                }) { (completed) in
                    UIView.animate(withDuration: 0.25, animations: {
                        //4.Move out of screen and reduce alpha to 0
                        self.button.frame.origin.x = self.view.frame.size.width
                        self.button.alpha = 0.0
                    }) { (completed) in
                        //Completion of whole animation sequence
                    }
                }
            }
        }
    }
    
    
    
    func animateWithKeyFrames(){
        //Total animation duration is 1.0 seconds - This time is inside the
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                //1.Expansion + button label alpha
                self.button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                //2.Shrink
                self.button.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                //3.Grant momentum
                self.button.frame.origin.x -= 16
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                //4.Move out of screen and reduce alpha to 0
                self.button.frame.origin.x = self.view.frame.size.width
                self.button.alpha = 0.0
            })
        }) { (completed) in
            //Completion of whole animation sequence
        }
    }
    
}

