//
//  NotificationViewController.swift
//  Notification Content Extension
//
//  Created by Jorge Martinez on 29/03/21.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        print("Did receive notification")
        self.label?.text = notification.request.content.body
    }

}
