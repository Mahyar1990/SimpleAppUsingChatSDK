//
//  GetThreadTest.swift
//  ChatTests
//
//  Created by Mahyar Zhiani on 6/24/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import SwiftyJSON
import XCTest
@testable import Chat


class SpyDelegateGetThreads: ChatDelegates {
    
//    var somethingWithDelegateAsyncResult: Bool? = .none
    var asyncExpectation: XCTestExpectation?
    
    func chatConnected() {}
    func chatDisconnect() {}
    func chatReconnect() {}
    func chatMessageEvents() {}
    func messageEvents(type: String, result: JSON) {}
    func chatDeliver(messageId: Int, ownerId: Int) {}
    func chatReady() {
        guard let expectation = asyncExpectation else {
            XCTFail("SpyDelegateGetThreadList was not setup correctly. Missing XCTExpectation reference")
            return
        }
        print("\n\n\n******************************")
        print("Chat is Ready")
        print("******************************\n")
//        somethingWithDelegateAsyncResult = true
//        expectation.fulfill()
    }
    func chatError(errorCode: Int, errorMessage: String, errorResult: Any?) {}
    func chatState(state: Int) {}
    func threadEvents(type: String, result: JSON) {}
}


class GetThreadsTest: XCTestCase {
    var somethingWithDelegateAsyncResult: Bool? = .none
    var myChatObject: Chat?
    
    // SandBox Addresses:
    let socketAddress           = "wss://chat-sandbox.pod.land/ws"
    let serverName              = "chat-server"
    let ssoHost                 = "https://accounts.pod.land"
    let platformHost            = "https://sandbox.pod.land:8043/srv/basic-platform"    // {**REQUIRED**} Platform Core Address
    let fileServer              = "http://sandbox.fanapium.com:8080"                    // {**REQUIRED**} File Server Address
    let token                   = "71772fa079334cab831d5226a7e2b7f9"
    
    // Local Addresses
//    let socketAddress           = "ws://172.16.106.26:8003/ws"
//    let serverName              = "chat-server"
//    let ssoHost                 = "http://172.16.110.76"
//    let platformHost            = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} Platform Core Address
//    let fileServer              = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} File Server Address
//    let token                   = "62e07ed1de2d48ab93575bd873f6a51d"
//    let token                   = "7a18deb4a4b64339a81056089f5e5922"    // ialexi
//    let token                   = "6421ecebd40b4d09923bcf6379663d87"    // iFelfeli
//    let token                   = "6421ecebd40b4d09923bcf6379663d87"
//    let token = "fbd4ecedb898426394646e65c6b1d5d1" //  {**REQUIRED**} SSO Token JiJi
//    let token = "5fb88da4c6914d07a501a76d68a62363" // {**REQUIRED**} SSO Token FiFi
//    let token = "bebc31c4ead6458c90b607496dae25c6" // {**REQUIRED**} SSO Token Alexi
//    let token = "e4f1d5da7b254d9381d0487387eabb0a" // {**REQUIRED**} SSO Token Felfeli
    
    let wsConnectionWaitTime    = 1                 // Time out to wait for socket to get ready after open
    let connectionRetryInterval = 5                 // Time interval to retry registering device or registering server
    let connectionCheckTimeout  = 10                // Socket connection live time on server
    let messageTtl              = 86400             // Message time to live
    let reconnectOnClose        = true              // auto connect to socket after socket close
    
    
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // MARK: - test with params: count=2 , offset=0
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    func test_Get_Thread_With_Count2_Offset0() {
        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)

        let spyDelegate = SpyDelegateGetThreads()
        myChatObject?.delegate = spyDelegate

        let theExpectation = expectation(description: "Chat calls the delegate as the result of an async method completion")
        theExpectation.isInverted = true
        spyDelegate.asyncExpectation = theExpectation
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            let theExpectation2 = self.expectation(description: "get threads")
            let getThreadsParameters: JSON = ["count": 2, "offset": 0]
            self.myChatObject?.getThreads(params: getThreadsParameters, uniqueId: { (getThreadsuniqueId) in
                print("\n\n**********************************************")
                print("**********************************************")
                print("Get Threads with params: (count=2, offset=0) Unique Id Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(getThreadsuniqueId)")
                print("**********************************************")
                print("**********************************************\n\n")
                self.somethingWithDelegateAsyncResult = true
                theExpectation2.fulfill()
            }, completion: { (responseJSON) in
                print("\n\n**********************************************")
                print("**********************************************")
                print("Get Threads with params: (count=2, offset=0) Test Response:")
                print("**********************************************")
                print("**********************************************")
                let resModel: GetThreadsModel = responseJSON as! GetThreadsModel
                let resJSON: JSON = resModel.returnDataAsJSON()
                print("\(resJSON)")
                print("**********************************************")
                print("**********************************************\n\n")
                self.somethingWithDelegateAsyncResult = true
                theExpectation2.fulfill()
            })
            
