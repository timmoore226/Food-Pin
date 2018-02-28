//
//  UINavigationController+Ext.swift
//  Food Pin
//
//  Created by Timothy Moore on 2/27/18.
//  Copyright © 2018 Tim Moore. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
