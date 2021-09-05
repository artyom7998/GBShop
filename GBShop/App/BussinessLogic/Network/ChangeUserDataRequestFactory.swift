//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Артем Зарудный on 05.09.2021.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(id_user: Int, username: String, password: String, email: String, gender: String, credit_card: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
}
