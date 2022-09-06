//
//  AppDelegate.swift
//  DocusignApp
//
//  Created by JacobVinu on 02/09/22.
//

import UIKit
import DocuSignSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupDocusign()
        setupTheme()
        return true
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
    private func setupDocusign() {
        var configurations = DSMManager.defaultConfigurations()
        configurations[DSM_SETUP_OFFLINE_SIGNING_HIDE_ALERTS_KEY] = DSM_SETUP_TRUE_VALUE
        configurations[DSM_SETUP_ICLOUD_DOCUMENT_ENABLED] = DSM_SETUP_FALSE_VALUE
        DSMManager.setup(withConfiguration: configurations)
    }
    
    private func setupTheme() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)
        ]
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }


}

