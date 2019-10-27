//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2019/10/27.
//

import UIKit

public protocol Trackable {}

extension UIView {
    private static var isTrackingEnabled: Bool = false
    
    public static func enableTracking() {
        guard !isTrackingEnabled else { return }
        let from = class_getInstanceMethod(UIView.self, #selector(UIView.didMoveToSuperview))!
        let to = class_getInstanceMethod(UIView.self, #selector(UIView.rts_didMoveToSuperview))!
        method_exchangeImplementations(from, to)
    }
    
    @objc func rts_didMoveToSuperview() {
        rts_didMoveToSuperview()
        
        if let trackableView = self as? UIView & Trackable {
            if !viewReferences.contains(trackableView) {
                viewReferences.add(trackableView)
            }
        }
    }
}
