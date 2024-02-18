//
//  DismissableView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 18.02.2024.
//

import SwiftUI

/// A type that represents a part of a modaly presented view
/// and can be dismissed.
public protocol DismissableView: View {
    func dismiss(completion: @escaping () -> Void)
}
