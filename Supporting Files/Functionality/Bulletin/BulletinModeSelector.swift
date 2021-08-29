//
//  BulletinModeSelector.swift
//  C4ME
//
//  Created by Omar Waked on 9/8/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import BLTNBoard

/**
 * A subclass of page bulletin item that plays an haptic feedback when the buttons are pressed.
 *
 * This class demonstrates how to override `PageBLTNItem` to customize button tap handling.
 */

class ModePageBLTNItem: BLTNPageItem {
    
    private let feedbackGenerator = UISelectionFeedbackGenerator()
    
    override func actionButtonTapped(sender: UIButton) {
        
        // Play an haptic feedback
        
        feedbackGenerator.prepare()
        feedbackGenerator.selectionChanged()
        
        // Call super
        
        super.actionButtonTapped(sender: sender)
        
    }
    
    override func alternativeButtonTapped(sender: UIButton) {
        
        // Play an haptic feedback
        
        feedbackGenerator.prepare()
        feedbackGenerator.selectionChanged()
        
        // Call super
        
        super.alternativeButtonTapped(sender: sender)
        
    }
    
}
