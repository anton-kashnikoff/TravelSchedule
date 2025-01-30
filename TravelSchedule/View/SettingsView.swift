//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 17/04/2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var isPresentWebView = false
    
    @Binding var darkModeEnabled: Bool
    
    var body: some View {
            VStack {
                HStack {
                    Text(Constants.darkThemeText)
                        .padding(.leading)
                        .foregroundStyle(.blackYP)
                    
                    Spacer()
                    Toggle("", isOn: $darkModeEnabled)
                        .padding(.trailing)
                        .tint(.blueUniversal)
                        .onChange(of: darkModeEnabled) {
                            ThemeManager.shared.handleTheme(darkMode: darkModeEnabled)
                        }
                }
                .frame(height: 60)
                
                HStack {
                    Text(Constants.privacyPolicyText)
                        .padding(.leading)
                        .foregroundStyle(.blackYP)
                    
                    Spacer()
                    Image(.chevron)
                        .padding(.trailing)
                }
                .frame(height: 60)
                .onTapGesture {
                    isPresentWebView = true
                }
                
                Spacer()
                Text(Constants.apiAlertText)
                    .font(.system(size: 12))
                    .foregroundStyle(.blackYP)
                
                Spacer()
                    .frame(height: 16)
                
                Text(Constants.apiVersionText)
                    .font(.system(size: 12))
                    .foregroundStyle(.blackYP)
                
                Spacer()
                    .frame(height: 24)
                
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundStyle(.black.opacity(0.3))
            }
            .background(.whiteYP)
            .toolbarRole(.editor)
            .sheet(isPresented: $isPresentWebView) {
                WebView(url: URL(string: "https://yandex.ru/legal/timetable_api/")!)
            }
    }
}

#Preview {
    @Previewable @State var darkModeEnabled = false
    
    SettingsView(darkModeEnabled: $darkModeEnabled)
}
