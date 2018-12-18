//
//  DataFormatters.swift
//  Chat
//
//  Created by Mahyar Zhiani on 6/4/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON


open class getContactsRequestModel {
    
    public let count:       Int?
    public let offset:      Int?
    public let name:        String?
    public let typeCode:    String?
    
    init(count: Int?, offset: Int?, name: String?, typeCode: String?) {
        self.count      = count
        self.offset     = offset
        self.name       = name
        self.typeCode   = typeCode
    }
    
}


open class getThreadsRequestModel {
    
    public let count:               Int?
    public let offset:              Int?
    public let name:                String?
    public let new:                 Bool?
    public let threadIds:           [Int]?
    public let typeCode:            String?
    public let metadataCriteria:    JSON?
    
    init(count: Int?, offset: Int?, name: String?, new: Bool?, threadIds: [Int]?, typeCode: String?, metadataCriteria: JSON?) {
        self.count              = count
        self.offset             = offset
        self.name               = name
        self.new                = new
        self.threadIds          = threadIds
        self.typeCode           = typeCode
        self.metadataCriteria   = metadataCriteria
    }
    
}


//open class createThreadsRequestModel {
//    
//    public let count:           Int?
//    public let offset:          Int?
//    public let name:            String?
//    public let new:             Bool?
//    public let typeCode:        String?
//    
//    public let threadIdsId:     Int?
//    
//    
//    public let metaDataId:      Int?
//    public let metaDataType:    String?
//    public let metaDataOwner:   String?
//    
//    init(count: Int?, offset: Int?, name: String?, new: Bool?, typeCode: String?) {
//        self.count      = count
//        self.offset     = offset
//        self.name       = name
//        self.new        = new
//        self.typeCode   = typeCode
//        
//        
//    }
//    
//}




