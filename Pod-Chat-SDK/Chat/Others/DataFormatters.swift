//
//  DataFormatters.swift
//  Chat
//
//  Created by Mahyar Zhiani on 6/4/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON


open class GetContactsRequestModel {
    
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

open class AddContactsRequestModel {
    
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

open class UpdateContactsRequestModel {
    
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

open class RemoveContactsRequestModel {
    
    public let id:  Int
    
    init(id: Int) {
        self.id = id
    }
    
}

open class BlockContactsRequestModel {
    
    public let contactId:   Int
    public let typeCode:    String?
    
    init(contactId: Int, typeCode: String?) {
        self.contactId  = contactId
        self.typeCode   = typeCode
    }
    
}

open class GetBlockedContactListRequestModel {
    
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

open class UnblockContactsRequestModel {
    
    public let blockId:     Int
    public let typeCode:    String?
    
    init(blockId: Int, typeCode: String?) {
        self.blockId    = blockId
        self.typeCode   = typeCode
    }
    
}

open class SearchContactsRequestModel {
    
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







open class GetThreadsRequestModel {
    
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

open class GetHistoryRequestModel {
    
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

open class CreateThreadRequestModel {

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

open class CreateThreadWithMessageRequestModel {
    
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

open class MuteAndUnmuteThreadRequestModel {
    
    public let subjectId:   Int
    public let typeCode:    String?
    
    init(subjectId: Int, typeCode: String?) {
        self.subjectId  = subjectId
        self.typeCode   = typeCode
    }
    
}

open class GetThreadParticipantsRequestModel {
    
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

open class ReplyTextMessageRequestModel {
    
    public let subjectId:           Int
    public let content:             String
    public let repliedTo:           Int
    public let uniqueId:            String?
    public let metaData:            JSON?
    public let typeCode:            String?
    
    init(subjectId:         Int,
         content:           String,
         repliedTo:         Int,
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

open class ForwardMessageRequestModel {
    
    public let subjectId:           Int
    public let messageIds:          [Int]
    public let repliedTo:           Int?
    public let metaData:            JSON?
    public let typeCode:            String?
    
    init(subjectId:         Int,
         messageIds:        [Int],
         repliedTo:         Int?,
         typeCode:          String?,
         metaData:          JSON?) {
        
        self.subjectId          = subjectId
        self.messageIds         = messageIds
        self.repliedTo          = repliedTo
        self.typeCode           = typeCode
        self.metaData           = metaData
    }
    
}

open class SendFileMessageRequestModel {
    
    public let fileName:    String?
    public let imageName:   String?
    public let xC:          String?
    public let yC:          String?
    public let hC:          String?
    public let wC:          String?
    public let threadId:    Int?
    
    public let subjectId:   Int?
    public let repliedTo:   Int?
    public let content:     String?
    public let metaData:    JSON?
    public let typeCode:    String?
    
    public let imageToSend: Data?
    public let fileToSend: Data?
    
    init(fileName:      String?,
         imageName:     String?,
         xC:            String?,
         yC:            String?,
         hC:            String?,
         wC:            String?,
         threadId:      Int?,
         subjectId:     Int?,
         repliedTo:     Int?,
         content:       String?,
         metaData:      JSON?,
         typeCode:      String?,
         imageToSend:   Data?,
         fileToSend:    Data?) {
        
        self.fileName       = fileName
        self.imageName      = imageName
        self.xC             = xC
        self.yC             = yC
        self.hC             = yC
        self.wC             = yC
        self.threadId       = threadId
        
        self.subjectId      = subjectId
        self.repliedTo      = repliedTo
        self.content        = content
        self.metaData       = metaData
        self.typeCode       = typeCode
        
        self.imageToSend    = imageToSend
        self.fileToSend     = fileToSend
    }
    
}

open class DeleteMessageRequestModel {
    
    public let subjectId:           Int?
    public let deleteForAll:        JSON
    public let uniqueId:            String?
    public let typeCode:            String?
    
    init(subjectId:         Int?,
         deleteForAll:      JSON,
         uniqueId:          String?,
         typeCode:          String?) {
        
        self.subjectId          = subjectId
        self.deleteForAll       = deleteForAll
        self.uniqueId           = uniqueId
        self.typeCode           = typeCode
    }
    
}

open class UploadImageRequestModel {
    
    public let fileExtension:       String?
    public let fileName:            String?
    public let fileSize:            Int?
    public let threadId:            Int?
    public let uniqueId:            String?
    public let originalFileName:    String?
    public let xC:                  Int?
    public let yC:                  Int?
    public let hC:                  Int?
    public let wC:                  Int?
    public let dataToSend:          Data
    
    init(fileExtension:     String?,
         fileName:          String,
         fileSize:          Int?,
         threadId:          Int,
         uniqueId:          String?,
         originalFileName:  String?,
         xC:                Int?,
         yC:                Int?,
         hC:                Int?,
         wC:                Int?,
         dataToSend:        Data) {
        
        self.fileExtension      = fileExtension
        self.fileName           = fileName
        self.fileSize           = fileSize
        self.threadId           = threadId
        self.uniqueId           = uniqueId
        self.originalFileName   = originalFileName
        self.xC                 = xC
        self.yC                 = yC
        self.hC                 = hC
        self.wC                 = wC
        self.dataToSend         = dataToSend
    }
    
}

open class UploadFileRequestModel {
    
    public let fileExtension:       String?
    public let fileName:            String?
    public let fileSize:            Int?
    public let threadId:            Int?
    public let uniqueId:            String?
    public let originalFileName:    String?
    public let dataToSend:          Data
    
    init(fileExtension:     String?,
         fileName:          String,
         fileSize:          Int?,
         threadId:          Int,
         uniqueId:          String?,
         originalFileName:  String?,
         dataToSend:        Data) {
        
        self.fileExtension      = fileExtension
        self.fileName           = fileName
        self.fileSize           = fileSize
        self.threadId           = threadId
        self.uniqueId           = uniqueId
        self.originalFileName   = originalFileName
        self.dataToSend         = dataToSend
    }
    
}

open class UpdateThreadInfoRequestModel {
    
    public let subjectId:   Int?
    public let image:       String?
    public let description: String?
    public let title:       String?
    public let metadata:    JSON?
    public let typeCode:    String?
    
    init(subjectId:     Int?,
         image:         String,
         description:   String?,
         title:         String,
         metadata:      JSON?,
         typeCode:      String?) {
        
        self.subjectId      = subjectId
        self.image          = image
        self.description    = description
        self.title          = title
        self.metadata       = metadata
        self.typeCode       = typeCode
    }
    
}

open class SpamPvThreadRequestModel {
    
    public let threadId:   Int?
    public let typeCode:    String?
    
    init(threadId:      Int?,
         typeCode:      String?) {
        
        self.threadId       = threadId
        self.typeCode       = typeCode
    }
    
}

open class MessageDeliverySeenListRequestModel {
    
    public let count:       Int?
    public let offset:      Int?
    public let typeCode:    String?
    public let messageId:   Int?
    
    init(count:     Int?,
         offset:    Int?,
         typeCode:  String?,
         messageId: Int?) {
        
        self.count      = count
        self.offset     = offset
        self.typeCode   = typeCode
        self.messageId  = messageId
    }
    
}


open class DeliverSeenRequestModel {
    
    public let messageId:   Int
    public let ownerId:     Int
    public let typeCode:    String?
    
    init(messageId: Int,
         ownerId:   Int,
         typeCode:  String?) {
        
        self.messageId  = messageId
        self.ownerId    = ownerId
        self.typeCode   = typeCode
    }
    
}














