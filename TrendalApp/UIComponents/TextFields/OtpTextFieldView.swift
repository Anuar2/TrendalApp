//
//  OtpTextFieldView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI
import Combine

final class Constants {
    public static let PINCODE_LENGTH: Int = 4
    public static let OTP_CODE_LENGTH: Int = 4
    public static let COUNTDOWN_TIMER_LENGTH = 5
}

enum FocusField: Hashable {
    case field
    case other
}

public struct OtpTextFieldView: View {
    
    @Binding var smsToken: String
    @Binding var isCodeCompleted: Bool
    @State private var isLoading: Bool = false
    
    @FocusState private var focusedField: FocusField?
        
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(smsToken: Binding<String>, isCodeCompleted: Binding<Bool>){
        self._smsToken = smsToken
        self._isCodeCompleted = isCodeCompleted
    }
    
    private var backgroundTextField: some View {
        return TextField("", text: $smsToken)
            .frame(width: 0, height: 0, alignment: .center)
            .font(Font.system(size: 0))
            .accentColor(.blue)
            .foregroundColor(.blue)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
        
            .onReceive(Just(smsToken)) { _ in limitText(Constants.OTP_CODE_LENGTH) }
            .focused($focusedField, equals: .field)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.focusedField = .field
                }
            }
            .padding()
    }
    
    func getPin(at index: Int) -> String {
        guard self.smsToken.count > index else {
            return ""
        }
        return self.smsToken[index]
    }
    
    func isFocusedPinLabel(at index: Int) -> Color {
        if self.smsToken.count - 1 == index {
            return Color.white
        } else {
            return Color.white
        }
    }
    
    func limitText(_ upper: Int) {
        if self.smsToken.count >= upper {
            self.smsToken = String(self.smsToken.prefix(upper))
            isCodeCompleted = true
        }
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            backgroundTextField

            HStack(spacing: 15) {
                ForEach(0..<4) { index in
                    ZStack {
                        Text(getPin(at: index))
                            .font(Font.custom("SF Pro Display", size: 16))
                            .modifier(MaxSize(alignment: .center))
                            .frame(maxWidth: .infinity, maxHeight: 64)
                            .background(isFocusedPinLabel(at: index))
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.fromHex("#597766"), lineWidth: 1)
                            )
                        
                        
                        Rectangle()
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 64)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.fromHex("38BDF8").opacity(0.2),
                                            lineWidth: 1)
                            )
                            .opacity(smsToken.count <= index ? 1 : 0)
                    }
                }
            }
        }
        .onAppear { }
        .onDisappear {
            self.smsToken = ""
            self.isCodeCompleted = false
        }
    }
}
    
struct OtpTextFieldView_Previews: PreviewProvider {
    @State static var smsTokenPreview: String = ""
    @State static var isCodeComplete: Bool = false
    
    static var previews: some View {
        OtpTextFieldView(smsToken: $smsTokenPreview, isCodeCompleted: $isCodeComplete)
    }
}
    
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
