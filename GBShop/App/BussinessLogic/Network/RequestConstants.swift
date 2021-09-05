//
//  RequestConstants.swift
//  GBShop
//
//  Created by Артем Зарудный on 05.09.2021.
//

import Foundation

class RequestConstants {

    let baseUrl: URL
    
    private init() {
        self.baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    }
    
    public static let shared = RequestConstants()
    
}
