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
    
    init(count:     Int?,
         offset:    Int?,
         name:      String?,
         typeCode:  String?) {
        
        self.count      = count
        self.offset     = offset
        self.name       = name
        self.typeCode   = typeCode
    }
    
}

open class addContactsRequestModel {
    
    public let firstName:       String?
    public let lastName:        String?
    public let cellphoneNumber: String?
    public let email:           String?
    
    init(firstName:         String?,
         lastName:          String?,
         cellphoneNumber:   String?,
         email:             String?) {
        
        self.firstName          = firstName
        self.lastName           = lastName
        self.cellphoneNumber    = cellphoneNumber
        self.email              = email
    }
    
}

open class updateContactsRequestModel {
    
    public let id:              Int
    public let firstName:       String
    public let lastName:        String
    public let cellphoneNumber: String
    public let email:           String
    
    init(id:                Int,
         firstName:         String,
         lastName:          String,
         cellphoneNumber:   String,
         email:             String) {
        
        self.id                 = id
        self.firstName          = firstName
        self.lastName           = lastName
        self.cellphoneNumber    = cellphoneNumber
        self.email              = email
    }
    
}

open class removeContactsRequestModel {
    
    public let id:  Int
    
    init(id: Int) {
        self.id = id
    }
    
}

open class blockContactsRequestModel {
    
    public let contactId:   Int
    public let typeCode:    String?
    
    init(contactId: Int, typeCode: String?) {
        self.contactId  = contactId
        self.typeCode   = typeCode
    }
    
}

open class getBlockedContactListRequestModel {
    
    public let count:       Int?
    public let offset:      Int?
    public let typeCode:    String?
    
    init(count:     Int?,
         offset:    Int?,
         typeCode:  String?) {
        
        self.count      = count
        self.offset     = offset
        self.typeCode   = typeCode
    }
    
}

open class unblockContactsRequestModel {
    
    public let blockId:     Int
    public let typeCode:    String?
    
    init(blockId: Int, typeCode: String?) {
        self.blockId    = blockId
        self.typeCode   = typeCode
    }
    
}

open class searchContactsRequestModel {
    
    public let firstName:       String?
    public let lastName:        String?
    public let cellphoneNumber: String?
    public let email:           String?
    public let id:              Int?
    public let size:            Int?
    public let offset:          Int?
    public let uniqueId:        String?
//    public let typeCode:        String?
    
    init(firstName:         String?,
         lastName:          String?,
         cellphoneNumber:   String?,
         email:             String?,
         id:                Int?,
         size:              Int?,
         offset:            Int?,
         uniqueId:          String?) {
        
        self.firstName          = firstName
        self.lastName           = lastName
        self.cellphoneNumber    = cellphoneNumber
        self.email              = email
        self.id                 = id
        self.size               = size
        self.offset             = offset
        self.uniqueId           = uniqueId
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
    
    init(count:             Int?,
         offset:            Int?,
         name:              String?,
         new:               Bool?,
         threadIds:         [Int]?,
         typeCode:          String?,
         metadataCriteria:  JSON?) {
        
        self.count              = count
        self.offset             = offset
        self.name               = name
        self.new                = new
        self.threadIds          = threadIds
        self.typeCode           = typeCode
        self.metadataCriteria   = metadataCriteria
    }
    
}

open class getHistoryRequestModel {
    
    public let threadId:            Int
    public let count:               Int?
    public let offset:              Int?
    public let firstMessageId:      Int?
    public let lastMessageId:       Int?
    public let order:               String?
    public let query:               String?
    public let typeCode:            String?
    public let metadataCriteria:    JSON?
    
    init(threadId:          Int,
         count:             Int?,
         offset:            Int?,
         firstMessageId:    Int?,
         lastMessageId:     Int?,
         order:             String?,
         query:             String?,
         typeCode:          String?,
         metadataCriteria:  JSON?) {
        
        self.threadId           = threadId
        self.count              = count
        self.offset             = offset
        self.firstMessageId     = firstMessageId
        self.lastMessageId      = lastMessageId
        self.order              = order
        self.query              = query
        self.typeCode           = typeCode
        self.metadataCriteria   = metadataCriteria
    }
    
}

open class createThreadRequestModel {

    public let title:               String
    public let type:                String?
    public let invitees:            [Invitee]
    public let uniqueId:            String?

    init(title:     String,
         type:      String?,
         invitees:  [Invitee],
         uniqueId:  String?) {
        
        self.title      = title
        self.type       = type
        self.invitees   = invitees
        self.uniqueId   = uniqueId
    }

}

open class creatThreadWithMessageRequestModel {
    
