//
//  AppDelegate.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 06/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import AVFoundation
import Alamofire
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    let googleApiKey = "AIzaSyDWx4G3isBWcBaaokwBPZ5UCIYx93bWBjI"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        UINavigationBar.appearance().barTintColor = Constants.App.navigationBarColor
        UINavigationBar.appearance().tintColor = UIColor.darkGray
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.darkGray]
        let loggedInStatus = AppPreferenceService.getInteger(PreferencesKeys.loggedInStatus)
        if loggedInStatus == IS_LOGGED_IN {
            self.openHomeViewController()
        } else {
            self.openSignInViewController()
        }
        Thread.sleep(forTimeInterval: 2.0)
        GMSServices.provideAPIKey(googleApiKey)
        
        //GIDSignIn.sharedInstance().clientID = "321505110953-rrdi1bhiec35e9usncs01si24sdoh67j.apps.googleusercontent.com"
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Phoenix_Errands")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    public func openSignInViewController(){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "IntroVC") as! IntroVC
        navigationController = UINavigationController.init(rootViewController: controller)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = true
        //UIApplication.shared.statusBarView?.backgroundColor =  UIColor.white
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.default
        nav?.tintColor = UIColor.black
    }
    
    public func openHomeViewController(){
        let storyBoard = UIStoryboard(name: "Dashboard", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        navigationController = UINavigationController.init(rootViewController: controller)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.blue
    }
    
    public static func appDelagate() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func isReachable() -> Bool{
        if let isReachable = reachabilityManager?.isReachable {
            return isReachable
        }
        return false
    }
    func startNetworkReachabilityObserver() {
        reachabilityManager?.listener = { status in
            
            switch status {
                
            case .notReachable:
                print("The network is not reachable")
                
            case .unknown :
                print("It is unknown whether the network is reachable")
                
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
                
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
            }
        }
        reachabilityManager?.startListening()
    }
}

