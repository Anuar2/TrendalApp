//
//  CommonConstants.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation
import UIKit

struct CommonConstants {
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    
    static let generalHorizontalPadding: CGFloat = 32.deviceWidthRatioValue
    
    static let navigationBarHeight: CGFloat = 44
    
    static var statusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
             return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        }
        else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
    
}
