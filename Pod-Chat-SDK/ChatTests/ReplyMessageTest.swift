//
//  ReplyMessageTest.swift
//  ChatTests
//
//  Created by Mahyar Jananeh on 7/8/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import SwiftyJSON
import XCTest
@testable import Chat


class SpyDelegateReplyMessage: ChatDelegates {
    
    var somethingWithDelegateAsyncResult: Bool? = .none
    var asyncExpectation: XCTestExpectation?
    
    func chatConnected() {}
    func chatDisconnect() {}
    func chatReconnect() {}
    func messageEvents(type: String, result: JSON) {}
    func chatDeliver(messageId: Int, ownerId: Int) {}
    func chatThreadEvents() {}
    func chatReady() {
        guard let expectation = asyncExpectation else {
            XCTFail("SpyDelegateGetUserInfo was not setup correctly. Missing XCTExpectation reference")
            return
        }
        print("\n\n\n******************************")
        print("Chat is Ready")
        print("******************************\n")
//        expectation.fulfill()
    }
    func chatError(errorCode: Int, errorMessage: String, errorResult: Any?) {}
    func chatState(state: Int) {}
    func threadEvents(type: String, result: JSON) {}
}


class ReplyMessageTest: XCTestCase {
    
    var somethingWithDelegateAsyncResult: Bool? = .none
    var somethingWithDelegateAsyncResult2: Bool? = .none
    var myChatObject: Chat?
    
    let socketAddress           = "ws://172.16.106.26:8003/ws"
    let serverName              = "chat-server"
    let token                   = "7a18deb4a4b64339a81056089f5e5922"    // ialexi
    //    let token                   = "6421ecebd40b4d09923bcf6379663d87"    // iFelfeli
    //    let token                   = "7cba09ff83554fc98726430c30afcfc6"
    //    let token                   = "6421ecebd40b4d09923bcf6379663d87"
    //    let token = "fbd4ecedb898426394646e65c6b1d5d1"                            //  {**REQUIRED**} SSO Token JiJi
    //    let token = "5fb88da4c6914d07a501a76d68a62363"                            // {**REQUIRED**} SSO Token FiFi
    //    let token = "bebc31c4ead6458c90b607496dae25c6"                            // {**REQUIRED**} SSO Token Alexi
    //    let token = "e4f1d5da7b254d9381d0487387eabb0a"                            // {**REQUIRED**} SSO Token Felfeli
    
    let ssoHost                 = "http://172.16.110.76"
    let platformHost            = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} Platform Core Address
    let fileServer              = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} File Server Address
    let wsConnectionWaitTime    = 1                                     // Time out to wait for socket to get ready after open
    let connectionRetryInterval = 5                                     // Time interval to retry registering device or registering server
    let connectionCheckTimeout  = 10                                    // Socket connection live time on server
    let messageTtl              = 86400                                 // Message time to live
    let reconnectOnClose        = true                                  // auto connect to socket after socket close
    
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // MARK: - test with params: [subjectId: 1133,repliedTo: 15397,content: 'empty message']
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    func test_Reply_Message_uniqueId_response() {
        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)
        
        let spyDelegate = SpyDelegateReplyMessage()
        myChatObject?.delegate = spyDelegate
        
        let theExpectation = expectation(description: "Chat calls the delegate as the result of an async method completion")
        theExpectation.isInverted = true
        spyDelegate.asyncExpectation = theExpectation
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            let myExpectationUniqueId = self.expectation(description: "send message uniqueId")
            let paramsToSend: JSON = ["subjectId": 1133,"repliedTo": 15397,"content": "empty message"]
            self.myChatObject?.replyMessageWith3Callbacks(params: paramsToSend, uniqueId: { (uniqueIdResponse) in
                print("\n\n**********************************************")
                print("Send Message with params: [subjectId: 1133,repliedTo: 15397,content: 'empty message'] UniqueId Test Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(uniqueIdResponse)")
                print("**********************************************")
                print("**********************************************\n\n")
            }, onSent: { (sentResponse) in
                self.somethingWithDelegateAsyncResult = true
                print("\n\n**********************************************")
                print("Send Message with params: [subjectId: 1133,repliedTo: 15397,content: 'empty message'] Sent Test Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(sentResponse)")
                print("**********************************************")
                print("**********************************************\n\n")
                myExpectationUniqueId.fulfill()
            }, onDelivere: { (deliverResponse) in }, onSeen: { (seenResponse) in })
            
            self.waitForExpectations(timeout: 12) { error in
                if let error = error {
                    XCTFail("waitForExpectationsWithTimeout errored: \(error)")
                }
                guard let result = self.somethingWithDelegateAsyncResult else {
                    XCTFail("Expected delegate to be called")
                    return
                }
                XCTAssertTrue(result)
            }
            
        }
        
    }
    
    
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // MARK: - test with params: [subjectId: 1133,repliedTo: 15397,content: 'empty message']
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    func test_Reply_Message_deliver_response() {
        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)
        
        let spyDelegate = SpyDelegateReplyMessage()
        myChatObject?.delegate = spyDelegate
        
        let theExpectation = expectation(description: "Chat calls the delegate as the result of an async method completion")
        theExpectation.isInverted = true
        spyDelegate.asyncExpectation = theExpectation
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            let myExpectationUniqueId = self.expectation(description: "send message uniqueId")
            let paramsToSend: JSON = ["subjectId": 1133,"repliedTo": 15397,"content": "empty message"]
            self.myChatObject?.replyMessageWith3Callbacks(params: paramsToSend, uniqueId: { (uniqueIdResponse) in
                print("\n\n**********************************************")
                print("Send Message with params: [subjectId: 1133,repliedTo: 15397,content: 'empty message'] UniqueId Test Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(uniqueIdResponse)")
                print("**********************************************")
                print("**********************************************\n\n")
            }, onSent: { (sentResponse) in
                print("\n\n**********************************************")
                print("Send Message with params: [subjectId: 1133,repliedTo: 15397,content: 'empty message'] Sent Test Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(sentResponse)")
                print("**********************************************")
                print("**********************************************\n\n")
            }, onDelivere: { (deliverResponse) in
                self.somethingWithDelegateAsyncResult = true
                print("\n\n**********************************************")
                print("Send Message with params: [subjectId: 1133,repliedTo: 15397,content: 'empty message'] Deliver Test Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(deliverResponse)")
                print("**********************************************")
                print("**********************************************\n\n")
                myExpectationUniqueId.fulfill()
            }, onSeen: { (seenResponse) in })
            
            self.waitForExpectations(timeout: 20) { error in
                if let error = error {
                    XCTFail("waitForExpectationsWithTimeout errored: \(error)")
                }
                guard let result = self.somethingWithDelegateAsyncResult else {
                    XCTFail("Expected delegate to be called")
                    return
                }
                XCTAssertTrue(result)
            }
            
        }
        
    }
    
}











