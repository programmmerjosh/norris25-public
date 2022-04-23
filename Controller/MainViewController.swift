//
//  ViewController.swift
//  Norris 25
//
//  Created by Joshua Van Niekerk on 08/05/2020.
//  Copyright © 2020 Josh-Dog101. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainViewController: UIViewController {
    
    let questionaires       = Questionaires()
    
    var currentQuestionaire = 0
    var currentQuestion     = 0
    var currentScore        = 0

    @IBOutlet weak var infoLabel1: UILabel!
    @IBOutlet weak var infoLabel2: UILabel!
    @IBOutlet weak var exit      : UIButton!
    @IBOutlet weak var adBanner  : GADBannerView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func exitAction(_ sender: UIButton) {
        showResults()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        let percent       = Double(currentScore) / Double(questionaires.list[currentQuestionaire].questions.count) * 100
        let title         = questionaires.list[currentQuestionaire].title
        
        destinationVC.percent       = percent
        destinationVC.questionaire  = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBanner() // found in Ads.swift file
        
        if let questionaire = UserDefaults.standard.string(forKey: "questionaire"), questionaire != "" { // q in progress
            if let question = UserDefaults.standard.string(forKey: "question") {
                currentQuestion = Int(question)!
                currentQuestionaire = Int(questionaire)!
                loadQuestion(currentQuestionaire, currentQuestion)
            }
            
            if let score = UserDefaults.standard.string(forKey: "score") {
                currentScore = Int(score)!
            }
            startQuestions()
        } else { // user NOT busy with q
            loadQuestionaireNames()
        }
    }
    
    fileprivate func positionButtons() {
        // lets figure out yes and no buttons
        let y: Int = Int(UIViewController().view.frame.height - 160)
        let width: Int = Int((UIViewController().view.frame.width - 12) / 2)
        let buttonHeight = Int(UIViewController().view.frame.height - 100) / 5
        
        var catergoryY = 40
        
        for case let button as CustomButton in self.view.subviews {
            if button.tag > 777 { // yes and no buttons
                
                if button.tag == 999 {
                    button.frame = button.positionButtonFrame(xCoordinate: 4, yCoordinate: y, width: width)
                    
                }
                if button.tag == 888 {
                    button.frame = button.positionButtonFrame(xCoordinate: width + 8, yCoordinate: y, width: width)
                }
            } else {
                button.frame = button.positionButtonFrame(yCoordinate: catergoryY, width: width * 2)
                catergoryY += buttonHeight
            }
        }
    }
    
    // event listener for orientation change
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
         super.viewWillTransition(to: size, with: coordinator)
        positionButtons()
    }
    
    @objc func yesClicked(_ sender: CustomButton) { // add to score
        sender.shake()
        currentScore += 1
        keepScoreAndSaveValues()
    }
    @objc func noClicked(_ sender: CustomButton) { // don't add to score
        sender.shake()
        keepScoreAndSaveValues()
    }
    
    private func keepScoreAndSaveValues() {
        let numOfQuestions = questionaires.list[currentQuestionaire].questions.count - 1
        
        if (currentQuestion < numOfQuestions) { // NOT last q
            currentQuestion += 1
            loadQuestion(currentQuestionaire, currentQuestion)
            
            UserDefaults.standard.set(String(currentQuestionaire), forKey: "questionaire")
            UserDefaults.standard.set(String(currentQuestion), forKey: "question")
            UserDefaults.standard.set(String(currentScore), forKey: "score")
        } else { // reached end of Q's
            showResults()
        }
    }
    
    func loadQuestionaireNames() {
        
        infoLabel1.alpha  = 0
        infoLabel2.alpha  = 0
        exit.alpha        = 0
        titleLabel.alpha  = 0
        
        for case let button as CustomButton in self.view.subviews {
            if button.tag > 777 { // yes and no buttons
                button.alpha = 0
            }
            button.removeFromSuperview()
        }
        
        var i = 0
        for list in questionaires.list {
            let titleButton = CustomButton()
            
            if (view.frame.width > 450) {
                titleButton.setupButton(buttonType: 2, title: list.title, largeScreen: true)
            } else {
                titleButton.setupButton(buttonType: 2, title: list.title)
            }
            
            titleButton.tag = i
            titleButton.addTarget(self, action: #selector(questionaireSelected), for: .touchUpInside)
            view.addSubview(titleButton)
            i += 1
        }
        positionButtons()
    }
    
    func loadQuestion(_ questionaire: Int = 1, _ question: Int = 1) {
        
        if (currentQuestion % 2 == 0) {
            self.infoLabel1.text   = questionaires.list[questionaire].questions[question]
        } else {
            self.infoLabel2.text   = questionaires.list[questionaire].questions[question]
        }
        
        titleLabel.text  = questionaires.list[questionaire].title
        titleLabel.alpha = 1
        exit.alpha       = 1
        sweetSlideFadeAnimation()
    }
    
    @objc func questionaireSelected(_ sender: CustomButton) {
        
        sender.shake()
        currentQuestionaire = sender.tag
        loadQuestion(currentQuestionaire, currentQuestion)
        
        UIView.animate(withDuration: 0.8) {
            for case let button as CustomButton in self.view.subviews {
                if button.tag < 777 { // question buttons
                    button.alpha = 0
                }
            }
            self.startQuestions()
        }
    }
    
    func showResults() {
        
        performSegue(withIdentifier: "toResults", sender: self)
        loadQuestionaireNames()
        
        currentQuestionaire = 0
        currentQuestion     = 0
        currentScore        = 0
        UserDefaults.standard.removeObject(forKey: "questionaire")
        UserDefaults.standard.removeObject(forKey: "question")
        UserDefaults.standard.removeObject(forKey: "score")
    }
    
    private func startQuestions() {
        
        let yesButton = CustomButton()
        let noButton = CustomButton()
        
        if (view.frame.width > 450) { // basically just increase font size if iPad as opposed to iPhone
            yesButton.setupButton(largeScreen: true)
            noButton.setupButton(buttonType: 0, largeScreen: true)
        } else {
            yesButton.setupButton()
            noButton.setupButton(buttonType: 0)
        }
        
        yesButton.addTarget(self, action: #selector(yesClicked), for: .touchUpInside)
        noButton.addTarget(self, action: #selector(noClicked), for: .touchUpInside)
        
        view.addSubview(yesButton)
        view.addSubview(noButton)
        
        positionButtons()
    }
    
    // slides the questions out and into the center of the screen beautifully
    @objc fileprivate func sweetSlideFadeAnimation() {
        
        let toX = CGFloat(UIViewController().view.frame.width + 100) * (-1)
        let fromX = CGFloat(UIViewController().view.frame.width + 100) * 2
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            if (self.currentQuestion % 2 == 0 ) {
                self.infoLabel2.transform = CGAffineTransform(translationX: toX, y: 0)
            } else {
                self.infoLabel1.transform = CGAffineTransform(translationX: toX, y: 0)
            }
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                if (self.currentQuestion % 2 == 0 ) {
                    self.infoLabel2.alpha = 0
                } else {
                    self.infoLabel1.alpha = 0
                }
            })
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
                    
            if (self.currentQuestion % 2 == 0 ) {
                self.infoLabel1.transform = CGAffineTransform(translationX: fromX, y: 0)
            } else {
                self.infoLabel2.transform = CGAffineTransform(translationX: fromX, y: 0)
            }
        }) { (_) in
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                if (self.currentQuestion % 2 == 0 ) {
                    self.infoLabel1.alpha = 1
                    self.infoLabel1.transform = CGAffineTransform(translationX: 0, y: 0)
                } else {
                    self.infoLabel2.alpha = 1
                    self.infoLabel2.transform = CGAffineTransform(translationX: 0, y: 0)
                }
            })
        }
    }
}

