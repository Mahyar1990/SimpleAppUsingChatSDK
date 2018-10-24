//
//  AsyncTests.swift
//  AsyncTests
//
//  Created by Mahyar Zhiani on 5/9/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import XCTest
@testable import Async

class AsyncTests: XCTestCase, AsyncDelegates {
    
    
    var myAsyncObject1: Async?
    var myAsyncObject2: Async?
    
    let socketAddress = "ws://172.16.106.26:8003/ws"
    let serverName = "chat-server"
    let token1 = "6421ecebd40b4d09923bcf6379663d87"
    let token2 = "7a18deb4a4b64339a81056089f5e5922"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func createObject1() {
        myAsyncObject1 = Async(socketAddress: socketAddress, serverName: serverName, deviceId: token1, appId: nil, peerId: nil, messageTtl: nil, connectionRetryInterval: nil, reconnectOnClose: nil)
        myAsyncObject1?.delegate = self
        myAsyncObject1?.createSucket()
    }
    
    func createObject2() {
        myAsyncObject2 = Async(socketAddress: socketAddress, serverName: serverName, deviceId: token1, appId: nil, peerId: nil, messageTtl: nil, connectionRetryInterval: nil, reconnectOnClose: nil)
        myAsyncObject2?.delegate = self
        myAsyncObject2?.createSucket()
    }
    
    // test if Socket is Oppened
    func test_Connecting_SocketIsOpen() {
        createObject1()
        let delayExpectation = expectation(description: "Helloooooooooooooooooooo")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssertEqual(self.mySocketState, 1)
    }
    
    // test if async is ready
    func test_Connecting_AsyncIsReady() {
        createObject1()
        let delayExpectation = expectation(description: "Helloooooooooooooooooooo")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssertEqual(self.isAsyncReady, true)
    }
    
    // test if device is registered
    func test_Connecting_IsDeviceRegistered() {
        createObject1()
        let delayExpectation = expectation(description: "Helloooooooooooooooooooo")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssertEqual(self.myDevivceRegister, true)
    }
    
    // test if server is registered
    func test_Connecting_IsServerRegistered() {
        createObject1()
        let delayExpectation = expectation(description: "Helloooooooooooooooooooo")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssertEqual(self.myDevivceRegister, true)
    }
    
    // test if i get peerId
    func test_Connecting_PeerId() {
        createObject1()
        let delayExpectation = expectation(description: "Helloooooooooooooooooooo")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(self.myPeerId)
    }
    
    // test send message
    func test_Working_DidRecieveMessage() {
        createObject1()
        let delayExpectation = expectation(description: "Helloooooooooooooooooooo")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(self.myRecievedMessage)
    }
    
    // test recieved message
    func test_Working_DidSendMessage() {
        createObject1()
        let delayExpectation = expectation(description: "Helloooooooooooooooooooo")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(self.mySentMessage)
    }
    
    var isAsyncReady: Bool?
    
    var mySocketState: Int?
    var myDevivceRegister: Bool?
    var myServerRegister: Bool?
    var myPeerId: Int?
    
    var mySentMessage: [String: Any]?
    var myRecievedMessage: [String: Any]?
    
    
    func sendMessage(params: Any) {
        print("Delegate: Message Send! \n \(params) \n \n")
        mySentMessage = params as? [String : Any]
    }
    
    func connect(newPeerId: Int) {
        print("Delegate: Connected! \n \n")
    }
    
    func disconnect() {
        print("Delegate: Disconnected! \n \n")
    }
    
    func reconnect(newPeerId: Int) {
        print("Delegate: Reconnected! \n \n")
    }
    
    func receiveMessage(params: Any) {
        print("Delegate: Message: \n \(params) \n \n \n")
        myRecievedMessage = params as? [String : Any]
    }
    
    func asyncReady() {
        print("Delegate: Async Ready \n \n")
        isAsyncReady = true
    }
    
    func stateChanged(socketState: Int, timeUntilReconnect: Int, deviceRegister: Bool, serverRegister: Bool, peerId: Int) {
        print("Delegate: State Changed: \n socketState: \(socketState) \n timeUntilReconnect: \(timeUntilReconnect) \n deviceRegister: \(deviceRegister) \n serverRegister: \(serverRegister) \n peerId: \(peerId) \n \n")
        mySocketState = socketState
        myDevivceRegister = deviceRegister
        myServerRegister = serverRegister
        myPeerId = peerId
    }
    
    func error(errorCode: Int, errorMessage: String, errorEvent: Any?) {
        print("Delegate: Error: \n errorCode: \(errorCode) \n errorMessage: \(errorMessage) \n \n")
    }
    
}
