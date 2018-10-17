//
//  ViewController.swift
//  SimpleAppUsingChat
//
//  Created by Mahyar Zhiani on 6/10/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import UIKit
import SwiftyJSON
import Chat





class MyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let cellId = "cellId"
    var logArr = [String]()
    var logHeightArr = [Int]()
    var logBackgroundColor = [UIColor]()
    //    let cellColors = [UIColor.red, UIColor.green, UIColor.blue]
    
    var myChatObject: Chat?
    
    let socketAddress           = "ws://172.16.106.26:8003/ws"
    let serverName              = "chat-server"
    let token                   = "7a18deb4a4b64339a81056089f5e5922"    // ialexi
    //    let token                   = "6421ecebd40b4d09923bcf6379663d87"    // iFelfeli
    //    let token                   = "7cba09ff83554fc98726430c30afcfc6"
    //    let token                   = "6421ecebd40b4d09923bcf6379663d87"
//        let token = "fbd4ecedb898426394646e65c6b1d5d1" //  {**REQUIRED**} SSO Token JiJi
    //    let token = "5fb88da4c6914d07a501a76d68a62363" // {**REQUIRED**} SSO Token FiFi
    //    let token = "bebc31c4ead6458c90b607496dae25c6" // {**REQUIRED**} SSO Token Alexi
    //    let token = "e4f1d5da7b254d9381d0487387eabb0a" // {**REQUIRED**} SSO Token Felfeli
    
    let ssoHost                 = "http://172.16.110.76"
    let platformHost            = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} Platform Core Address
    let fileServer              = "http://172.16.106.26:8080/hamsam"    // {**REQUIRED**} File Server Address
    let wsConnectionWaitTime    = 1                 // Time out to wait for socket to get ready after open
    let connectionRetryInterval = 5                 // Time interval to retry registering device or registering server
    let connectionCheckTimeout  = 10                // Socket connection live time on server
    let messageTtl              = 86400             // Message time to live
    let reconnectOnClose        = true              // auto connect to socket after socket close
    
    let getUserInfoButton: UIButton = {
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
        mb.addTarget(self, action: #selector(uploadFileButtonPressed), for: UIControlEvents.touchUpInside)
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
        
        myChatObject = Chat(socketAddress: socketAddress, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: token, msgPriority: 1, msgTTL: messageTtl, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: Double(wsConnectionWaitTime), connectionRetryInterval: connectionRetryInterval, connectionCheckTimeout: connectionCheckTimeout, messageTtl: messageTtl, reconnectOnClose: true)
        myChatObject?.delegate = self
        
        //        myChatObject = Chat(...)
        //        myChatObject!.delegate = self
        
        
    }
    
    func setupView() {
        view.addSubview(getUserInfoButton)
        view.addSubview(getThreadsButton)
        view.addSubview(getHistoryButton)
        view.addSubview(getThreadParticipantsButton)
        view.addSubview(createThreadButton)
        view.addSubview(getContactsButton)
        
        view.addSubview(inputTextFieldToSendMessage)
        view.addSubview(sendMessageToSocketButton)
        
        view.addSubview(addParticipantButton)
        view.addSubview(removeParticipantButton)
        
        view.addSubview(addContactButton)
        view.addSubview(updateContactButton)
        view.addSubview(removeContactButton)
        
        view.addSubview(uploadFileButton)
        view.addSubview(uploadImageButton)
        
        view.addSubview(logView)
        logView.addSubview(myLogCollectionView)
        
        getUserInfoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        getUserInfoButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        getUserInfoButton.widthAnchor.constraint(equalToConstant: ((view.frame.width - 24) / 2)).isActive = true
        getUserInfoButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        getThreadsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        getThreadsButton.leftAnchor.constraint(equalTo: getUserInfoButton.rightAnchor, constant: 8).isActive = true
        getThreadsButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        getThreadsButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        getHistoryButton.topAnchor.constraint(equalTo: getUserInfoButton.bottomAnchor, constant: 4).isActive = true
        getHistoryButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        getHistoryButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        getHistoryButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        getThreadParticipantsButton.topAnchor.constraint(equalTo: getThreadsButton.bottomAnchor, constant: 4).isActive = true
        getThreadParticipantsButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getThreadParticipantsButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getThreadParticipantsButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        createThreadButton.topAnchor.constraint(equalTo: getHistoryButton.bottomAnchor, constant: 4).isActive = true
        createThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        createThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        createThreadButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        getContactsButton.topAnchor.constraint(equalTo: getThreadParticipantsButton.bottomAnchor, constant: 4).isActive = true
        getContactsButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getContactsButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getContactsButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        inputTextFieldToSendMessage.topAnchor.constraint(equalTo: createThreadButton.bottomAnchor, constant: 8).isActive = true
        inputTextFieldToSendMessage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        inputTextFieldToSendMessage.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        inputTextFieldToSendMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        sendMessageToSocketButton.topAnchor.constraint(equalTo: inputTextFieldToSendMessage.bottomAnchor, constant: 4).isActive = true
        sendMessageToSocketButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        sendMessageToSocketButton.rightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        sendMessageToSocketButton.leftAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        sendMessageToSocketButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addParticipantButton.topAnchor.constraint(equalTo: sendMessageToSocketButton.bottomAnchor, constant: 8).isActive = true
        addParticipantButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        addParticipantButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        addParticipantButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        removeParticipantButton.topAnchor.constraint(equalTo: sendMessageToSocketButton.bottomAnchor, constant: 8).isActive = true
        removeParticipantButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        removeParticipantButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        removeParticipantButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        addContactButton.topAnchor.constraint(equalTo: addParticipantButton.bottomAnchor, constant: 8).isActive = true
        addContactButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        addContactButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        addContactButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        updateContactButton.topAnchor.constraint(equalTo: addContactButton.topAnchor).isActive = true
        updateContactButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        updateContactButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        updateContactButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        removeContactButton.topAnchor.constraint(equalTo: addContactButton.bottomAnchor, constant: 8).isActive = true
        removeContactButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        removeContactButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        removeContactButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        uploadFileButton.topAnchor.constraint(equalTo: removeContactButton.bottomAnchor, constant: 8).isActive = true
        uploadFileButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        uploadFileButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        uploadFileButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        uploadImageButton.topAnchor.constraint(equalTo: uploadFileButton.topAnchor).isActive = true
        uploadImageButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        uploadImageButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        uploadImageButton.bottomAnchor.constraint(equalTo: uploadFileButton.bottomAnchor).isActive = true
        
        logView.topAnchor.constraint(equalTo: uploadFileButton.bottomAnchor, constant: 8).isActive = true
        logView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        logView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        logView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        myLogCollectionView.topAnchor.constraint(equalTo: logView.topAnchor, constant: 8).isActive = true
        myLogCollectionView.leftAnchor.constraint(equalTo: logView.leftAnchor, constant: 8).isActive = true
        myLogCollectionView.rightAnchor.constraint(equalTo: logView.rightAnchor, constant: -8).isActive = true
        myLogCollectionView.bottomAnchor.constraint(equalTo: logView.bottomAnchor, constant: -8).isActive = true
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImage: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
        if let data = UIImageJPEGRepresentation(selectedImage!, 1) {
            
            let myParams: JSON = ["fileName": "newPicture"]
            myChatObject?.uploadFile(params: myParams, dataToSend: data, uniqueId: { (uploadFileUniqueId) in
                print("UploadFileUniqueId is = \(uploadFileUniqueId)")
            }, completion: { (response) in
                print("Response from Upload File:")
                print("\(response)")
            })
        }
        
    }
    
}




