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
        print("chatConnect")
    }
    
    func chatDisconnect() {
        print("chatConnected")
    }
    
    func chatReconnect() {
        print("chatReconnect")
    }
    
    func chatReady(withUserInfo: User) {
        print("chatReady: \n UserInfo = \(withUserInfo.formatToJSON())")
    }
    
    func chatState(state: Int) {
        print("chatState = \(state)")
    }
    
    
    func chatError(errorCode: Int, errorMessage: String, errorResult: Any?) {
        print("Error: \n errorCode = \(errorCode) \n errorMessage = \(errorMessage) \n errorResult = \(errorResult ?? "nil")")
    }
    
    
    
    func botEvents(model: BotEventModel) {
        print("botEvents: \n eventType = \(model.type)\n")
    }
    
    func contactEvents(model: ContactEventModel) {
        print("contactEvents: \n eventType = \(model.type) \n contacts = \(model.contacts)\n")
    }
    
    func fileUploadEvents(model: FileUploadEventModel) {
        print("fileUploadEvents: \n eventType = \(model.type)\n")
    }
    
    func messageEvents(model: MessageEventModel) {
        print("messageEvents: \n eventType = \(model.type) \n threadId = \(model.threadId) \n message = \(model.message)\n messageId = \(model.messageId)\n")
    }
    
    func systemEvents(model: SystemEventModel) {
        print("systemEvents: \n eventType = \(model.type) \n threadId = \(model.threadId) \n")
    }
    
    func threadEvents(model: ThreadEventModel) {
        print("threadEvents: \n eventType = \(model.type)\n threadId = \(model.threadId) \n threads = \(model.threads) \n")
        if let th = model.threads {
            print("here")
            print(th.first?.formatToJSON())
        }
    }
    
}

