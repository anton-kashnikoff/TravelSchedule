//
//  ThemeManager.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 17/04/2024.
//

import UIKit

final class ThemeManager {
    static let shared = ThemeManager()
    
    private init() {}
    
    func handleTheme(darkMode: Bool) {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            scene.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
        }
    }
}
