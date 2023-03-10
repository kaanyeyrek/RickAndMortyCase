//
//  CheckFirstLoginMethod.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/10/23.
//

import Foundation
// check first login for userdefaults
final class CheckFirstLoginMethod {
    
    static let shared = CheckFirstLoginMethod()
    
    func isNewUser() -> Bool {
        return UserDefaults.standard.bool(forKey: "isNewUser")
    }
    func notNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
