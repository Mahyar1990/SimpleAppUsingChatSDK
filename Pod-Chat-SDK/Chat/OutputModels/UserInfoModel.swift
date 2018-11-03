//
//  UserInfoModel.swift
//  Chat
//
//  Created by Mahyar Zhiani on 7/23/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON

open class UserInfoModel {
    /*
     ---------------------------------------
     * responseAsJSON:
     *  - hasError     Bool
     *  - errorMessage String
     *  - errorCode    Int
     *  + result       JSON or UserInfoModel:
     *      + user          UserAsJSON
     *          - cellphoneNumber:    String?
     *          - email:              String?
     *          - id:                 Int?
     *          - image:              String?
     *          - lastSeen:           Int?
     *          - name:               String?
     *          - receiveEnable:      Bool?
     *          - sendEnable:         Bool?
     ---------------------------------------
     * responseAsModel:
     *  - hasError     Bool
     *  - errorMessage String
     *  - errorCode    Int
     *  + user         User
     ---------------------------------------
     */
    
    // user model properties
    let hasError:           Bool
    let errorMessage:       String
    let errorCode:          Int
    let user:               User
    
    var userJSON: JSON = [:]
    
    init(messageContent: JSON, hasError: Bool, errorMessage: String, errorCode: Int) {
        
        self.hasError           = hasError
        self.errorMessage       = errorMessage
        self.errorCode          = errorCode
        
        self.user = User(messageContent: messageContent)
        self.userJSON = user.formatToJSON()
    }
    
    public func returnDataAsJSON() -> JSON {
        let result: JSON = ["user": userJSON]
        
        let resultAsJSON: JSON = ["result": result,
                                  "hasError": hasError,
                                  "errorMessage": errorMessage,
                                  "errorCode": errorCode]
        
        return resultAsJSON
    }
    
}




open class BlockedUserModel {
    /*
     ---------------------------------------
     * responseAsJSON:
     *  - hasError     Bool
     *  - errorMessage String
     *  - errorCode    Int
     *  + result       JSON or UserInfoModel:
     *      + user          UserAsJSON
     *          - firstName:    String?
     *          - nickeName:    String?
     *          - lastName:     String?
     *          - id:           Int?
     ---------------------------------------
     * responseAsModel:
     *  - hasError      Bool
     *  - errorMessage  String
     *  - errorCode     Int
     *  + blockedUser   BlockedUserUser
     ---------------------------------------
     */
    
    let hasError:           Bool
    let errorMessage:       String
    let errorCode:          Int
    let blockedUser:        BlockedUser
    
    var blockedUserJSON:    JSON = [:]
    
    init(messageContent: JSON, hasError: Bool, errorMessage: String, errorCode: Int) {
        
        self.hasError           = hasError
        self.errorMessage       = errorMessage
        self.errorCode          = errorCode
        
        self.blockedUser = BlockedUser(messageContent: messageContent)
        self.blockedUserJSON = blockedUser.formatToJSON()
        
    }
    
    public func returnDataAsJSON() -> JSON {
        let result: JSON = ["blockedUser": blockedUserJSON]
        
        let resultAsJSON: JSON = ["result": result,
                                  "hasError": hasError,
                                  "errorMessage": errorMessage,
                                  "errorCode": errorCode]
        
        return resultAsJSON
    }
    
}



open class GetBlockedListModel {
    /*
     ---------------------------------------
     * responseAsJSON:
     *  - hasError     Bool
     *  - errorMessage String
     *  - errorCode    Int
     *  + result       JSON or BlockedListModel:
     *      - contentCount      Int
     *      - hasNext           Bool
     *      - nextOffset        Int
     *      + blockedUsers      BlockedListAsJSON
     *          - firstName:        String?
     *          - nickeName:        String?
     *          - lastName:         String?
     *          - id:               Int?
     ---------------------------------------
     * responseAsModel:
     *  - hasError      Bool
     *  - errorMessage  String
     *  - errorCode     Int
     *  + blockedUser   [BlockedUser]
     ---------------------------------------
     */
    
    // GetBlockedList model properties
    let hasError:           Bool
    let errorMessage:       String
    let errorCode:          Int
    
    // result model
    var contentCount:       Int = 0
    var hasNext:            Bool = false
    var nextOffset:         Int = 0
    var blockedList:        [BlockedUser] = []
    
    var blockedListJSON:    [JSON] = []
    
    init(messageContent: [JSON], contentCount: Int, count: Int, offset: Int, hasError: Bool, errorMessage: String, errorCode: Int) {
        
        self.hasError           = hasError
        self.errorMessage       = errorMessage
        self.errorCode          = errorCode
        
        let messageLength = messageContent.count
        self.contentCount = contentCount
        self.hasNext = false
        let x: Int = count + offset
        if (x < contentCount) && (messageLength > 0) {
            self.hasNext = true
        }
        self.nextOffset = offset + messageLength
        
        for item in messageContent {
            let blockedUser = BlockedUser(messageContent: item)
            let blockedUserJSON = blockedUser.formatToJSON()
            
            blockedList.append(blockedUser)
            blockedListJSON.append(blockedUserJSON)
        }
        
    }
    
    public func returnDataAsJSON() -> JSON {
        let result: JSON = ["contentCount": contentCount,
                            "hasNext":      hasNext,
                            "nextOffset":   nextOffset,
                            "blockedUsers": blockedListJSON]
        
        let resultAsJSON: JSON = ["result": result,
                                  "hasError": hasError,
                                  "errorMessage": errorMessage,
                                  "errorCode": errorCode]
        
        return resultAsJSON
    }
    
}













