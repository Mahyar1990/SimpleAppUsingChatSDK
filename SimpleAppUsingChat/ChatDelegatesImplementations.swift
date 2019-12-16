//
//  ChatDelegatesImplementations.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 9/19/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import FanapPodChatSDK


extension MyViewController: ChatDelegates {
    
    func chatConnect() {
        //
    }
    
    func botEvents(type: BotEventTypes, result: Any) {
        //
    }
    
    func fileUploadEvents(type: FileUploadEventTypes, result: Any) {
        //
    }
    
    func systemEvents(type: SystemEventTypes, result: Any) {
        //
    }
    
    func chatConnected() {
        //
    }
    
    func chatDisconnect() {
        //
    }
    
    func chatReconnect() {
        //
    }
    
    func chatState(state: Int) {
        //
    }
    
    func chatReady(withUserInfo: User) {
        //
    }
    
    func contactEvents(type: ContactEventTypes, result: Any) {
        //
    }
    
    func chatDeliver(messageId: Int, ownerId: Int) {
        //
    }
    
    func messageEvents(type: MessageEventTypes, result: Any) {
        let theType = (type == MessageEventTypes.MESSAGE_NEW) ? "new" : "delete"
        print("messageEvent Comes: \n messageType = \(theType) \n messageId = \((result as! Message).id)\n message = \((result as! Message).message)\n\n")
    }
    
    func threadEvents(type: ThreadEventTypes, result: Any) {
        //
    }
    
    func chatError(errorCode: Int, errorMessage: String, errorResult: Any?) {
        print("Error: \n errorCode = \(errorCode) \n errorMessage = \(errorMessage) \n errorResult = \(errorResult ?? "nil")")
    }
    
}

