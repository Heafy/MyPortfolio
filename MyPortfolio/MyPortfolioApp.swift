//
//  MyPortfolioApp.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 26/03/21.
//

import SwiftUI

@main
struct MyPortfolioApp: App {
    var body: some Scene {
        WindowGroup {
            TabMenuView()
                .supportDarkMode()
                .onAppear {
                    let customNotificationCategory = UNNotificationCategory(identifier: "customNotificationCategory", actions: [], intentIdentifiers: [], options: [])
                    UNUserNotificationCenter.current().setNotificationCategories([customNotificationCategory])
                }
        }
    }
}
