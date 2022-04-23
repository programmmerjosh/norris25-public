//
//  ResultsViewController.swift
//  Norris 25
//
//  Created by Joshua Van Niekerk on 09/05/2020.
//  Copyright © 2020 Josh-Dog101. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Lottie

class ResultsViewController: UIViewController {
    
    var percent     : Double = 0
    var questionaire: String = ""
    var down        : Bool   = false
    
    var txtAlertInsertion :UITextField?
    
    @IBOutlet weak var resultLabel              : UILabel!
    @IBOutlet weak var adBanner                 : GADBannerView!
    @IBOutlet private var successAnimationView  : AnimationView!
    @IBOutlet weak var share                    : UIButton!
    @IBOutlet weak var facebook                 : AnimationView!
    @IBOutlet weak var twitter                  : AnimationView!
    @IBOutlet weak var twitterInvisButtonOutlet : UIButton!
    @IBOutlet weak var facebookInvisButtonOutlet: UIButton!
    
    @IBAction func share(_ sender: UIButton) {
        dropdownShareButtons()
    }
    @IBAction func facebook(_ sender: UIButton) {
        promptIfTheyReallyWantToShare()
    }
    @IBAction func twitter(_ sender: UIButton) {
        promptIfTheyReallyWantToShare()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load social icon buttons
        addFbIcon()
        addTwitterIcon()
        
        // hide social buttons initially
        facebook.alpha                  = 0
        twitter.alpha                   = 0
        facebookInvisButtonOutlet.alpha = 0
        twitterInvisButtonOutlet.alpha  = 0
        
        // present animation and results
        startSuccessAnimation()
        
        let strPercent = String(format: "%.0f", percent)
        resultLabel.text = "You answered the \(questionaire) questionaire. Based on your answers, you are \(strPercent)% successful in this particular area."
        
        // load banner ads
        loadBanner()
    }

    func startSuccessAnimation() {
        let checkMarkAnimation =  AnimationView(name: "5184-success")
        successAnimationView.contentMode = .scaleAspectFit
        self.successAnimationView.addSubview(checkMarkAnimation)
        checkMarkAnimation.frame = self.successAnimationView.bounds
        checkMarkAnimation.loopMode = .repeat(2)
        checkMarkAnimation.play()
    }
    
    func dropdownShareButtons() {
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            if (!self.down) {
                self.facebook.alpha                  = 1
                self.facebookInvisButtonOutlet.alpha = 1
                
                self.facebook.transform                  = CGAffineTransform(translationX: 0, y: 52)
                self.facebookInvisButtonOutlet.transform = CGAffineTransform(translationX: 0, y: 52)
                self.view.bringSubviewToFront(self.facebookInvisButtonOutlet)
                
                self.twitter.alpha                  = 1
                self.twitterInvisButtonOutlet.alpha = 1
                
                self.twitter.transform                  = CGAffineTransform(translationX: 0, y: 100)
                self.twitterInvisButtonOutlet.transform = CGAffineTransform(translationX: 0, y: 100)
                self.view.bringSubviewToFront(self.twitterInvisButtonOutlet)
            } else {
                self.facebook.alpha                  = 0
                self.facebookInvisButtonOutlet.alpha = 0
                
                self.facebook.transform                  = CGAffineTransform(translationX: 0, y: 0)
                self.facebookInvisButtonOutlet.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.twitter.alpha                  = 0
                self.twitterInvisButtonOutlet.alpha = 0
                
                self.twitter.transform                  = CGAffineTransform(translationX: 0, y: 0)
                self.twitterInvisButtonOutlet.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        })
        
        // set corner radius
        twitter.layer.masksToBounds  = true
        twitter.layer.cornerRadius   = 52
        facebook.layer.masksToBounds = true
        facebook.layer.cornerRadius  = 52
        
        // drop down switch
        down = !down
    }
    
    func addFbIcon() {
        let fbIconImage         = UIImage(named: "fb-icon.png")
        let fbIcon              = UIImageView(image: fbIconImage!)
        
        fbIcon.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        facebook.addSubview(fbIcon)
    }
    
    func addTwitterIcon() {
        let twitterIconImage    = UIImage(named: "twitter-icon.png")
        let twitterIcon         = UIImageView(image: twitterIconImage)
        
        twitterIcon.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        twitter.addSubview(twitterIcon)
    }
    
    func addN25Image() {
        let fbIconImage         = UIImage(named: "fb-icon.png")
        let fbIcon              = UIImageView(image: fbIconImage!)
        
        fbIcon.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        facebook.addSubview(fbIcon)
    }
    
    public func promptIfTheyReallyWantToShare() {
        let alert = UIAlertController(title: "Whoops!", message: "Sorry, that was just for show. If you'd really like to share your results, you can! First, insert your name here and then click 'Share'", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField(configurationHandler: txtAlertInsertion)
        
        alert.addAction(UIAlertAction(title: "Share", style: UIAlertAction.Style.default, handler: { (action) in
            self.shareWindowPopUp()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func txtAlertInsertion(textfield: UITextField!) {
        txtAlertInsertion              = textfield
        txtAlertInsertion?.placeholder = "Your Name"
    }
    
    func shareWindowPopUp() {
        
        let strPercent = String(format: "%.0f", percent)
        guard let name:String = (self.txtAlertInsertion?.text) else { return }
        guard let image = UIImage(named: "N25_pic_for_sharing.png") else { return }
        
        // when the app is on the app store and good to go,
        // AND my website is accommodating visitors looking for the app,
        // then I can add the appropriate link to the share button
//        guard let url = URL(string: "https://programmmerjosh.com/") else { return }
        
        let text = "\(name) took the '\(questionaire)' questionaire on The Norris 25 App and results show that \(name) achieves \(strPercent)% success in this particular area."
        
//        let shareContent: [Any] = [image, text, url]
        let shareContent: [Any] = [image, text]
        
        let activityController = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
        self.present(activityController, animated: true)
    }
}