// implement button pressed actions
extension MyViewController {
    
    @objc func getUserInfoButtonPressed() {
        myChatObject?.getUserInfo(uniqueId: { (getUserInfoUniqueId) in
            print("\n get user info request uniqueId = \t \(getUserInfoUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: UserInfoModel = myResponse as! UserInfoModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get user info response:")
            print("\(myResponseJSON) \n")
        })
    }
    
    
    @objc func getThreadsButtonPressed() {
        let paramsToSend: JSON = ["count": 5, "offset": 0]
        myChatObject?.getThreads(params: paramsToSend, uniqueId: { (getThreadUniqueId) in
            print("\n get thread request uniqueId = \t \(getThreadUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetThreadsModel = myResponse as! GetThreadsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get thread response:")
            print("\(myResponseJSON) \n")
        })
    }
    
    
    @objc func getHistoryButtonPressed() {
        let paramsToSend: JSON = ["threadId": 1133, "count": 5, "offset": 0]
        myChatObject?.getHistory(params: paramsToSend, uniqueId: { (getHistoryUniqueId) in
            print("\n get history request uniqueId = \t \(getHistoryUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetHistoryModel = myResponse as! GetHistoryModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get history response:")
            print("\(myResponseJSON) \n")
        })
    }
    
    
    @objc func getThreadParticipantsButtonPressed() {
        let paramsToSend: JSON = ["count": 3, "offset": 0, "threadId": 1133]
        myChatObject?.getThreadParticipants(params: paramsToSend, uniqueId: { (getThreadParticipantUniqueId) in
            print("\n get thread participant request unique id = \t \(getThreadParticipantUniqueId) \t")
        }, completion: { (myResponse) in
            let myResponseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get thread participants response:")
            print("\(myResponseJSON) \n")
        })
    }
    
    
    @objc func createThreadButtonPressed() {
        let invitees: [JSON] = [["id": "09122964316", "idType": inviteeVOidTypes.TO_BE_USER_CELLPHONE_NUMBER.rawValue]]
        let paramsToSend: JSON = ["type": "NORMAL", "title": "helooooo", "invitees": invitees]
        myChatObject?.createThread(params: paramsToSend, uniqueId: { (createThreadUniqueId) in
            print("\n create thread reqeuest uniqueId = \t \(createThreadUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: CreateThreadModel = myResponse as! CreateThreadModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my create thread response:")
            print("\(myResponseJSON) \n")
        })
    }
    
    
    @objc func getContactsButtonPressed() {
        myChatObject?.getContacts(params: nil, uniqueId: { (getContactUniqueId) in
            print("\n get contact request uniqueId = \t \(getContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetContactsModel = myResponse as! GetContactsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get contacts response:")
            print("\(myResponseJSON) \n")
        })
    }
    
    
    @objc func sendMessageToSocketPressed() {
//        sendMessage()
        //        editMessage()
        //        replyMessage()
        //        forwardMessage()
        deleteMessage()
    }
    
    
    func sendMessage() {
        let metadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
        let paramsToSend: JSON = ["subjectId": 1133, "content": "\(inputTextFieldToSendMessage.text ?? "empty message")", "metaData": metadata]
        myChatObject?.sendTextMessage(params: paramsToSend, uniqueId: { (uniqueIdStr) in
            print("**************************")
            print("message uniqueId is: \(uniqueIdStr)")
            print("**************************")
        }, onSent: { (isSent) in
            print("**************************")
            print("the message is sent = \(isSent)")
            print("**************************")
        }, onDelivere: { (isDeliver)  in
            print("**************************")
            print("the message is delivered: '\(isDeliver)'")
            print("**************************")
        }, onSeen: { (isSeen) in
            print("**************************")
            print("the message with is Seen: '\(isSeen)'")
            print("**************************")
        })
    }
    
    
    func editMessage() {
        let cont: JSON = ["subjectId": 15395, "content": "\(inputTextFieldToSendMessage.text ?? "empty message")"]
        myChatObject?.editMessage(params: cont, uniqueId: { (editMessageUniqueId) in
            print("\n edit message request uniqueId = \t \(editMessageUniqueId) \n")
        }, completion: { (successResponse) in
            print("**************************")
            print("message is edited successfully: \(successResponse)")
            print("**************************")
        })
    }
    
    
    func replyMessage() {
        let paramsToSend: JSON = ["subjectId": 1133,"repliedTo": 15397,"content": "\(inputTextFieldToSendMessage.text ?? "empty message")"]
        myChatObject?.replyMessageWith3Callbacks(params: paramsToSend, uniqueId: { (uniqueIdStr) in
            print("**************************")
            print("**************************")
            print("message uniqueId is: \(uniqueIdStr)")
            print("**************************")
            print("**************************")
        }, onSent: { (isSent) in
            print("**************************")
            print("**************************")
            print("the message is sent = \(isSent)")
            print("**************************")
            print("**************************")
        }, onDelivere: { (isDeliver)  in
            print("**************************")
            print("**************************")
            print("the message is delivered: '\(isDeliver)'")
            print("**************************")
            print("**************************")
        }, onSeen: { (isSeen) in
            print("**************************")
            print("the message with is Seen: '\(isSeen)'")
            print("**************************")
        })
    }
    
    
    func forwardMessage() {
        let paramsToSend: JSON = ["subjectId": 1133,"content": [15395]]
        myChatObject?.forwardMessageWith3Callbacks(params: paramsToSend, uniqueIds: { (uniqueIdArr) in
            print("**************************")
            print("**************************")
            print("message uniqueId is: \(uniqueIdArr)")
            print("**************************")
            print("**************************")
        }, onSent: { (isSent) in
            print("**************************")
            print("**************************")
            print("the message is sent = \(isSent)")
            print("**************************")
            print("**************************")
        }, onDelivere: { (isDeliver)  in
            print("**************************")
            print("**************************")
            print("the message is delivered: '\(isDeliver)'")
            print("**************************")
            print("**************************")
        }, onSeen: { (isSeen) in
            print("**************************")
            print("the message with is Seen: '\(isSeen)'")
            print("**************************")
        })
    }
    
    
    func deleteMessage() {
        let paramsToSend: JSON = ["subjectId": 15676]
        myChatObject?.deleteMessage(params: paramsToSend, uniqueId: { (deleteMEssageUniqueId) in
            print("Delete Message Unique ID")
        }, completion: { (response) in
            print("delete Message response: \n \(response)")
        })
    }
    
    
    @objc func addParticipantsButtonPressed() {
        //        let paramsToSend: JSON = ["threadId": 1133, "contacts": [583, 583]]
        //        myChatObject?.addParticipants(params: paramsToSend, uniqueId: { (addParticipantsUniqueId) in
        //            print("\n add participant request uniqueId = \t \(addParticipantsUniqueId) \n")
        //        }, completion: { (myResponse) in
        //            print("\n this is my add participants response:")
        //            print("\(myResponse) \n")
        //        })
    }
    
    
    @objc func removeParticipantsButtonPressed() {
        
    }
    
    
    @objc func addContactButtonPressed() {
        let params: JSON = ["firstName": "Leornardo2",
                            "lastName": "DiCaprio2",
                            "cellphoneNumber": "09122964316"]
        myChatObject?.addContact(params: params, uniqueId: { (addContactUniqueId) in
            print("\n add Contact request uniqueId = \t \(addContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my add contacts response:")
            print("\(myResponseJSON)")
        })
    }
    
    
    @objc func updateContactButtonPressed() {
        let params: JSON = ["id": 1801,
                            "firstName": "mahyar",
                            "lastName": "Zhiani",
                            "cellphoneNumber": "0935",
                            "email": "asdfa@ads.com"]
        myChatObject?.updateContact(params: params, uniqueId: { (updateContactUniqueId) in
            print("\n update Contact request uniqueId = \t \(updateContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my update contacts response:")
            print("\(myResponseJSON)")
            
        })
    }
    
    
    @objc func removeContactButtonPressed() {
        let params: JSON = ["id": 1801]
        myChatObject?.removeContact(params: params, uniqueId: { (removeContactUniqueId) in
            print("\n remove Contact request uniqueId = \t \(removeContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: RemoveContactModel = myResponse as! RemoveContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my Remove contacts response:")
            print("\(myResponseJSON)")
        })
    }
    
    
    @objc func uploadFileButtonPressed() {
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    
    @objc func uploadImageButtonPressed() {
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    
}








extension MyViewController: ChatDelegates {
    
    func chatConnected() {
        //        print("@@MyLog(Chat): connect")
    }
    
    func chatDisconnect() {
        //        print("@@MyLog(Chat): disconnect")
    }
    
    func chatReconnect() {
        //        print("@@MyLog(Chat): reconnect")
    }
    
    func chatThreadEvents() {
        //        print("@@MyLog(Chat): thread events")
    }
    
    func chatReady() {
        //        print("@@MyLog(Chat): chat ready")
    }
    
    func chatError(errorCode: Int, errorMessage: String, errorResult: Any?) {
        //        print("@@MyLog(Chat): error: errCode = \(errorCode), errMsg = \(errorMessage)")
    }
    
    func chatState(state: Int) {
        //        print("@@MyLog(Chat): chat state = \(state)")
    }
    
    func chatDeliver(messageId: Int, ownerId: Int) {
        //        print("@@MyLog(Chat): deliver with messageId = \(messageId), and ownerId = \(ownerId)")
    }
    
    func messageEvents(type: String, result: JSON) {
        //        print("@@MyLog(Chat): message events with \n type = \(type) \n result: \(result)")
    }
    
    func threadEvents(type: String, result: JSON) {
        //        print("@@MyLog:(Chat): ThreadEvents: \n type = \(type) , \n result: \(result) \n")
    }
    
    //    func receiveMessage(params: Any) {
    //        print("Delegate: Message Received: \n \(params) \n \n \n")
    //        let text = "Message Received from Socket: \n \(params)"
    //        addtext(text: text)
    //        logHeightArr.append(180)
    //        logBackgroundColor.append(UIColor.purple.withAlphaComponent(0.5))
    //        let data: [String : Any] = ["key1": 1, "key2": "value2"]
    //        NotificationCenter.default.post(name: NSNotification.Name("hhh"), object: nil, userInfo: data)
    //    }
    //
    //
    //    func sendMessage(params: Any) {
    //        print("Delegate: Message Send! \n \(params) \n \n")
    //        let text = "this Message sends throut socket! \(params)"
    //        addtext(text: text)
    //        logHeightArr.append(110)
    //        logBackgroundColor.append(UIColor.cyan)
    //    }
    //
    //
    //    func connect() {
    //        print("Delegate: Connected! \n \n")
    //        let text = "Socket is Connected! :)"
    //        addtext(text: text)
    //        logHeightArr.append(40)
    //        logBackgroundColor.append(UIColor.green)
    //    }
    //
    //
    //    func disconnect() {
    //        print("Delegate: Disconnected! \n \n")
    //        let text = "Socket is Disconnected! :)"
    //        addtext(text: text)
    //        logHeightArr.append(40)
    //        logBackgroundColor.append(UIColor(red: 230/255, green: 50/255, blue: 10/255, alpha: 1))
    //    }
    //
    //
    //    func reconnect() {
    //        print("Delegate: Reconnected! \n \n")
    //        let text = "Socekt is Disconnected! So try to Reconnect:)"
    //        addtext(text: text)
    //        logHeightArr.append(40)
    //        logBackgroundColor.append(UIColor.orange)
    //    }
    //
    //
    //    func asyncReady() {
    //        print("Delegate: Async Ready \n \n")
    //        let text = "Async Ready"
    //        addtext(text: text)
    //        logHeightArr.append(40)
    //        logBackgroundColor.append(UIColor.green)
    //    }
    //
    //
    //    func stateChanged(socketState: Int, timeUntilReconnect: Int, deviceRegister: Bool, serverRegister: Bool, peerId: Int) {
    //        print("Delegate: State Changed: \n socketState: \(socketState) \n timeUntilReconnect: \(timeUntilReconnect) \n deviceRegister: \(deviceRegister) \n serverRegister: \(serverRegister) \n peerId: \(peerId) \n \n")
    //        let text = "Socket State Changed: \n socketState: \(socketState) \n timeUntilReconnect: \(timeUntilReconnect) \n deviceRegister: \(deviceRegister) \n serverRegister: \(serverRegister) \n peerId: \(peerId)"
    //        addtext(text: text)
    //        logHeightArr.append(110)
    //        logBackgroundColor.append(UIColor(white: 0.7, alpha: 1))
    //    }
    //
    //
    //    func error(errorCode: Int, errorMessage: String, errorEvent: Any?) {
    //        print("Delegate: Error: \n errorCode: \(errorCode) \n errorMessage: \(errorMessage) \n \n")
    //        let text = "Error: \n errorCode: \(errorCode) \n errorMessage: \(errorMessage)"
    //        addtext(text: text)
    //        logHeightArr.append(120)
    //        logBackgroundColor.append(UIColor.red)
    //    }
    //
    //
    //    func addtext(text: String) {
    //        logArr.append(text)
    //        myLogCollectionView.reloadData()
    //    }
    
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

























































