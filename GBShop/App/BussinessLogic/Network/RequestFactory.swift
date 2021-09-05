//
//  RequestFactory.swift
//  GBShop
//
//  Created by Артем Зарудный on 24.08.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
         return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
     }
    
    func makeLogoutRequestFatory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
         return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
     }
    
    func makeRegistrationRequestFatory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
         return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
     }
    
    func makeChangeUserDataRequestFatory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
         return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
     }
 }
