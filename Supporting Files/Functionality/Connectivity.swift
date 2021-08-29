//
//  ConnectivityViewController.swift
//  C4ME
//
//  Created by Omar Waked on 4/12/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Alamofire
import Lottie
import Firebase

class ConnectivityViewController: UIViewController {
    var connectionAnimation = LOTAnimationView()
    var explanationLabel = UILabel()
    let noConnectionAnimationView = LOTAnimationView(name: "connectivity")
    let reachabilityManager = NetworkReachabilityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        checkForConnection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.reloadInputViews()
    }
    
    func checkForConnection(){
        reachabilityManager?.startListening()
        reachabilityManager?.listener = { _ in
            if let isNetworkReachable = self.reachabilityManager?.isReachable, isNetworkReachable == true {
                self.connectionFound()
                print("network available")
            }else{
                print("netowrk not available")
            }
        }
    }
    
    func createLabel(){
        explanationLabel.text = "Connection Lost. \nLooking for Connection."
        explanationLabel.frame = CGRect(x: 7.5, y: noConnectionAnimationView.frame.maxY + 0.6, width: self.view.frame.width - 15, height: 150)
        explanationLabel.textColor = UIColor.white
        explanationLabel.textAlignment = NSTextAlignment.center
        explanationLabel.font = UIFont(name: font, size: 25.0)
        explanationLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        explanationLabel.numberOfLines = 4
        view.addSubview(explanationLabel)
    }
    
    func createConnectionAnimation(){
        noConnectionAnimationView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        noConnectionAnimationView.center = self.view.center
        noConnectionAnimationView.animationSpeed = 0.8
        noConnectionAnimationView.contentMode = .scaleAspectFill
        noConnectionAnimationView.loopAnimation = true
        view.addSubview(noConnectionAnimationView)
        noConnectionAnimationView.play { (false) in
            if self.reachabilityManager?.isReachable == true{
                self.noConnectionAnimationView.removeFromSuperview()
            }
        }
    }
    
    func connectionFound(){
        var blacksubView = UIView()
        blacksubView = UIView(frame: UIScreen.main.bounds)
        blacksubView.backgroundColor = UIColor.black
        UIApplication.shared.keyWindow!.addSubview(blacksubView)
        
        let animationView = LOTAnimationView(name: "success")
        animationView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        animationView.center = self.view.center
        animationView.animationSpeed = 0.25
        animationView.contentMode = .scaleAspectFill
        view.addSubview(animationView)
        UIApplication.shared.keyWindow!.addSubview(animationView)
        self.view.bringSubviewToFront(animationView)
        
        let label = UILabel()
        label.text = "Network Connection Found."
        label.frame = CGRect(x: 7.5, y: animationView.frame.maxY + 0.2, width: self.view.frame.width - 15, height: 150)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 4
        label.font = UIFont(name: font, size: 25.0)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        UIApplication.shared.keyWindow!.addSubview(label)
        
        animationView.play { (false) in
            self.noConnectionAnimationView.removeFromSuperview()
            self.explanationLabel.removeFromSuperview()
            animationView.removeFromSuperview()
            blacksubView.removeFromSuperview()
            label.removeFromSuperview()
            if Auth.auth().currentUser != nil {
                let viewController = TabBarViewController()
                self.present(viewController, animated: true, completion: nil)
            }else{
                let viewController = startView()
                self.present(viewController, animated: true, completion: nil)
            }
        }
    }
    
    
    func setupView(){
        self.view.backgroundColor = .black
        createConnectionAnimation()
        createLabel()
    }
    
}