    public let threadTitle:         String
    public let threadType:          String?
    public let threadInvitees:      [Invitee]
    public let uniqueId:            String?
    public let messageContent:          String
    public let messageMetaDataId:       Int?
    public let messageMetaDataType:     String?
    public let messageMetaDataOwner:    String?
    
    
    init(threadTitle:           String,
         threadType:            String?,
         threadInvitees:        [Invitee],
         uniqueId:              String?,
         messageContent:        String,
         messageMetaDataId:     Int?,
         messageMetaDataType:   String?,
         messageMetaDataOwner:  String?) {
        
        self.uniqueId       = uniqueId
        
        self.threadTitle    = threadTitle
        self.threadType     = threadType
        self.threadInvitees = threadInvitees
        self.messageContent         = messageContent
        self.messageMetaDataId      = messageMetaDataId
        self.messageMetaDataType    = messageMetaDataType
        self.messageMetaDataOwner   = messageMetaDataOwner
    }
    
}

open class muteAndUnmuteThreadRequestModel {
    
    public let subjectId:   Int
    public let typeCode:    String?
    
    init(subjectId: Int, typeCode: String?) {
        self.subjectId  = subjectId
        self.typeCode   = typeCode
    }
    
}

open class getThreadParticipantsRequestModel {
    
    public let threadId:            Int
    public let count:               Int?
    public let offset:              Int?
    public let firstMessageId:      Int?
    public let lastMessageId:       Int?
    public let name:                String?
    public let typeCode:            String?
    
    init(threadId:          Int,
         count:             Int?,
         offset:            Int?,
         firstMessageId:    Int?,
         lastMessageId:     Int?,
         name:              String?,
         typeCode:          String?) {
        
        self.threadId           = threadId
        self.count              = count
        self.offset             = offset
        self.firstMessageId     = firstMessageId
        self.lastMessageId      = lastMessageId
        self.name               = name
        self.typeCode           = typeCode
    }
    
}

open class AddParticipantsRequestModel {
    
    public let threadId:            Int
    public let contacts:            [Int]
    public let uniqueId:            String?
    public let typeCode:            String?
    
    init(threadId:  Int,
         contacts:  [Int],
         uniqueId:  String?,
         typeCode:  String?) {
        
        self.threadId           = threadId
        self.contacts           = contacts
        self.uniqueId           = uniqueId
        self.typeCode           = typeCode
    }
    
}

open class RemoveParticipantsRequestModel {
    
    public let threadId:            Int
    public let content:             [Int]
    public let uniqueId:            String?
    public let typeCode:            String?
    
    init(threadId:  Int,
         content:   [Int],
         uniqueId:  String?,
         typeCode:  String?) {
        
        self.threadId           = threadId
        self.content            = content
        self.uniqueId           = uniqueId
        self.typeCode           = typeCode
    }
    
}

open class LeaveThreadRequestModel {
    
    public let threadId:            Int
    public let content:             [Int]
    public let uniqueId:            String?
    public let typeCode:            String?
    
    init(threadId:  Int,
         content:   [Int],
         uniqueId:  String?,
         typeCode:  String?) {
        
        self.threadId           = threadId
        self.content            = content
        self.uniqueId           = uniqueId
        self.typeCode           = typeCode
    }
    
}


open class SendTextMessageRequestModel {
    
    public let threadId:            Int
    public let content:             String
    public let repliedTo:           Int?
    public let uniqueId:            String?
    public let systemMetadata:      JSON?
    public let metaData:            JSON?
    public let typeCode:            String?
    
    init(threadId:          Int,
         content:           String,
         repliedTo:         Int?,
         uniqueId:          String?,
         typeCode:          String?,
         systemMetadata:    JSON?,
         metaData:          JSON?) {
        
        self.threadId           = threadId
        self.content            = content
        self.repliedTo          = repliedTo
        self.uniqueId           = uniqueId
        self.typeCode           = typeCode
        self.systemMetadata     = systemMetadata
        self.metaData           = metaData
    }
    
}


open class EditTextMessageRequestModel {
    
    public let subjectId:           Int
    public let content:             String
    public let repliedTo:           Int?
    public let uniqueId:            String?
    public let metaData:            JSON?
    public let typeCode:            String?
    
    init(subjectId:         Int,
         content:           String,
         repliedTo:         Int?,
         uniqueId:          String?,
         typeCode:          String?,
         metaData:          JSON?) {
        
        self.subjectId          = subjectId
        self.content            = content
        self.repliedTo          = repliedTo
        self.uniqueId           = uniqueId
        self.typeCode           = typeCode
        self.metaData           = metaData
    }
    
}




























