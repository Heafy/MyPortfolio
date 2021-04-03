//
//  NotificationViewModel.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/03/21.
//

import SwiftUI

class NotificationViewModel: ObservableObject {
    
    var notifications = [Notification]()
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
            granted, error in
            if granted == true && error == nil {
                print("Notifications permitted")
            } else {
                print("Notifications not permitted")
            }
        }
    }
    
    func sendNotification(title: String, subtitle: String?, body: String, launchIn: Double) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            guard settings.authorizationStatus == .authorized else { return }
            let content = UNMutableNotificationContent()
            content.categoryIdentifier = "customNotificationCategory"
            //let content = UNMutableNotificationContent()
            content.title = "Titulo"
            content.subtitle = "Subtítulo"
            content.body = "Disclaimer: No pongan publicidad en notificaciones, es feo"
            content.sound = UNNotificationSound.default
            // show this notification five seconds from now
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            // choose a random identifier
            let request = UNNotificationRequest(identifier: "customNotificationRequest", content: content, trigger: trigger)
            // add our notification request
            UNUserNotificationCenter.current().add(request)
        }
    }
    
}
