//
//  IntExtension.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation
import UIKit


extension Int {
    var deviceHeightRatioValue: CGFloat {
        return CGFloat(self) * CommonConstants.deviceHeight / 812
    }
    
    var deviceWidthRatioValue: CGFloat {
        return CGFloat(self) * CommonConstants.deviceWidth / 375
    }
}

extension Int {
    enum SafeAreaInset {
        case top
        case bottom
    }
    
    func withSafeAreaInset(_ inset: SafeAreaInset) -> CGFloat {
        guard let window = UIApplication.shared.windows.first else {
            return 0
        }
        let topPadding = window.safeAreaInsets.top
        let bottomPadding = window.safeAreaInsets.bottom
        
        switch inset {
        case .top:
            return CGFloat(self) + topPadding
        case .bottom:
            return CGFloat(self) + bottomPadding
        }
    }
}

extension Int {
    var numberString: String {
        guard self < 10 else { return "0" }
        return String(self)
    }
}
