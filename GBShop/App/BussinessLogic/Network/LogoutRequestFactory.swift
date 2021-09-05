//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Артем Зарудный on 05.09.2021.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(id_user: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
