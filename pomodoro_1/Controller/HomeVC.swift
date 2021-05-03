//
//  HomeVC.swift
//  pomodoro_1
//
//  Created by X Y on 5/3/21.
//

import UIKit

class HomeVC: UIViewController {
    
    private var completedCycles = 0
    
    let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 30
        return stack
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let startBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("START", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.systemIndigo
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()
    
    
    deinit {
        //TODO: Remove observers
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("receivedNotificaiton"), object: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pomodoro App 🍅"
        setup()
        setLabel()
        
        startBtn.addTarget(self, action: #selector(openTimer), for: .touchUpInside)
        
        //TODO: Add observers
        NotificationCenter.default.addObserver(self, selector: #selector(receivedNotification(_:)), name: NSNotification.Name(rawValue: ("ReceivedNotification")), object: nil)
    }
    
    //MARK: Notifications

    @objc func receivedNotification(_ notification:Notification) {
        // TODO: Update value of completed cycles
        completedCycles += 1
        // TODO: Update message label
        messageLabel.text = "You have completed:\(completedCycles) cycles today"
        
    }
    
    //MARK: Navigation
    @objc func openTimer(){
        self.navigationController?.pushViewController(TimerVC(), animated: true)
    }
    
    //MARK: Create UI
    func setup(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(contentStack)
        contentStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        contentStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        contentStack.addArrangedSubview(startBtn)
        startBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        contentStack.addArrangedSubview(messageLabel)
    }
    
    func setLabel(){
        let highlightAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.systemIndigo]
        let firstString = NSMutableAttributedString(string: "You have completed ")
        let secondString = NSAttributedString(string: "\(completedCycles)", attributes: highlightAttributes)
        let thirdString = NSAttributedString(string: " cycles today")
        firstString.append(secondString)
        firstString.append(thirdString)
        messageLabel.attributedText = firstString
    }
}