            self.waitForExpectations(timeout: 15) { error in
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
    // MARK: - test with params: ["count": 1, "offset": 1]
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    func test_Get_Thread_With_Count1_Offset1() {
        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)
        
        let spyDelegate = SpyDelegateGetThreads()
        myChatObject?.delegate = spyDelegate
        
        let theExpectation = expectation(description: "Chat calls the delegate as the result of an async method completion")
        theExpectation.isInverted = true
        spyDelegate.asyncExpectation = theExpectation
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            let theExpectation2 = self.expectation(description: "get threads")
            let getThreadsParameters: JSON = ["count": 1, "offset": 1]
            self.myChatObject?.getThreads(params: getThreadsParameters, uniqueId: { (getThreadsuniqueId) in
                print("\n\n**********************************************")
                print("**********************************************")
                print("Get Threads with params: (count=1, offset=1) Unique Id Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(getThreadsuniqueId)")
                print("**********************************************")
                print("**********************************************\n\n")
            }, completion: { (responseJSON) in
                self.somethingWithDelegateAsyncResult = true
                print("\n\n**********************************************")
                print("Get Threads with params: (count=1, offset=1) Test Response:")
                print("**********************************************")
                print("**********************************************")
                let resModel: GetThreadsModel = responseJSON as! GetThreadsModel
                let resJSON: JSON = resModel.returnDataAsJSON()
                print("\(resJSON)")
                print("**********************************************")
                print("**********************************************\n\n")
                theExpectation2.fulfill()
            })
            
            self.waitForExpectations(timeout: 15) { error in
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
    // MARK: - test with params: ["count": 3, "offset": 0]
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    func test_Get_Thread_With_Count3_Offset0() {
        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)

        let spyDelegate = SpyDelegateGetThreads()
        myChatObject?.delegate = spyDelegate

        let theExpectation = expectation(description: "Chat calls the delegate as the result of an async method completion")
        theExpectation.isInverted = true
        spyDelegate.asyncExpectation = theExpectation

        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            let theExpectation2 = self.expectation(description: "get threads")
            let getThreadsParameters: JSON = ["count": 3, "offset": 0]
            self.myChatObject?.getThreads(params: getThreadsParameters, uniqueId: { (getThreadsuniqueId) in
                print("\n\n**********************************************")
                print("**********************************************")
                print("Get Threads with params: (count=3, offset=0) Unique Id Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(getThreadsuniqueId)")
                print("**********************************************")
                print("**********************************************\n\n")
            }, completion: { (responseJSON) in
                self.somethingWithDelegateAsyncResult = true
                print("\n\n**********************************************")
                print("Get Threads with params: (count: 3, offset: 0) Test Response:")
                print("**********************************************")
                print("**********************************************")
                let resModel: GetThreadsModel = responseJSON as! GetThreadsModel
                let resJSON: JSON = resModel.returnDataAsJSON()
                print("\(resJSON)")
                print("**********************************************")
                print("**********************************************\n\n")
                theExpectation2.fulfill()
            })
            
            self.waitForExpectations(timeout: 15) { error in
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
    
    
//    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//    // MARK: - test with params: ["count": 3, "name": "iFel"]
//    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//    func test_Get_Thread_With_Count3_containsName_iFelfeli() {
//        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)
//
//        let spyDelegate = SpyDelegateGetThreads()
//        myChatObject?.delegate = spyDelegate
//
//        let theExpectation = expectation(description: "Chat calls the delegate as the result of an async method completion")
//        spyDelegate.asyncExpectation = theExpectation
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//        }
//
//        let theExpectation2 = expectation(description: "get threads")
//        let getThreadsParameters: JSON = ["count": 3, "name": "fdgg"]
//        myChatObject?.getThreads(params: getThreadsParameters, completion: { (responseJSON) in
//            self.somethingWithDelegateAsyncResult = true
//            print("\n\n**********************************************")
//            print("Get Threads with params: (count: 3, name: i) Test Response:")
//            print("**********************************************")
//            print("**********************************************")
//            print("\(responseJSON)")
//            print("**********************************************")
//            print("**********************************************\n\n")
//            theExpectation2.fulfill()
//        })
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//            guard let result = self.somethingWithDelegateAsyncResult else {
//                XCTFail("Expected delegate to be called")
//                return
//            }
//            XCTAssertTrue(result)
//        }
//    }
    
    
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // MARK: - test with params: ["count": 3, "name": "ziasdfzi"] (wrong value for name)
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    func test_Get_Thread_With_Count3_containsName_ziasdfzi() {
        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)
        
        let spyDelegate = SpyDelegateGetThreads()
        myChatObject?.delegate = spyDelegate
        
        let theExpectation = expectation(description: "Chat calls the delegate as the result of an async method completion")
        theExpectation.isInverted = true
        spyDelegate.asyncExpectation = theExpectation
        
        waitForExpectations(timeout: 15) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            let theExpectation2 = self.expectation(description: "get threads")
            let getThreadsParameters: JSON = ["count": 3, "name": "ziasdfzi"]
            self.myChatObject?.getThreads(params: getThreadsParameters, uniqueId: { (getThreadsuniqueId) in
                print("\n\n**********************************************")
                print("**********************************************")
                print("Get Threads with params: (count=3, name: ziasdfzi) Unique Id Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(getThreadsuniqueId)")
                print("**********************************************")
                print("**********************************************\n\n")
            }, completion: { (responseJSON) in
                self.somethingWithDelegateAsyncResult = true
                print("\n\n**********************************************")
                print("Get Threads with params: (count: 3, name: ziasdfzi) Test Response:")
                print("**********************************************")
                print("**********************************************")
                let resModel: GetThreadsModel = responseJSON as! GetThreadsModel
                let resJSON: JSON = resModel.returnDataAsJSON()
                print("\(resJSON)")
                print("**********************************************")
                print("**********************************************\n\n")
                theExpectation2.fulfill()
            })
            
            self.waitForExpectations(timeout: 15) { error in
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
    // MARK: - test with params: ["count": -2, "offset": -3] (wrong value for count or offset)
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    func test_Get_Thread_With_CountMinus2_OffsetMinuse3() {
        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)
        
        let spyDelegate = SpyDelegateGetThreads()
        myChatObject?.delegate = spyDelegate
        
        let theExpectation = expectation(description: "Chat calls the delegate as the result of an async method completion")
        theExpectation.isInverted = true
        spyDelegate.asyncExpectation = theExpectation
        
        waitForExpectations(timeout: 15) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            let theExpectation2 = self.expectation(description: "get threads")
            let getThreadsParameters: JSON = ["count": -2, "offset": -3]
            self.myChatObject?.getThreads(params: getThreadsParameters, uniqueId: { (getThreadsuniqueId) in
                print("\n\n**********************************************")
                print("**********************************************")
                print("Get Threads with params: (count: -2, offset: -3) Unique Id Response:")
                print("**********************************************")
                print("**********************************************")
                print("\(getThreadsuniqueId)")
                print("**********************************************")
                print("**********************************************\n\n")
            }, completion: { (responseJSON) in
                self.somethingWithDelegateAsyncResult = true
                print("\n\n**********************************************")
                print("Get Threads with params: (count: -2, offset: -3) Test Response:")
                print("**********************************************")
                print("**********************************************")
                let resModel: GetThreadsModel = responseJSON as! GetThreadsModel
                let resJSON: JSON = resModel.returnDataAsJSON()
                print("\(resJSON)")
                print("**********************************************")
                print("**********************************************\n\n")
                theExpectation2.fulfill()
            })
            
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
    
    
    
//    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//    // MARK: - test with params:
//    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//    func test_Get_Thread_All_Together() {
//        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)
//
//        let spyDelegate = SpyDelegateGetThreads()
//        myChatObject?.delegate = spyDelegate
//
//        let theExpectation = expectation(description: "Chat calls the delegate as the result of an async method completion")
//        spyDelegate.asyncExpectation = theExpectation
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//        }
//
//        //-------------------------------------------------------------------------------------------------------------
//        let theExpectation2 = expectation(description: "get threads")
//        let getThreadsParameters: JSON = ["count": 1, "offset": 0]
//        myChatObject?.getThreads(params: getThreadsParameters, completion: { (responseJSON) in
//            self.somethingWithDelegateAsyncResult = true
//            print("\n\n**********************************************")
//            print("Get Threads with params: (count: -2, offset: -3) Test Response:")
//            print("**********************************************")
//            print("**********************************************")
//            print("\(responseJSON)")
//            print("**********************************************")
//            print("**********************************************\n\n")
//            theExpectation2.fulfill()
//        })
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//            guard let result = self.somethingWithDelegateAsyncResult else {
//                XCTFail("Expected delegate to be called")
//                return
//            }
//            XCTAssertTrue(result)
//        }
//
//        //-------------------------------------------------------------------------------------------------------------
//        let theExpectation3 = expectation(description: "get threads")
//        let getThreadsParameters3: JSON = ["count": 2, "offset": 0]
//        myChatObject?.getThreads(params: getThreadsParameters3, completion: { (responseJSON) in
//            self.somethingWithDelegateAsyncResult = true
//            print("\n\n**********************************************")
//            print("Get Threads with params: (count: -2, offset: -3) Test Response:")
//            print("**********************************************")
//            print("**********************************************")
//            print("\(responseJSON)")
//            print("**********************************************")
//            print("**********************************************\n\n")
//            theExpectation3.fulfill()
//        })
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//            guard let result = self.somethingWithDelegateAsyncResult else {
//                XCTFail("Expected delegate to be called")
//                return
//            }
//            XCTAssertTrue(result)
//        }
//
//        //-------------------------------------------------------------------------------------------------------------
//        let theExpectation4 = expectation(description: "get threads")
//        let getThreadsParameters4: JSON = ["count": 1, "offset": 0]
//        myChatObject?.getThreads(params: getThreadsParameters4, completion: { (responseJSON) in
//            self.somethingWithDelegateAsyncResult = true
//            print("\n\n**********************************************")
//            print("Get Threads with params: (count: -2, offset: -3) Test Response:")
//            print("**********************************************")
//            print("**********************************************")
//            print("\(responseJSON)")
//            print("**********************************************")
//            print("**********************************************\n\n")
//            theExpectation4.fulfill()
//        })
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//            guard let result = self.somethingWithDelegateAsyncResult else {
//                XCTFail("Expected delegate to be called")
//                return
//            }
//            XCTAssertTrue(result)
//        }
//
//        //-------------------------------------------------------------------------------------------------------------
//        let theExpectation5 = expectation(description: "get threads")
//        let getThreadsParameters5: JSON = ["count": 1, "offset": 0]
//        myChatObject?.getThreads(params: getThreadsParameters5, completion: { (responseJSON) in
//            self.somethingWithDelegateAsyncResult = true
//            print("\n\n**********************************************")
//            print("Get Threads with params: (count: -2, offset: -3) Test Response:")
//            print("**********************************************")
//            print("**********************************************")
//            print("\(responseJSON)")
//            print("**********************************************")
//            print("**********************************************\n\n")
//            theExpectation5.fulfill()
//        })
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//            guard let result = self.somethingWithDelegateAsyncResult else {
//                XCTFail("Expected delegate to be called")
//                return
//            }
//            XCTAssertTrue(result)
//        }
//
//
//        //-------------------------------------------------------------------------------------------------------------
//        let theExpectation6 = expectation(description: "get threads")
//        let getThreadsParameters6: JSON = ["count": 1, "offset": 0]
//        myChatObject?.getThreads(params: getThreadsParameters6, completion: { (responseJSON) in
//            self.somethingWithDelegateAsyncResult = true
//            print("\n\n**********************************************")
//            print("Get Threads with params: (count: -2, offset: -3) Test Response:")
//            print("**********************************************")
//            print("**********************************************")
//            print("\(responseJSON)")
//            print("**********************************************")
//            print("**********************************************\n\n")
//            theExpectation6.fulfill()
//        })
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//            guard let result = self.somethingWithDelegateAsyncResult else {
//                XCTFail("Expected delegate to be called")
//                return
//            }
//            XCTAssertTrue(result)
//        }
//
//
//        //-------------------------------------------------------------------------------------------------------------
//        let theExpectation7 = expectation(description: "get threads")
//        let getThreadsParameters7: JSON = ["count": 1, "offset": 0]
//        myChatObject?.getThreads(params: getThreadsParameters7, completion: { (responseJSON) in
//            self.somethingWithDelegateAsyncResult = true
//            print("\n\n**********************************************")
//            print("Get Threads with params: (count: -2, offset: -3) Test Response:")
//            print("**********************************************")
//            print("**********************************************")
//            print("\(responseJSON)")
//            print("**********************************************")
//            print("**********************************************\n\n")
//            theExpectation7.fulfill()
//        })
//
//        waitForExpectations(timeout: 5) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
//            }
//            guard let result = self.somethingWithDelegateAsyncResult else {
//                XCTFail("Expected delegate to be called")
//                return
//            }
//            XCTAssertTrue(result)
//        }
//    }
    
    
}











