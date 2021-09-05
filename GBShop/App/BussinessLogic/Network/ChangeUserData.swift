//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Артем Зарудный on 05.09.2021.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = RequestConstants.shared.baseUrl
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangeUserData: ChangeUserDataRequestFactory {
    func changeUserData(id_user: Int, username: String, password: String, email: String, gender: String, credit_card: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void) {
        
        let requestModel = ChangeUserData(baseUrl: baseUrl, id_user: id_user, username: username, password: password, email: email, gender: gender, credit_card: credit_card, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
        
    }
}

extension ChangeUserData {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        
        let id_user: Int
        let username: String
        let password: String
        let email: String
        let gender: String
        let credit_card: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "id_user": id_user,
                "username": username,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": credit_card,
                "bio": bio
            ]
        }
    }
}
