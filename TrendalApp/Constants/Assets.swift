//
//  Assets.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation
import UIKit
import SwiftUI


internal enum Assets: String {
    //MainPage
    case model
    case chooseJobsIcon
    
    public var name: String {
        return self.rawValue
    }
    
    public var image: UIImage? {
        return UIImage(named: rawValue)
    }
}
