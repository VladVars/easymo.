//
//  NotificationManager.swift
//  easymo.
//
//  Created by mac on 18.07.22.
//

import Foundation
import UserNotifications

final class NotificationManager {
    
    class func requestAutorezation(day: Int) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { succes, error in
            if succes {
                setNotification(day: day)
                print("Пользователь дал разрешение!")
            } else {
                print("Ничего пользователь не дал")
            }
        }
    }
    
    class func setNotification(day: Int) {
        let content = UNMutableNotificationContent()
        content.title =  "Уведомление"
        content.subtitle = "Не забудьте отложить на копилку"
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.day = day
        
//        let dateComponetns = calendar.dateComponents([.year, .month, .day], from: pushDate)
        let calendarTriger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: calendarTriger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
}
