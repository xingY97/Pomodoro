//
//  TomatoesView.swift
//  pomodoro_1
//
//  Created by X Y on 5/3/21.
//

import Foundation
import UIKit

class TomatoesView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var tomatoImages : [UIImageView]!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        Bundle.main.loadNibNamed("TomatoesView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func updateTomatoes(to tomatoes: Int) {
        var currentTomato = 1
        for tomatoIcon in tomatoImages {
            tomatoIcon.alpha = currentTomato <= tomatoes ? 1.0 : 0.2
            currentTomato += 1
        }
    }
}
