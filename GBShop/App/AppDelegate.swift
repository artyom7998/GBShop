//
//  AppDelegate.swift
//  GBShop
//
//  Created by Артем Зарудный on 23.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let auth = requestFactory.makeAuthRequestFatory()
           auth.login(userName: "Somebody", password: "mypassword") { response in
               switch response.result {
               case .success(let login):
              //  let user = login.user
                print(login)
               case .failure(let error):
                print(error.localizedDescription)
               }
           }
        
        let logout = requestFactory.makeLogoutRequestFatory()
        logout.logout(id_user: 666) { response in
            switch response.result {
            case .success(let result):
             print(result)
            case .failure(let error):
             print(error.localizedDescription)
            }
        }
        
        struct UserTestData {
            let id_user: Int = 666
            let username = "Somebody"
            let password = "mypassword"
            let email = "some@some.ru"
            let gender = "m"
            let credit_card = "9872389-2424-234224-234"
            let bio = "This is good! I think I will switch to another language"
        }
        
        let userTestData = UserTestData()
        
        let registration = requestFactory.makeRegistrationRequestFatory()
        registration.registration(id_user: userTestData.id_user, username: userTestData.username, password: userTestData.password, email: userTestData.email, gender: userTestData.gender, credit_card: userTestData.credit_card, bio: userTestData.bio) { response in
            switch response.result {
            case .success(let result):
             print(result)
            case .failure(let error):
             print(error.localizedDescription)
            }
        }
        
        let changeUserData = requestFactory.makeChangeUserDataRequestFatory()
        changeUserData.changeUserData(id_user: userTestData.id_user, username: userTestData.username, password: userTestData.password, email: userTestData.email, gender: userTestData.gender, credit_card: userTestData.credit_card, bio: userTestData.bio) { response in
            switch response.result {
            case .success(let result):
             print(result)
            case .failure(let error):
             print(error.localizedDescription)
            }
        }

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


}
