//
//  KeychainService.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import Foundation

class KeychainService {
    
    func saveToken(_ accessToken: String, for key: String) {
        self.delete(for: key)
        let token = accessToken.data(using: String.Encoding.utf8)!
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key,
                                    kSecValueData as String: token]
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { return print("save error")
        }
    }
    
    func retriveToken(for key: String) -> String? {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key,
                                    kSecMatchLimit as String: kSecMatchLimitOne,
                                    kSecReturnData as String: kCFBooleanTrue ?? false]
        var retrivedData: AnyObject? = nil
        let _ = SecItemCopyMatching(query as CFDictionary, &retrivedData)
        guard let data = retrivedData as? Data else {return nil}
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    func delete(for key: String){
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key]
        let status = SecItemDelete(query as CFDictionary)//SecItemCopyMatching(query as CFDictionary, &retrivedData)
            if status == errSecSuccess {
                print("Successfully removed from keychain.")
            } else {
                
            }
    }
    
}

