//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Артем Зарудный on 24.08.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
