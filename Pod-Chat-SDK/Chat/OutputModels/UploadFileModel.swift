//
//  UploadFileModel.swift
//  Chat
//
//  Created by Mahyar Zhiani on 8/5/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON

open class UploadFileModel {
    /*
     ---------------------------------------
     * responseAsJSON:
     *  - hasError          Bool
     *  - errorMessage      String
     *  - errorCode         Int
     *  + result       JSON or UploadFileModel:
     *      + UploadFile    UploadFileAsJSON
     *          - hashCode      String
     *          - id            Int
     *          - name          String
     ---------------------------------------
     * responseAsModel:
     *  - hasError          Bool
     *  - errorMessage      String
     *  - errorCode         Int
     *  + user              User
     ---------------------------------------
     */
    
    // uploadFile model properties
    public let hasError:           Bool
    public let errorMessage:       String
    public let errorCode:          Int
    public let uploadFile:         UploadFile
    
    public var uploadFileJSON: JSON = []
    
    init(messageContent: JSON, hasError: Bool, errorMessage: String, errorCode: Int) {
        
        self.hasError           = hasError
        self.errorMessage       = errorMessage
        self.errorCode          = errorCode
        
        self.uploadFile = UploadFile(messageContent: messageContent)
        self.uploadFileJSON = uploadFile.formatToJSON()
    }
    
    public func returnDataAsJSON() -> JSON {
        let result: JSON = ["uploadFile": uploadFileJSON]
        
        let resultAsJSON: JSON = ["result": result,
                                  "hasError": hasError,
                                  "errorMessage": errorMessage,
                                  "errorCode": errorCode]
        
        return resultAsJSON
    }
    
}
