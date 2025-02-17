//
//  ViewController.swift
//  NotificacionesPush
//
//  Created by dam2 on 6/2/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func push(_ sender: Any) {
        let content = UNMutableNotificationContent();
        content.title = "Notificacion de prueba";
        content.body = "Esta es una notificacion de prueba que estamos enviando"
        content.sound = .default;
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false);
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger);
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error al agregar la notificacion: \(error.localizedDescription)");
            }
        }
    }
    
}

