//
//  AppDelegate.swift
//  NotificacionesPush
//
//  Created by dam2 on 6/2/25.
//

import UIKit;
import UserNotifications;

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //UNUserNotificationCenter.setBadgeCount(<#T##self: UNUserNotificationCenter##UNUserNotificationCenter#>);
        
        //solicitar permiso para recibir notificaciones push
        let center = UNUserNotificationCenter.current();
        center.delegate = self;
        
        //alert es una alerta, badge es el iconito que pone el numero de mensajes, carplay es para sincronizar con pantallas de coches, criticalalert es un protocolo de alertas serias (nivel catastrofe natural, y requiere pedir permiso expresio a app para implementarlas, pues suena esté o no en silencio y vamos, no hay cojones a ignorarla. No es normal ni pedirlo ni que lo den)
        center.requestAuthorization(options: [.alert, .badge, .sound, .carPlay, .criticalAlert]) { granted , error in
            if granted {
                print("Permiso concedido");
            } else {
                print("Permiso denegado");
            }
        }
        
        if let notification = launchOptions?[.remoteNotification] as? [String : AnyObject], let aps = notification["aps"] as? [String : AnyObject], let contacto = notification["contacto"] as? String {
            print("Notificacion recibida de \(contacto) al iniciar la app \(aps)");
        }
        
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //mostrar la notificacion cuando la app este abierta
        //completionHandler([.badge, .sound]);
        
        //manejo manual
        let userInfo = notification.request.content.userInfo;
        if let mensaje = userInfo["contacto"] as? String {
            print("Notificacion recibida de \(mensaje)");
        }
        if let aps = userInfo["aps"] as? NSDictionary {
            let alert = aps.object(forKey: "alert") as! NSDictionary;
            print("Titulo de la notificacion: \(alert.object(forKey: "title"))");
        }
        completionHandler([]);
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo;
        
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

