//
//  TokenModel.swift
//  BHBeta
//
//  Created by corneliu postolache on 10/18/21.
//

import Foundation

struct RefreshTokenResponse: Codable {
    var response: Bool
    var data: RefreshTokenData?
}

struct RefreshTokenData: Codable {
    var token: TokenDetails?
}


struct TokenDetails: Codable {
    var accessToken: String?
    var tokenType: String?
    var expiresIn: Double?
    var userID: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case userID = "user_id"
    }
}

