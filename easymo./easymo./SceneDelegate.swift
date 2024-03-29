//
//  SceneDelegate.swift
//  easymo.
//
//  Created by mac on 5.06.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var overLayWindow: UIWindow?
    var scene: UIWindowScene?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.scene = windowScene
        
//        if DefaultsManager.isFirstLaunch {
//            firsLaunch()
//        } else {
//            DefaultsManager.isFirstLaunch = false
//        }
        if DefaultsManager.loginPassword {
            changeMainScreen()
        } else {
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: InputVC(nibName: String(describing: InputVC.self), bundle: nil))
        window?.makeKeyAndVisible()
        }
        subscribeOnNotification()
        
        guard let scene = (scene as? UIWindowScene) else { return }
        self.scene = scene
    }
//    @objc func firsLaunch() {
//        guard let windowScene = scene else { return }
//
//        window = UIWindow(windowScene: windowScene)
//        window?.windowScene = windowScene
//        window?.rootViewController = UINavigationController(rootViewController: FirstInputVC(nibName: String(describing: FirstInputVC.self), bundle: nil))
//        window?.makeKeyAndVisible()
//    }
    
    @objc private func changeMainScreen() {
        guard let windowScene = scene else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
    }
    
    private func subscribeOnNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeMainScreen), name: .loginSuccess, object: nil)
        
    }
    

    private func createOvaerLayWindow() {
        
        guard let scene = scene else {
            return
        }

        overLayWindow = UIWindow(windowScene: scene)
        overLayWindow?.rootViewController = OverLayVC(nibName: String(describing: OverLayVC.self), bundle: nil)
        overLayWindow?.makeKeyAndVisible()
    }
    
    private func clearOvaerLayWindow() {
        overLayWindow = nil
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       clearOvaerLayWindow()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        createOvaerLayWindow()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = InputVC()
        window?.makeKeyAndVisible()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

