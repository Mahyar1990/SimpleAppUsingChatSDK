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
    
    var myChatObject: Chat?
    
    
    // get tocken for SandBox:
    /* let d = """
https://accounts.pod.land/oauth2/authorize/index.html?client_id=2051121e4348af52664cf7de0bda&response_type=token&redirect_uri=https://chat.fanapsoft.ir&scope=profile social:write
"""
    */
    
    // SandBox Addresses:
    let socketAddress           = "wss://chat-sandbox.pod.land/ws"
    let serverName              = "chat-server"
    let ssoHost                 = "https://accounts.pod.land"
    let platformHost            = "https://sandbox.pod.land:8043/srv/basic-platform"    // {**REQUIRED**} Platform Core Address
    let fileServer              = "http://sandbox.fanapium.com:8080"                    // {**REQUIRED**} File Server Address
    let token                   = "9ea5cb5d3cae4de2989a4bfb4df17fd5"

    
    // Local Addresses
//    let socketAddress           = "ws://172.16.106.26:8003/ws"
//    let serverName              = "chat-server"
//    let ssoHost                 = "http://172.16.110.76"
//    let platformHost            = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} Platform Core Address
//    let fileServer              = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} File Server Address
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
    
    var getUserInfoButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Get UserInfo...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(getUserInfoButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let getThreadsButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Get Threads...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(getThreadsButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let getHistoryButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Get History...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(getHistoryButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let getThreadParticipantsButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Get thread Participants...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(getThreadParticipantsButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let createThreadButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Create Thread...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(createThreadButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let getContactsButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Get Contacts...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(getContactsButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let inputTextFieldToSendMessage: UITextField = {
        let mt = UITextField()
        mt.translatesAutoresizingMaskIntoConstraints = false
        mt.placeholder = "type your message..."
        mt.backgroundColor = UIColor(white: 0.8, alpha: 1)
        return mt
    }()
    
    let sendMessageToSocketButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Click to send message thought socket...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 100/255, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 50/255, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(sendMessageToSocketPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let addParticipantButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Add Participant...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(addParticipantsButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let removeParticipantButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Remove Participant...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(removeParticipantsButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let addContactButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Add Contact...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(addContactButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let updateContactButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Update Contact...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(updateContactButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let removeContactButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Remove Contact...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(removeContactButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let uploadFileButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Upload File...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(uploadFileButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let uploadImageButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Upload Image...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(uploadImageButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let sendFileMessageButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Send File Message...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(sendFileMessageButtonnPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let muteThreadButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Mute Thread...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(muteThreadButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let unmuteThreadButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Unmute Thread...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(unmuteThreadButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    
    let updateThreadInfoButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Update Metadata...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(updateThreadInfoButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    
    let syncContactsButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Sync Contacts...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(syncContactsButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    
    let searchThreadButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Search Thread...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(searchThreadButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    
    let searchContactButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Search Contacr...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(searchContactsButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    
    let searchHistoryButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Search History...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(searchHistoryButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    
    let blockButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Block...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(blockContactButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    
    let unblockButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Unblock...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(unblockContactButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let getBlockedButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Get Block List...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(getBlockedContactsButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let leaveThreadButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Leave Thread...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(leaveThreadButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let spamThreadButton: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Spam Pv Thread...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(spamThreadButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let messageDeliverList: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Message Deliver List...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(messageDeliverListButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let messageSeenList: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Message Seen List...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(messageSeenListButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let getImage: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Get Image...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(getImgeButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let getFile: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Get File...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(getFileButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let mapReverse: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Map Reverse...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(mapReverseButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let mapSearch: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Map Search...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(mapSearchButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let mapRouting: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Map Routing...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(mapRoutingButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let mapStaticImage: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Map Static Image...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(mapStaticImageButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
    }()
    
    let sendLocatinoMessage: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("send location Message...", for: UIControlState.normal)
        mb.backgroundColor = UIColor(red: 0, green: 150/255, blue: 200/255, alpha: 1.0)
        mb.layer.cornerRadius = 5
        mb.layer.borderWidth = 2
        mb.layer.borderColor = UIColor.clear.cgColor
        mb.layer.shadowColor = UIColor(red: 0, green: 100/255, blue: 110/255, alpha: 1.0).cgColor
        mb.layer.shadowOpacity = 2
        mb.layer.shadowRadius = 1
        mb.layer.shadowOffset = CGSize(width: 0, height: 3)
        mb.titleLabel?.numberOfLines = 1
        mb.titleLabel?.adjustsFontSizeToFitWidth = true
        mb.addTarget(self, action: #selector(sendLocationMessageButtonPressed), for: UIControlEvents.touchUpInside)
        return mb
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
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        
        navigationItem.title = "Test Chat"
        
        myLogCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        myLogCollectionView.delegate = self
        myLogCollectionView.dataSource = self
        
        setupView()
        
        myChatObject = Chat(socketAddress: socketAddress,
                            ssoHost: ssoHost,
                            platformHost: platformHost,
                            fileServer: fileServer,
                            serverName: serverName,
                            token: token,
                            mapApiKey: nil,
                            mapServer: "https://api.neshan.org/v1",
                            typeCode: "default",
                            enableCache: true,
                            cacheTimeStampInSec: nil,
                            msgPriority: 1,
                            msgTTL: messageTtl,
                            httpRequestTimeout: nil,
                            actualTimingLog: nil,
                            wsConnectionWaitTime: Double(wsConnectionWaitTime),
                            connectionRetryInterval: connectionRetryInterval,
                            connectionCheckTimeout: connectionCheckTimeout,
                            messageTtl: messageTtl,
                            reconnectOnClose: true)
        
        myChatObject?.delegate = self
        
        //        myChatObject = Chat(...)
        //        myChatObject!.delegate = self
        
        
    }
    
    
}




// implement button pressed actions
extension MyViewController {
    
    
    @objc func getUserInfoButtonPressed() {
        myChatObject?.getUserInfo(uniqueId: { (getUserInfoUniqueId) in
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
    
    
    @objc func getThreadsButtonPressed() {
//        let metadataCriteria: JSON = ["field": "type",
//                                      "has": "BOT_",
//                                      "and": ["field": "id", "is": "1534835339446"]
//                                    ]
//        let paramsToSend: JSON = ["count": 3, "offset": 8/*, "metadataCriteria": metadataCriteria*/]
//        myChatObject?.getThreads(params: paramsToSend, uniqueId: { (getThreadUniqueId) in
//            print("\n get thread request uniqueId = \t \(getThreadUniqueId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: GetThreadsModel = myResponse as! GetThreadsModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my get thread response:")
//            print("\(myResponseJSON) \n")
//        })
        
        let inputModel = GetThreadsRequestModel(count: 9, coreUserId: nil, metadataCriteria: nil, name: nil, new: nil, offset: 0, threadIds: nil, typeCode: nil)
        myChatObject?.getThreads(getThreadsInput: inputModel, uniqueId: { (getThreadUniqueId) in
            print("\n get thread request uniqueId = \t \(getThreadUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetThreadsModel = myResponse as! GetThreadsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get thread response from Server:")
            print("\(myResponseJSON) \n")
        }, cacheResponse: { (threadResponse) in
            print("\n this is my get thread response from Cache:")
            let responseJSON = threadResponse.returnDataAsJSON()
            print("\(responseJSON)")
        })
        
    }
    
    
    @objc func getHistoryButtonPressed() {
//        let paramsToSend: JSON = ["threadId": 1328, "count": 1, "offset": 0]
//        myChatObject?.getHistory(params: paramsToSend, uniqueId: { (getHistoryUniqueId) in
//            print("\n get history request uniqueId = \t \(getHistoryUniqueId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: GetHistoryModel = myResponse as! GetHistoryModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my get history response:")
//            print("\(myResponseJSON) \n")
//        })

//        let inputModel = GetHistoryRequestModel(count: 2, firstMessageId: nil, fromTime: nil/*1541856621893000000*/, lastMessageId: nil, messageId: nil, metadataCriteria: nil, offset: nil, order: nil, query: nil, threadId: 1328, toTime: nil/*1541856821893000000*/, typeCode: nil, uniqueId: nil)
//        myChatObject?.getHistory(getHistoryInput: inputModel, uniqueId: { (getHistoryUniqueId) in
//            print("\n get history request uniqueId = \t \(getHistoryUniqueId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: GetHistoryModel = myResponse as! GetHistoryModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my get history response from Server:")
//            print("\(myResponseJSON) \n")
//        }, cacheResponse: { (historyResponse) in
//            print("\n this is my get history response from Cache:")
//            let responseJSON = historyResponse.returnDataAsJSON()
//            print("\(responseJSON)")
//        })
        
    }
    
    
    @objc func getThreadParticipantsButtonPressed() {
//        let paramsToSend: JSON = ["count": 3, "offset": 0, "threadId": 1101]
//        myChatObject?.getThreadParticipants(params: paramsToSend, uniqueId: { (getThreadParticipantUniqueId) in
//            print("\n get thread participant request unique id = \t \(getThreadParticipantUniqueId) \t")
//        }, completion: { (myResponse) in
//            let myResponseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my get thread participants response:")
//            print("\(myResponseJSON) \n")
//        })
        
        let inputModel = GetThreadParticipantsRequestModel(count: 5, firstMessageId: nil, lastMessageId: nil, name: nil, offset: 0, threadId: 1330/*1101*/, typeCode: nil)
        myChatObject?.getThreadParticipants(getThreadParticipantsInput: inputModel, uniqueId: { (getThreadParticipantUniqueId) in
            print("\n get thread participant request unique id = \t \(getThreadParticipantUniqueId)")
        }, completion: { (myResponse) in
            let myResponseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get thread participants response from Server:")
            print("\(myResponseJSON) \n")
        }, cacheResponse: { (myCacheResponse) in
            let myResponseJSON: JSON = myCacheResponse.returnDataAsJSON()
            print("\n this is my get thread participants response from Cache:")
            print("\(myResponseJSON) \n")
        })
        
        
    }
    
    
    @objc func createThreadButtonPressed() {
        
        let messageMetadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
//        let messageParamsToSend: JSON = ["content": "\(inputTextFieldToSendMessage.text ?? "empty message")", "metaData": messageMetadata]
        
//        let user1: JSON = ["id": "2202", "idType": inviteeVOidTypes.TO_BE_USER_CONTACT_ID.rawValue]
//        let user2: JSON = ["id": "121", "idType": inviteeVOidTypes.TO_BE_USER_SSO_ID.rawValue]
//        let pouria: JSON = ["id": "2306", "idType": inviteeVOidTypes.TO_BE_USER_CONTACT_ID.rawValue] // 2306
//        let mahyar: JSON = ["id": "521", "idType": inviteeVOidTypes.TO_BE_USER_SSO_ID.rawValue]
//        let mahyarPhone: JSON = ["id": "09358590677", "idType": inviteeVOidTypes.TO_BE_USER_CELLPHONE_NUMBER.rawValue]
//        let akbariId: JSON = ["id": "1321", "idType": inviteeVOidTypes.TO_BE_USER_SSO_ID.rawValue]
//        let akbariPhone: JSON = ["id": "09369865820", "idType": inviteeVOidTypes.TO_BE_USER_CELLPHONE_NUMBER.rawValue]
        
//        let xxx: JSON = ["id": "099810s84527", "idType": InviteeVOidTypes.TO_BE_USER_CELLPHONE_NUMBER.rawValue]
//        let invitees: [JSON] = [xxx]
//        let paramsToSend: JSON = ["type": ThreadTypes.NORMAL.rawValue, "title": "New Group", "invitees": invitees]
//
//        myChatObject?.creatThreadWithMessage(params: paramsToSend, sendMessageParams: messageParamsToSend, uniqueId: { (createWithSendMessageUniqeuId) in
//            print("\n create thread reqeuest uniqueId = \t \(createWithSendMessageUniqeuId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: CreateThreadModel = myResponse as! CreateThreadModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my create thread response:")
//            print("\(myResponseJSON) \n")
//        }, onSent: { (isSent) in
//            print("**************************")
//            print("the message is sent = \(isSent)")
//            print("**************************")
//        }, onDelivere: { (isDeliver) in
//            print("**************************")
//            print("the message is delivered: '\(isDeliver)'")
//            print("**************************")
//        }, onSeen: { (isSeen) in
//            print("**************************")
//            print("the message with is Seen: '\(isSeen)'")
//            print("**************************")
//        })
        
//        let inviteeArray: [Invitee] = [Invitee(id: "2306", idType: "\(InviteeVOidTypes.TO_BE_USER_CONTACT_ID.rawValue)")]
        let inviteeArray: [Invitee] = [Invitee(id: "09368640180", idType: "\(InviteeVOidTypes.TO_BE_USER_CELLPHONE_NUMBER)")]
        let inputModel = CreateThreadRequestModel(description: "nil", image: "nil", invitees: inviteeArray, metadata: "\(messageMetadata)", title: "New Group", type: ThreadTypes.NORMAL.rawValue, uniqueId: nil)
        myChatObject?.createThread(createThreadInput: inputModel, uniqueId: { (createThreadUniqeuId) in
            print("\n create thread reqeuest uniqueId = \t \(createThreadUniqeuId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: CreateThreadModel = myResponse as! CreateThreadModel
            print("server response = \n \(myResponseModel.returnDataAsJSON())")
        })
        
        
//        let inviteeArray: [Invitee] = [Invitee(id: "09981084527", idType: "\(InviteeVOidTypes.TO_BE_USER_CELLPHONE_NUMBER.rawValue)")]
//        let inputModel = CreateThreadWithMessageRequestModel(threadDescription: nil, threadImage: nil, threadInvitees: inviteeArray, threadMetadata: nil, threadTitle: "New Group", threadType: "\(ThreadTypes.NORMAL.rawValue)", uniqueId: nil, messageContent: "This is the text of the message", messageMetaDataId: 2341234123, messageMetaDataType: "BOT_MESSAGE", messageMetaDataOwner: "Mahyar")
//        myChatObject?.creatThreadWithMessage(creatThreadWithMessageInput: inputModel, uniqueId: { (createWithSendMessageUniqeuId) in
//            print("\n create thread reqeuest uniqueId = \t \(createWithSendMessageUniqeuId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: CreateThreadModel = myResponse as! CreateThreadModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my create thread response:")
//            print("\(myResponseJSON) \n")
//        }, onSent: { (isSent) in
//            print("the message is sent = \(isSent)")
//        }, onDelivere: { (isDeliver) in
//            print("the message is delivered: '\(isDeliver)'")
//        }, onSeen: { (isSeen) in
//            print("the message with is Seen: '\(isSeen)'")
//        })
        
    }
    
    
    @objc func getContactsButtonPressed() {
//        let paramsToSend: JSON = ["count": 2, "offset": 0]
//        myChatObject?.getContacts(params: paramsToSend, uniqueId: { (getContactUniqueId) in
//            print("\n get contact request uniqueId = \t \(getContactUniqueId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: GetContactsModel = myResponse as! GetContactsModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my get contacts response:")
//            print("\(myResponseJSON) \n")
//        })
        
        let inputModel = GetContactsRequestModel(count: 5, name: nil, offset: 0, typeCode: nil)
        myChatObject?.getContacts(getContactsInput: inputModel, uniqueId: { (getContactUniqueId) in
            print("\n get contact request uniqueId = \t \(getContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetContactsModel = myResponse as! GetContactsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get contacts response from Server:")
            print("\(myResponseJSON) \n")
        }, cacheResponse: { (contactResponse) in
            print("\n this is my get contact response from Cache:")
            let responseJSON = contactResponse.returnDataAsJSON()
            print("\(responseJSON)")
        })
        
    }
    
    
    @objc func sendMessageToSocketPressed() {
        sendMessage()
//        editMessage()
//        replyMessage()
//        forwardMessage()
//        deleteMessage()
    }
    
    
    func sendMessage() {
        let metadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
//        let paramsToSend: JSON = ["subjectId": 1328, "content": "\(inputTextFieldToSendMessage.text ?? "empty message")", "metaData": metadata]
//        myChatObject?.sendTextMessage(params: paramsToSend, uniqueId: { (uniqueIdStr) in
//            print("**************************")
//            print("message uniqueId is: \(uniqueIdStr)")
//            print("**************************")
//        }, onSent: { (isSent) in
//            print("**************************")
//            print("the message is sent = \(isSent)")
//            print("**************************")
//        }, onDelivere: { (isDeliver)  in
//            print("**************************")
//            print("the message is delivered: '\(isDeliver)'")
//            print("**************************")
//        }, onSeen: { (isSeen) in
//            print("**************************")
//            print("the message with is Seen: '\(isSeen)'")
//            print("**************************")
//        })
        
        
        let inputModel = SendTextMessageRequestModel(content: "\(inputTextFieldToSendMessage.text ?? "empty message")", metaData: metadata, repliedTo: nil, systemMetadata: nil, threadId: 1202, typeCode: nil, uniqueId: nil)
        myChatObject?.sendTextMessage(sendTextMessageInput: inputModel, uniqueId: { (uniqueIdStr) in
            print("message uniqueId is: \(uniqueIdStr)")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
        
    }
    
    
    func editMessage() {
//        let cont: JSON = ["subjectId": 10799, "content": "\(inputTextFieldToSendMessage.text ?? "empty message")"]
//        myChatObject?.editMessage(params: cont, uniqueId: { (editMessageUniqueId) in
//            print("\n edit message request uniqueId = \t \(editMessageUniqueId) \n")
//        }, completion: { (successResponse) in
//            print("**************************")
//            print("message is edited successfully: \(successResponse)")
//            print("**************************")
//        })
        
        let inputModel = EditTextMessageRequestModel(content: "text message", metaData: nil, repliedTo: nil, subjectId: 10799, typeCode: nil, uniqueId: nil)
        myChatObject?.editMessage(editMessageInput: inputModel, uniqueId: { (editMessageUniqueId) in
            print("\n edit message request uniqueId = \t \(editMessageUniqueId) \n")
        }, completion: { (successResponse) in
            print("message is edited successfully: \(successResponse)")
        })
        
    }
    
    
    func replyMessage() {
//        let paramsToSend: JSON = ["subjectId": 1133,"repliedTo": 15397,"content": "\(inputTextFieldToSendMessage.text ?? "empty message")"]
//        myChatObject?.replyMessageWith3Callbacks(params: paramsToSend, uniqueId: { (uniqueIdStr) in
//            print("**************************")
//            print("**************************")
//            print("message uniqueId is: \(uniqueIdStr)")
//            print("**************************")
//            print("**************************")
//        }, onSent: { (isSent) in
//            print("**************************")
//            print("**************************")
//            print("the message is sent = \(isSent)")
//            print("**************************")
//            print("**************************")
//        }, onDelivere: { (isDeliver)  in
//            print("**************************")
//            print("**************************")
//            print("the message is delivered: '\(isDeliver)'")
//            print("**************************")
//            print("**************************")
//        }, onSeen: { (isSeen) in
//            print("**************************")
//            print("the message with is Seen: '\(isSeen)'")
//            print("**************************")
//        })
        
        let inputModel = ReplyTextMessageRequestModel(content: "text message", metaData: nil, repliedTo: 15397, subjectId: 1133, typeCode: nil, uniqueId: nil)
        myChatObject?.replyMessage(replyMessageInput: inputModel, uniqueId: { (uniqueIdStr) in
            print("message uniqueId is: \(uniqueIdStr)")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
        
    }
    
    
    func forwardMessage() {
//        let paramsToSend: JSON = ["subjectId": 1133,"content": [15395]]
//        myChatObject?.forwardMessageWith3Callbacks(params: paramsToSend, uniqueIds: { (uniqueIdArr) in
//            print("**************************")
//            print("**************************")
//            print("message uniqueId is: \(uniqueIdArr)")
//            print("**************************")
//            print("**************************")
//        }, onSent: { (isSent) in
//            print("**************************")
//            print("**************************")
//            print("the message is sent = \(isSent)")
//            print("**************************")
//            print("**************************")
//        }, onDelivere: { (isDeliver)  in
//            print("**************************")
//            print("**************************")
//            print("the message is delivered: '\(isDeliver)'")
//            print("**************************")
//            print("**************************")
//        }, onSeen: { (isSeen) in
//            print("**************************")
//            print("the message with is Seen: '\(isSeen)'")
//            print("**************************")
//        })
        
        let inputModel = ForwardMessageRequestModel(messageIds: [15395], metaData: nil, repliedTo: nil, subjectId: 1133, typeCode: nil)
        myChatObject?.forwardMessage(forwardMessageInput: inputModel, uniqueIds: { (uniqueIdArr) in
            print("message uniqueId is: \(uniqueIdArr)")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
        
    }
    
    
    func deleteMessage() {
//        let paramsToSend: JSON = ["subjectId": 10799]
//        myChatObject?.deleteMessage(params: paramsToSend, uniqueId: { (deleteMEssageUniqueId) in
//            print("Delete Message Unique ID = \(deleteMEssageUniqueId)")
//        }, completion: { (response) in
//            print("delete Message response: \n \(response)")
//        })
        
        let inputModel = DeleteMessageRequestModel(deleteForAll: nil, subjectId: 10799, typeCode: nil, uniqueId: nil)
        myChatObject?.deleteMessage(deleteMessageInput: inputModel, uniqueId: { (deleteMEssageUniqueId) in
            print("Delete Message Unique ID = \(deleteMEssageUniqueId)")
        }, completion: { (response) in
            print("delete Message response: \n \(response)")
        })
        
    }
    
    
    @objc func addParticipantsButtonPressed() {
//        let paramsToSend: JSON = ["threadId": 1330/*1101*/, "contacts": [2202, 952, 1281, 2306]]
//        myChatObject?.addParticipants(params: paramsToSend, uniqueId: { (addParticipantsUniqueId) in
//            print("\n add participant request uniqueId = \t \(addParticipantsUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("\n this is my add participants response:")
//            let response: AddParticipantModel = myResponse as! AddParticipantModel
//            let responseJSON: JSON = response.returnDataAsJSON()
//            print("\(responseJSON) \n")
//        })
        
        let inputModel = AddParticipantsRequestModel(contacts: [2202, 952, 1281, 2306], threadId: 1330, typeCode: nil, uniqueId: nil)
        myChatObject?.addParticipants(addParticipantsInput: inputModel, uniqueId: { (addParticipantsUniqueId) in
            print("\n add participant request uniqueId = \t \(addParticipantsUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my add participants response:")
            let response: AddParticipantModel = myResponse as! AddParticipantModel
            let responseJSON: JSON = response.returnDataAsJSON()
            print("\(responseJSON) \n")
        })
        
    }
    
    
    @objc func removeParticipantsButtonPressed() {
//        let paramsToSend: JSON = ["threadId": 1330, "participants": [1]]
//
//        myChatObject?.removeParticipants(params: paramsToSend, uniqueId: { (removeParticipantsUniqueId) in
//            print("\n remove participant request uniqueId = \t \(removeParticipantsUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("\n this is my remove participants response:")
//            let response: RemoveParticipantModel = myResponse as! RemoveParticipantModel
//            let responseJSON: JSON = response.returnDataAsJSON()
//            print("\(responseJSON) \n")
//        })
        
        let inputModel = RemoveParticipantsRequestModel(content: [1], threadId: 1330, typeCode: nil, uniqueId: nil)
        myChatObject?.removeParticipants(removeParticipantsInput: inputModel, uniqueId: { (removeParticipantsUniqueId) in
            print("\n remove participant request uniqueId = \t \(removeParticipantsUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my remove participants response:")
            let response: RemoveParticipantModel = myResponse as! RemoveParticipantModel
            let responseJSON: JSON = response.returnDataAsJSON()
            print("\(responseJSON) \n")
        })
        
    }
    
    
    @objc func addContactButtonPressed() {
        
//        let params: JSON = ["firstName": "Mehdi2",
//                            "lastName": "Akbarian2",
//                            "cellphoneNumber": "093686401802"]
//        myChatObject?.addContact(params: params, uniqueId: { (addContactUniqueId) in
//            print("\n add Contact request uniqueId = \t \(addContactUniqueId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: ContactModel = myResponse as! ContactModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my add contacts response:")
//            print("\(myResponseJSON)")
//        })
        
        let inputModel = AddContactsRequestModel(cellphoneNumber: "09354045350", email: nil, firstName: "Sina", lastName: "Javaheri")
        myChatObject?.addContact(addContactsInput: inputModel, uniqueId: { (addContactUniqueId) in
            print("\n add Contact request uniqueId = \t \(addContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my add contacts response:")
            print("\(myResponseJSON)")
        })
    }
    
    
    @objc func updateContactButtonPressed() {
//        let params: JSON = ["id": 2225,
//                            "firstName": "Mehdi",
//                            "lastName": "Akbarian",
//                            "cellphoneNumber": "09368640180",
//                            "email": "Mehdi.Akbarian@fanap.ir"]
//        myChatObject?.updateContact(params: params, uniqueId: { (updateContactUniqueId) in
//            print("\n update Contact request uniqueId = \t \(updateContactUniqueId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: ContactModel = myResponse as! ContactModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my update contacts response:")
//            print("\(myResponseJSON)")
//
//        })
        
        
        let inputModel = UpdateContactsRequestModel(cellphoneNumber: "09368640180", email: "Mehdi.Akbarian@fanap.ir", firstName: "Mehdi", id: 2225, lastName: "Akbarian")
        myChatObject?.updateContact(updateContactsInput: inputModel, uniqueId: { (updateContactUniqueId) in
            print("\n update Contact request uniqueId = \t \(updateContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my update contacts response:")
            print("\(myResponseJSON)")
        })
        
    }
    
    
    @objc func removeContactButtonPressed() {
//        let params: JSON = ["id": 4121]
//        myChatObject?.removeContact(params: params, uniqueId: { (removeContactUniqueId) in
//            print("\n remove Contact request uniqueId = \t \(removeContactUniqueId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: RemoveContactModel = myResponse as! RemoveContactModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my Remove contacts response:")
//            print("\(myResponseJSON)")
//        })
        
        let inputModel = RemoveContactsRequestModel(id: 4121)
        myChatObject?.removeContact(removeContactsInput: inputModel, uniqueId: { (removeContactUniqueId) in
            print("\n remove Contact request uniqueId = \t \(removeContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: RemoveContactModel = myResponse as! RemoveContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my Remove contacts response:")
            print("\(myResponseJSON)")
        })
    }
    
    
    @objc func uploadFileButtonPressed() {
        let image = UIImage(named: "pic")
        if let data = UIImageJPEGRepresentation(image!, 1) {
//            let myParams: JSON = ["fileName": "newPic"]
//            myChatObject?.uploadFile(params: myParams, dataToSend: data, uniqueId: { (uploadFileUniqueId) in
//                print("********************************")
//                print("UploadFileUniqueId is = \(uploadFileUniqueId)")
//                print("********************************")
//            }, progress: { (progress) in
//                print("Upload File progress is = \(progress)")
//            }, completion: { (response) in
//                print("********************************")
//                print("Response from Upload File:")
//                let responseModel: UploadFileModel = response as! UploadFileModel
//                let responseJSON: JSON = responseModel.returnDataAsJSON()
//                print("\(responseJSON)")
//                print("********************************")
//            })
            
            let inputModel = UploadFileRequestModel(dataToSend: data, fileExtension: nil, fileName: "newPic", fileSize: nil, originalFileName: nil, threadId: nil, uniqueId: nil)
            myChatObject?.uploadFile(uploadFileInput: inputModel, uniqueId: { (uploadFileUniqueId) in
                print("********************************")
                print("UploadFileUniqueId is = \(uploadFileUniqueId)")
                print("********************************")
            }, progress: { (progress) in
                print("Upload File progress is = \(progress)")
            }, completion: { (response) in
                print("********************************")
                print("Response from Upload File:")
                let responseModel: UploadFileModel = response as! UploadFileModel
                let responseJSON: JSON = responseModel.returnDataAsJSON()
                print("\(responseJSON)")
                print("********************************")
            })
            
//            let inputModel = UploadImageRequestModel(dataToSend: data, fileExtension: nil, fileName: "newPic", fileSize: nil, originalFileName: nil, threadId: nil, uniqueId: nil, xC: nil, yC: nil, hC: nil, wC: nil)
//            myChatObject?.uploadImage(uploadImageInput: inputModel, uniqueId: { (UploadImageUniqueId) in
//                print("UploadImageUniqueId is = \(UploadImageUniqueId)")
//            }, progress: { (progress) in
//                print("Upload Image progress is = \(progress)")
//            }, completion: { (response) in
//                let responseModel: UploadImageModel = response as! UploadImageModel
//                let responseJSON: JSON = responseModel.returnDataAsJSON()
//                print("\(responseJSON)")
//            })
        }
    }
    
    
    @objc func uploadImageButtonPressed() {
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    
    @objc func sendFileMessageButtonnPressed() {
        
        let metadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
//        let paramsToSendMessage: JSON = ["subjectId": 1101, "content": "\(inputTextFieldToSendMessage.text ?? "empty message")", "metaData": metadata]
        
        let image = UIImage(named: "pic")
        if let data = UIImageJPEGRepresentation(image!, 1) {
//            let uploadParams: JSON = ["fileName": "newPic"]
//
//            myChatObject?.sendFileMessage(textMessagParams: paramsToSendMessage, fileParams: uploadParams, imageToSend: nil, fileToSend: data, uniqueId: { (messageUniqueId) in
//                print("message unique id is = \(messageUniqueId)")
//            }, uploadProgress: { (prpgress) in
//                print("upload progress is = \(prpgress)")
//            }, onSent: { (isSent) in
//                print("++++++++++++++++++++++++++")
//                print("message Sent:")
//                print("\(isSent)")
//                print("++++++++++++++++++++++++++")
//            }, onDelivered: { (isDelivered) in
//                print("++++++++++++++++++++++++++")
//                print("message Deliver:")
//                print("\(isDelivered)")
//                print("++++++++++++++++++++++++++")
//            }, onSeen: { (isSeen) in
//                print("++++++++++++++++++++++++++")
//                print("message Seen:")
//                print("\(isSeen)")
//                print("++++++++++++++++++++++++++")
//            })
            
            
            let inputModel = SendFileMessageRequestModel(fileName: "newPic", imageName: "newPic", xC: nil, yC: nil, hC: nil, wC: nil, threadId: 1101, content: "empty message", metaData: metadata, repliedTo: nil, subjectId: 1101, typeCode: nil, fileToSend: data, imageToSend: nil)
            myChatObject?.sendFileMessage(sendFileMessageInput: inputModel, uniqueId: { (messageUniqueId) in
                print("message unique id is = \(messageUniqueId)")
            }, uploadProgress: { (prpgress) in
                print("upload progress is = \(prpgress)")
            }, onSent: { (isSent) in
                print("message Sent:")
                print("\(isSent)")
            }, onDelivered: { (isDelivered) in
                print("message Deliver:")
                print("\(isDelivered)")
            }, onSeen: { (isSeen) in
                print("message Seen:")
                print("\(isSeen)")

            })
            
        }
    }
    
    
    @objc func muteThreadButtonPressed() {
//        let paramsToSend: JSON = ["subjectId": 1101]
//        myChatObject?.muteThread(params: paramsToSend, uniqueId: { (muteThreadUniqueId) in
//            print("\n mute thread request uniqueId = \t \(muteThreadUniqueId) \n")
//        }, completion: { (response) in
//            print("***********************")
//            print("\n this is my mute thread response:")
//            print("\(response) \n")
//            print("***********************")
//        })
        
        let inputModel = MuteAndUnmuteThreadRequestModel(subjectId: 1101, typeCode: nil)
        myChatObject?.muteThread(muteThreadInput: inputModel, uniqueId: { (muteThreadUniqueId) in
            print("\n mute thread request uniqueId = \t \(muteThreadUniqueId) \n")
        }, completion: { (response) in
            print("\n this is my mute thread response:")
            print("\(response) \n")
        })
    }
    
    
    @objc func unmuteThreadButtonPressed() {
//        let paramsToSend: JSON = ["subjectId": 1101]
//        myChatObject?.unmuteThread(params: paramsToSend, uniqueId: { (unmuteThreadUniqueId) in
//            print("\n unmute thread request uniqueId = \t \(unmuteThreadUniqueId) \n")
//        }, completion: { (response) in
//            print("***********************")
//            print("\n this is my unmute thread response:")
//            print("\(response) \n")
//            print("***********************")
//        })
        
        let inputModel = MuteAndUnmuteThreadRequestModel(subjectId: 1101, typeCode: nil)
        myChatObject?.unmuteThread(unmuteThreadInput: inputModel, uniqueId: { (unmuteThreadUniqueId) in
            print("\n unmute thread request uniqueId = \t \(unmuteThreadUniqueId) \n")
        }, completion: { (response) in
            print("\n this is my unmute thread response:")
            print("\(response) \n")
        })
        
    }
    
    
    @objc func updateThreadInfoButtonPressed() {
        let metaData: JSON = ["id": 1202,
                              "owner": "masoudmanson",
                              "name": "Masoud"]
        let paramsToSend: JSON = ["subjectId": 1202,
                                  "image": "https://static2.farakav.com/files/pictures/thumb/01330672.jpg",
                                  "description": "توضیحات ترد",
                                  "title": "عنوان ترد",
                                  "metadata": metaData]
        myChatObject?.updateThreadInfo(params: paramsToSend, uniqueId: { (updateThreadInfoUniqueId) in
            print("***************************")
            print("update thread info unique id = \(updateThreadInfoUniqueId)")
            print("***************************")
        }, completion: { (response) in
            print("***************************")
            print("***************************")
            print("\(response)")
            print("***************************")
            print("***************************")
        })
    }
    
    
    @objc func syncContactsButtonPressed() {
        myChatObject?.syncContacts(uniqueId: { (syncContactUniqueId) in
            print("\n sync Contact request uniqueId = \t \(syncContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my sync contacts response:")
            print("\(myResponseJSON)")
        }, cacheResponse: { ([ContactModel]) in
//            <#code#>
        })
        
    }
    
    
    @objc func searchContactsButtonPressed() {
//        let paramsToSend: JSON = ["firstName": "Mas"]
//        myChatObject?.searchContacts(params: paramsToSend, uniqueId: { (searchContactsUniqueId) in
//            print("\n search contacts request uniqueId = \t\(searchContactsUniqueId)")
//        }, completion: { (myResponse) in
//            print("***********************")
//            let myResponseModel: ContactModel = myResponse as! ContactModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my search contacts response:")
//            print("\(myResponseJSON) \n")
//            print("***********************")
//        })
        
        let inputModel = SearchContactsRequestModel(cellphoneNumber: "09368640180",
                                                    email: "",
                                                    firstName: nil,
                                                    id: nil,
                                                    lastName: nil,
                                                    offset: nil,
                                                    size: nil,
                                                    uniqueId: nil)
        myChatObject?.searchContacts(searchContactsInput: inputModel, uniqueId: { (searchContactsUniqueId) in
            print("\n search contacts request uniqueId = \t\(searchContactsUniqueId)")
        }, completion: { (myResponse) in
            print("***********************")
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my search contacts response from Server:")
            print("\(myResponseJSON) \n")
            print("***********************")
        }, cacheResponse: { (searchContactResponse) in
            print("\n this is my search contact response from Cache:")
            let responseJSON = searchContactResponse.returnDataAsJSON()
            print("\(responseJSON)")
        })
        
    }
    
    
    @objc func searchHistoryButtonPressed() {  }
    @objc func searchThreadButtonPressed() {  }
    
 
    @objc func blockContactButtonPressed() {
//        let paramsToSend: JSON = ["contactId": 563]
//        myChatObject?.blockContact(params: paramsToSend, uniqueId: { (blockContactUniqueId) in
//            print("\n block request uniqueId = \t \(blockContactUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("***********************")
//            print("\n this is my block response:")
//            let myResponseModel: BlockedContactModel = myResponse as! BlockedContactModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\(myResponseJSON) \n")
//            print("***********************")
//        })
        
        let inputModel = BlockContactsRequestModel(contactId: nil, threadId: nil, typeCode: nil, userId: 481)
        myChatObject?.blockContact(blockContactsInput: inputModel, uniqueId: { (blockContactUniqueId) in
            print("\n block request uniqueId = \t \(blockContactUniqueId) \n")
        }, completion: { (myResponse) in
            print("***********************")
            print("\n this is my block response:")
            let myResponseModel: BlockedContactModel = myResponse as! BlockedContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\(myResponseJSON) \n")
            print("***********************")
        })
        
    }
    
    
    @objc func unblockContactButtonPressed() {
//        let paramsToSend: JSON = ["blockId": 61]
//        myChatObject?.unblockContact(params: paramsToSend, uniqueId: { (unblockContactUniqueId) in
//            print("\n unblock request uniqueId = \t \(unblockContactUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("***********************")
//            print("\n this is my unblock response:")
//            let myResponseModel: BlockedContactModel = myResponse as! BlockedContactModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\(myResponseJSON) \n")
//            print("***********************")
//        })
        
        let inputModel = UnblockContactsRequestModel(blockId: 462, contactId: nil, threadId: nil, typeCode: nil, userId: nil)
        myChatObject?.unblockContact(unblockContactsInput: inputModel, uniqueId: { (unblockContactUniqueId) in
            print("\n unblock request uniqueId = \t \(unblockContactUniqueId) \n")
        }, completion: { (myResponse) in
            print("***********************")
            print("\n this is my unblock response:")
            let myResponseModel: BlockedContactModel = myResponse as! BlockedContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\(myResponseJSON) \n")
            print("***********************")
        })
        
    }
    
    
    @objc func getBlockedContactsButtonPressed() {

//        myChatObject?.getBlockedContacts(params: nil, uniqueId: { (getBlockedContactListUniqueId) in
//            print("\n get blocked list request uniqueId = \t \(getBlockedContactListUniqueId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: GetBlockedContactListModel = myResponse as! GetBlockedContactListModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my get blocked list response:")
//            print("\(myResponseJSON) \n")
//        })
        
        let inputModel = GetBlockedContactListRequestModel(count: nil, offset: nil, typeCode: nil)
        myChatObject?.getBlockedContacts(getBlockedContactsInput: inputModel, uniqueId: { (getBlockedContactListUniqueId) in
            print("\n get blocked list request uniqueId = \t \(getBlockedContactListUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetBlockedContactListModel = myResponse as! GetBlockedContactListModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get blocked list response:")
            print("\(myResponseJSON) \n")
        })
        
    }
    
    
    @objc func leaveThreadButtonPressed() {
//        let paramsToSend: JSON = ["threadId": 1343]
//        myChatObject?.leaveThread(params: paramsToSend, uniqueId: { (leaveThreadUniqueId) in
//            print("\n get blocked list request uniqueId = \t \(leaveThreadUniqueId) \n")
//        }, completion: { (myResponse) in
//            let myResponseModel: CreateThreadModel = myResponse as! CreateThreadModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\n this is my leave thread response:")
//            print("\(myResponseJSON) \n")
//        })
        
        let inputModel = LeaveThreadRequestModel(content: nil, threadId: 1343, typeCode: nil, uniqueId: nil)
        myChatObject?.leaveThread(leaveThreadInput: inputModel, uniqueId: { (leaveThreadUniqueId) in
            print("\n get blocked list request uniqueId = \t \(leaveThreadUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: CreateThreadModel = myResponse as! CreateThreadModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my leave thread response:")
            print("\(myResponseJSON) \n")
        })
    }
    
    
    @objc func spamThreadButtonPressed() {
        let paramsToSend: JSON = ["threadId": 1329]
        myChatObject?.spamPvThread(params: paramsToSend, uniqueId: { (spamThreadUniqueId) in
            print("\n get blocked list request uniqueId = \t \(spamThreadUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my spam thread response:")
            print("\(myResponse) \n")
        })
    }
    
    
    @objc func messageDeliverListButtonPressed() {
        let paramsToSend: JSON = ["messageId": 16791, "subjectId": 1330]
        myChatObject?.messageDeliveryList(params: paramsToSend, uniqueId: { (messageDeliverListUniqueId) in
            print("\n Message Deliver list request uniqueId = \t \(messageDeliverListUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my Message Deliver list response:")
            let responseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
            let responseJSON: JSON = responseModel.returnDataAsJSON()
            print("\(responseJSON) \n")
        })
    }
    
    @objc func messageSeenListButtonPressed() {
        let paramsToSend: JSON = ["messageId": 16791]
        myChatObject?.messageSeenList(params: paramsToSend, uniqueId: { (messageSeenListUniqueId) in
            print("\n Message Seen list request uniqueId = \t \(messageSeenListUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my Message Seen list response:")
            let responseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
            let responseJSON: JSON = responseModel.returnDataAsJSON()
            print("\(responseJSON) \n")
        })
    }
    
    
    @objc func getImgeButtonPressed() {
        
//        let inputModel = GetImageRequestModel(actual: nil, downloadable: nil, hashCode: "16822cbb454-0.1323003203052482", height: nil, imageId: 52164, width: nil)
//        let inputModel = GetImageRequestModel(actual: nil, downloadable: nil, hashCode: "1681e9e6009-0.3921679128527612", height: nil, imageId: 52146, width: nil)
        let inputModel = GetImageRequestModel(actual: nil, downloadable: nil, height: nil, hashCode: "16803a16292-0.15831373791354997", imageId: 52004, width: nil)

        myChatObject?.getImage(getImageInput: inputModel, uniqueId: { (getImageUniqueId) in
            print("getImage UniqueId = \(getImageUniqueId)")
        }, progress: { (myDownloadProgress) in
            print("downloadProcess = \(myDownloadProgress)")
        }, completion: { (data, responseModel) in
            print("This is my GetImage Response from Server")
            let rsponseJSON = responseModel.returnDataAsJSON()
            print("\(rsponseJSON)")
        }, cacheResponse: { (cacheResponse, filePath) in
            print("This is my GetImage Response from Cache")
            let rsponseJSON = cacheResponse.returnDataAsJSON()
            print("response = \(rsponseJSON)")
            print("filePath = \(filePath)")
        })
        
    }
    
    @objc func getFileButtonPressed() {
        
        let inputModel = GetFileRequestModel(downloadable: true, fileId: 52171, hashCode: "168232d744d-0.9990232707506134")
        myChatObject?.getFile(getFileInput: inputModel, uniqueId: { (getFileUniqueId) in
            print("getFile UniqueId = \(getFileUniqueId)")
        }, progress: { (myDownloadProgress) in
            print("downloadProcess = \(myDownloadProgress)")
        }, completion: { (data, response) in
            print("This is my GetFile Response from Server")
            let rsponseJSON = response.returnDataAsJSON()
            print("\(rsponseJSON)")
        }, cacheResponse: { (cacheResponse, filePath) in
            print("This is my GetFile Response from Cache")
            let rsponseJSON = cacheResponse.returnDataAsJSON()
            print("response = \(rsponseJSON)")
            print("filePath = \(filePath)")
        })
        
    }
    
    
    @objc func mapReverseButtonPressed() {
        let inputModel = MapReverseRequestModel(lat: 36.310886959563085, lng: 59.53563741408013)
        myChatObject?.mapReverse(mapReverseInput: inputModel, uniqueId: { (mapReverseUniqueId) in
            print("Map Reverse UniqueId request = \(mapReverseUniqueId)")
        }, completion: { (theResponse) in
            let res = theResponse as! MapReverseModel
            print("Map Reverse Response: \n\(res.returnDataAsJSON())")
        })
    }
    
    @objc func mapSearchButtonPressed() {
        let inputModel = MapSearchRequestModel(lat: 36.310886959563085, lng: 59.53563741408013, term: "س")
        myChatObject?.mapSearch(mapSearchInput: inputModel, uniqueId: { (mapSearchUniqueId) in
            print("Map Search UniqueId request = \(mapSearchUniqueId)")
        }, completion: { (theResponse) in
            let res = theResponse as! MapSearchModel
            print("Map Reverse Response: \n\(res.returnDataAsJSON())")
        })
    }
    
    @objc func mapRoutingButtonPressed() {
        let inputModel = MapRoutingRequestModel(alternative: true, destinationLat: 36.310886959563085, destinationLng: 59.53563741408013, originLat: 36.28984398444424, originLng: 59.59045107288)
        myChatObject?.mapRouting(mapRoutingInput: inputModel, uniqueId: { (mapRoutingUniqueId) in
            print("Map Routing UniqueId request = \(mapRoutingUniqueId)")
        }, completion: { (theResponse) in
            let res = theResponse as! MapRoutingModel
            print("Map Reverse Response: \n\(res.returnDataAsJSON())")
        })
    }
    
    @objc func mapStaticImageButtonPressed() {
        let inputModel = MapStaticImageRequestModel(centerLat: 36.310886959563085, centerLng: 59.53563741408013, height: 500, type: "standard-night", width: 800, zoom: 15)
        myChatObject?.mapStaticImage(mapStaticImageInput: inputModel, uniqueId: { (mapStaticImageUniqueId) in
            print("Map Static Image UniqueId request = \(mapStaticImageUniqueId)")
        }, progress: { (myProgress) in
            print("progress downloaded: \(myProgress)")
        }, completion: { (theResponse) in
            print("Image Downloaded Successfully")
        })
    }
    
    @objc func sendLocationMessageButtonPressed() {
        let metadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
        let locationMessage = SendLocationMessageRequestModel(mapStaticCenterLat:   36.310886959563085,
                                                              mapStaticCenterLng:   59.53563741408013,
                                                              mapStaticHeight:      500,
                                                              mapStaticType:        "standard-night",
                                                              mapStaticWidth:       800,
                                                              mapStaticZoom:        15,
                                                              sendMessageImageName: "staticLocationPic",
                                                              sendMessageXC:        nil,
                                                              sendMessageYC:        nil,
                                                              sendMessageHC:        nil,
                                                              sendMessageWC:        nil,
                                                              sendMessageThreadId:  1342,
                                                              sendMessageContent:   "This is my location on the map",
                                                              sendMessageMetaData:  metadata,
                                                              sendMessageRepliedTo: nil,
                                                              sendMessageSubjectId: 1342,
                                                              sendMessageTypeCode:  nil)
        
        myChatObject?.sendLocationMessage(sendLocationMessageRequest: locationMessage, uniqueId: { (sendLocationMessageUniqueId) in
            print("sendLocationMessageUniqueId = \(sendLocationMessageUniqueId)")
        }, downloadProgress: { (progress) in
            print("downloaded progress = \(progress)")
        }, uploadProgress: { (progress) in
            print("uploaded progress = \(progress)")
        }, onSent: { (sent) in
            print("the messsage has been sent: \n\(sent)")
        }, onDelivere: { (deliver) in
            print("the messsage has been delivered: \n\(deliver)")
        }, onSeen: { (seen) in
            print("the messsage has been seen: \n\(seen)")
        })
    }
    
    
}








extension MyViewController: ChatDelegates {
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
    
    func userEvents(type: UserEventTypes, result: Any) {
        //
    }
    
    func contactEvents(type: ContactEventTypes, result: Any) {
        //
    }
    
    func chatDeliver(messageId: Int, ownerId: Int) {
        //
    }
    
    func messageEvents(type: MessageEventTypes, result: Any) {
        //
    }
    
    func threadEvents(type: ThreadEventTypes, result: Any) {
        //
    }
    
    func chatError(errorCode: Int, errorMessage: String, errorResult: Any?) {
        //
    }
    
    
}





extension MyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCollectionViewCell
        cell.backgroundColor = logBackgroundColor[indexPath.item]
        cell.myTextView.text = logArr[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cgfloatHeight: CGFloat = CGFloat(logHeightArr[indexPath.item])
        return CGSize(width: view.frame.width - 32, height: cgfloatHeight)
    }
    
}




class MyCollectionViewCell: UICollectionViewCell {
    
    let myTextView: UITextView = {
        let mtv = UITextView()
        mtv.translatesAutoresizingMaskIntoConstraints = false
        mtv.backgroundColor = UIColor.clear
        return mtv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        addSubview(myTextView)
        myTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        myTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        myTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2).isActive = true
        myTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

























































