//
//  Notification.swift
//  RecorderApp
//
//  Created by Samira Omer on 12/01/2023.
//

import SwiftUI

class NotificationManagerr {
    
    static let instance = NotificationManagerr()
    
    func requestAuthorization () {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error\(error)")
                
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotifications() {
        let content = UNMutableNotificationContent()
        content.title = "How was your day?"
        content.body = "Don't forget to talk about your day today?"
        content.sound = .default
//        content.badge = 1
        
        // calender
        var date = DateComponents()
        date.hour = 23
        date.minute  = 19
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

