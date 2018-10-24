//
//  MessageChangeState.swift
//  Chat
//
//  Created by Mahyar Zhiani on 7/23/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON


//#######################################################################################
//#############################      MessageChangeState        (formatDataToMakeMessageChangeState)
//#######################################################################################

class MessageChangeState {
    /*
     * + MessageChangeStateVO       {object}
     *    - messageId               {long}
     *    - participantId           {long}
     *    - conversationId          {long}
     */
    
    let messageId:  Int?
    let senderId:   Int?
    let threadId:   Int?
    
    init(messageContent: JSON) {
        self.messageId  = messageContent["messageId"].int
        self.senderId   = messageContent["senderId"].int
        self.threadId   = messageContent["messageId"].int
    }
    
    func formatDataToMakeMessageChangeState() -> MessageChangeState {
        return self
    }
    
    func formatToJSON() -> JSON {
        let result: JSON = ["messageId":        messageId ?? NSNull(),
                            "senderId":         senderId ?? NSNull(),
                            "messageId":        messageId ?? NSNull()]
        return result
    }
    
}
