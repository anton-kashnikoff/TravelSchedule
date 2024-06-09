//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 17/04/2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var darkModeEnabled: Bool
    
    @State private var path = [String]()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                    path.append("PrivacyPolicyView")
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
            .navigationDestination(for: String.self) { id in
                if id == "PrivacyPolicyView" {
                    PrivacyPolicyView()
                }
            }
        }
        .background(.whiteYP)
        .toolbarRole(.editor)
    }
}

#Preview {
    SettingsView(darkModeEnabled: .constant(false))
}
