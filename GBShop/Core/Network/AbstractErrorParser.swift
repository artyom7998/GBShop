//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Артем Зарудный on 24.08.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
