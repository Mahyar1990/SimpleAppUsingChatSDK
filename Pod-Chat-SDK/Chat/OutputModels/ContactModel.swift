//
//  ContactModel.swift
//  Chat
//
//  Created by Mahyar Zhiani on 7/23/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON


open class ContactModel {
    /*
     ---------------------------------------
     * responseAsJSON:
     *  - hasError      Bool
     *  - errorMessage  String?
     *  - errorCode     Int?
     *  - contentCount  Int
     *  + result            JSON:
     *      - cellphoneNumber     String?
     *      - email               String?
     *      - firstName           String?
     *      - hasUser             Bool?
     *      - id                  Int?
     *      - image               String?
     *      - lastName            String?
     *      - linkedUser          LinkedUser?
     *      - notSeenDuration     Int?
     *      - uniqueId            Bool?
     *      - userId              Int?
     ---------------------------------------
     * responseAsModel:
     *  - hasError      Bool
     *  - errorMessage  String
     *  - errorCode     Int
     *  + result        [Contact]
     ---------------------------------------
     */
    
    // AddContactcs model properties
    public let hasError:           Bool
    public let errorMessage:       String?
    public let errorCode:          Int?
    public var contentCount:       Int = 0
    
    // result model
    public var contacts:           [Contact] = []
    
    public var contactsJSON:       [JSON] = []
    
    init(messageContent: JSON) {
        
        self.hasError           = messageContent["hasError"].boolValue
        self.errorMessage       = messageContent["message"].string
        self.errorCode          = messageContent["errorCode"].int
        self.contentCount       = messageContent["count"].intValue
        
        if let result = messageContent["result"].array {
            for item in result {
                let tempContact = Contact(messageContent: item)
                let tempContactJSON = tempContact.formatToJSON()
                
                self.contacts.append(tempContact)
                self.contactsJSON.append(tempContactJSON)
            }
        }
    }
    
    public func returnDataAsJSON() -> JSON {
        let finalResult: JSON = ["result": contactsJSON,
                                 "hasError": hasError,
                                 "errorMessage": errorMessage ?? NSNull(),
                                 "errorCode": errorCode ?? NSNull(),
                                 "contentCount": contentCount]
        
        return finalResult
    }
}
