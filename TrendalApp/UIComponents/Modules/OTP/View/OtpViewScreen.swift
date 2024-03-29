//
//  OtpViewScreen.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 02.10.2023.
//

import SwiftUI

struct OtpViewScreen: View {
    @State private var isFocus = ""
    @State private var countdown: Int = 59
    @State private var timer: Timer? = nil
    @State private var isCodeCompleted = false
    
    var router = OTPRouter()
    
    var body: some View {
        ZStack {
            backgroundColor
            ScrollView {
                VStack {
                    BackButtonView()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Text("К вам летит СМС")
                        .font(Font.custom("SF Pro Display", size: 32))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 8)
                    Text(.init("""
Введите код который мы отправили на
номер \("[+7 747-271-1098 ](https://google.com)")
"""))
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color.fromHex("#6A7186"))
                    .tint(Color.white)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .bottom)
                    
                    OtpTextFieldView(smsToken: $isFocus, isCodeCompleted: $isCodeCompleted)
                        .frame(height: 56)
                        .padding(.top, 40)
                        .padding(.leading, 35)
                        .padding(.trailing, 35)
                        .padding(.bottom, 45)
                    
                    if countdown == 0 {
                        replyOtpView
                    } else {
                        HStack(spacing: 4) {
                            Spacer()
                            Text("Отправить код снова")
                                .font(Font.custom("Roboto", size: 14))
                                .foregroundColor(Color.fromHex("#6A7186"))
                                .multilineTextAlignment(.center)
                            
                            Text(String(format: "%02d:%02d", countdown / 60, countdown % 60))
                                .font(Font.custom("Roboto", size: 14))
                                .foregroundColor(Color.fromHex("#38BDF8"))
                                .multilineTextAlignment(.center)
                                .onAppear {
                                    startTimer()
                                }
                            
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
                if isCodeCompleted {
                    NavigationLink(
                        destination: router.navigateToOtp(),
                        isActive: $isCodeCompleted,
                        label: {
                            EmptyView()
                        }
                    )
                }
            }
        }
        .onChange(of: isCodeCompleted) { newValue in }
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Color.fromHex("#0F172A").ignoresSafeArea()
    }
    
    @ViewBuilder
    private var replyOtpView: some View {
        VStack(spacing: 4) {
            Text("Не пришел код?")
                .font(Font.custom("Roboto", size: 14))
                .foregroundColor(Color.fromHex("#6A7186"))
                .multilineTextAlignment(.center)
            
            Button("Отправить код снова") {
                
            }
            .font(Font.custom("Roboto", size: 14))
            .foregroundColor(Color.fromHex("#38BDF8"))
            .multilineTextAlignment(.center)
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if countdown > 0 {
                countdown -= 1
            } else {
                timer.invalidate()
            }
        }
    }
}

struct ThirdPage_Previews: PreviewProvider {
    static var previews: some View {
        OtpViewScreen()
    }
}
