//
//  ViewController.swift
//  SimpleAppUsingChat
//
//  Created by Mahyar Zhiani on 6/10/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import UIKit
import SwiftyJSON
import FanapPodChatSDK



class MyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let cellId = "cellId"
    var logArr = [String]()
    var logHeightArr = [Int]()
    var logBackgroundColor = [UIColor]()
    //    let cellColors = [UIColor.red, UIColor.green, UIColor.blue]
    
//    var myChatObject: Chat?
    
    
    // get tocken for SandBox:
    /* let d = """
https://accounts.pod.land/oauth2/authorize/index.html?client_id=2051121e4348af52664cf7de0bda&response_type=token&redirect_uri=https://chat.fanapsoft.ir&scope=profile social:write
"""
    */
    
    // Main Addresses
    var socketAddress   = "wss://msg.pod.ir/ws"
    var ssoHost         = "https://accounts.pod.ir"
    var platformHost    = "https://api.pod.ir/srv/core"
    var fileServer      = "https://core.pod.ir"
    var serverName      = "chat-server"
    
    
    // SandBox Addresses:
//    let socketAddress           = "wss://chat-sandbox.pod.ir/ws"
//    let serverName              = "chat-server"
//    let ssoHost                 = "https://accounts.pod.ir"
//    let platformHost            = "https://sandbox.pod.ir:8043/srv/basic-platform"    // {**REQUIRED**} Platform Core Address
//    let fileServer              = "http://sandbox.fanapium.com:8080"                    // {**REQUIRED**} File Server Address
    let token                   = "7a603f5d8b554424910e977150ff8f86"
    
    
    // Mehrara
//    let socketAddress           = "ws://172.16.106.26:8003/ws"
//    let serverName              = "chat-server"
//    let platformHost            = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} Platform Core Address
//    let ssoHost                 = "http://172.16.110.76"
//    let fileServer              = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} File Server Address
    
    // SheikhHoseini
//    let socketAddress           = "ws://172.16.110.131:8003/ws"
//    let serverName              = "chat-server2"
//    var platformHost            = "http://172.16.110.131:8080"
//    let ssoHost                 = "http://172.16.110.76"
//    let fileServer              = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} File Server Address
    
//    let token                   = "fbd4ecedb898426394646e65c6b1d5d1"
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
    
    
    
    var getUserInfoButton = MZButton()
    let getThreadsButton = MZButton()
    let getHistoryButton = MZButton()
    let getThreadParticipantsButton = MZButton()
    let createThreadButton = MZButton()
    let getContactsButton = MZButton()
    let sendMessageToSocketButton = MZButton()
    let addParticipantButton = MZButton()
    let removeParticipantButton = MZButton()
    let addContactButton = MZButton()
    let updateContactButton = MZButton()
    let removeContactButton = MZButton()
    let uploadFileButton = MZButton()
    let uploadImageButton = MZButton()
    let sendFileMessageButton = MZButton()
    let muteThreadButton = MZButton()
    let unmuteThreadButton = MZButton()
    let updateThreadInfoButton = MZButton()
    let syncContactsButton = MZButton()
    let searchThreadButton = MZButton()
    let searchContactButton = MZButton()
    let searchHistoryButton = MZButton()
    let clearHistoryButton = MZButton()
    let blockButton = MZButton()
    let unblockButton = MZButton()
    let getBlockedButton = MZButton()
    let leaveThreadButton = MZButton()
    let spamThreadButton = MZButton()
    let messageDeliverList = MZButton()
    let messageSeenList = MZButton()
    let getImage = MZButton()
    let getFile = MZButton()
    let mapReverse = MZButton()
    let mapSearch = MZButton()
    let mapRouting = MZButton()
    let mapStaticImage = MZButton()
    let sendLocatinoMessage = MZButton()
    let sendBotMessage = MZButton()
    let setAuditor = MZButton()
    let deleteCache = MZButton()
    
    
    let inputTextFieldToSendMessage: UITextField = {
        let mt = UITextField()
        mt.translatesAutoresizingMaskIntoConstraints = false
        mt.placeholder = "type your message..."
        mt.backgroundColor = UIColor(white: 0.8, alpha: 1)
        return mt
    }()
    
    
    let logView: UIView = {
        let mv = UIView()
        mv.translatesAutoresizingMaskIntoConstraints = false
        mv.backgroundColor = UIColor.lightText
        mv.layer.cornerRadius = 5
        mv.layer.borderWidth = 2
        mv.layer.borderColor = UIColor.clear.cgColor
        mv.layer.shadowColor = UIColor.darkGray.cgColor
        mv.layer.shadowOpacity = 2
        mv.layer.shadowRadius = 1
        return mv
    }()
    
    let myLogCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let mcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mcv.translatesAutoresizingMaskIntoConstraints = false
        mcv.backgroundColor = UIColor.clear
        return mcv
    }()
    
    let picker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        Chat.sharedInstance.createChatObject(socketAddress:          socketAddress,
                                             ssoHost:                ssoHost,
                                             platformHost:           platformHost,
                                             fileServer:             fileServer,
                                             serverName:             serverName,
                                             token:                  token,
                                             mapApiKey:              nil,
                                             mapServer:              "https://api.neshan.org/v1",
                                             typeCode:               "default",
                                             enableCache:            true,
                                             cacheTimeStampInSec:    nil,
                                             msgPriority:            1,
                                             msgTTL:                 messageTtl,
                                             httpRequestTimeout:     nil,
                                             actualTimingLog:        nil,
                                             wsConnectionWaitTime:   Double(wsConnectionWaitTime),
                                             connectionRetryInterval: connectionRetryInterval,
                                             connectionCheckTimeout: connectionCheckTimeout,
                                             messageTtl:             messageTtl,
                                             reconnectOnClose:       true)
        
        Chat.sharedInstance.delegate = self
    }
    
    
}




// implement button pressed actions
extension MyViewController {
    
    
    @objc func getUserInfoButtonPressed() {
        Chat.sharedInstance.getUserInfo(uniqueId: { (getUserInfoUniqueId) in
            print("\n get user info request uniqueId = \t \(getUserInfoUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my get user info response from Server:")
            let myResponseModel: UserInfoModel = myResponse as! UserInfoModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\(myResponseJSON) \n")
        }, cacheResponse: { (userInfoResponse) in
            print("\n this is my get user info response from Cache:")
            let responseJSON = userInfoResponse.returnDataAsJSON()
            print("\(responseJSON)")
        })
    }
    
    
}




