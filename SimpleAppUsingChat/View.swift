//
//  File.swift
//  SimpleAppUsingChat
//
//  Created by Mahyar Zhiani on 7/28/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import UIKit
import FanapPodChatSDK
import SwiftyJSON


extension MyViewController {
    
    
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImage: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
        
        if let data = UIImageJPEGRepresentation(selectedImage!, 100) {
            
//            let myParams: JSON = ["imageName": "newPicture"]
//            myChatObject?.uploadImage(params: myParams, dataToSend: data, uniqueId: { (uploadFileUniqueId) in
//                print("********************************")
//                print("UploadImageUniqueId is = \(uploadFileUniqueId)")
//                print("********************************")
//            }, progress: { (progress) in
//                print("Upload Image Progress = \(progress)")
//            }, completion: { (response) in
//                print("********************************")
//                print("Response from Upload Image:")
//                let responseModel: UploadImageModel = response as! UploadImageModel
//                let responseJSON: JSON = responseModel.returnDataAsJSON()
//                print("\(responseJSON)")
//                print("********************************")
//            })
            
//            let inputModel = UploadImageRequestModel(fileExtension: nil, fileName: "newPicture", fileSize: nil, threadId: nil, uniqueId: nil, originalFileName: nil, xC: nil, yC: nil, hC: nil, wC: nil, dataToSend: data)
//            myChatObject?.uploadImage(uploadImageInput: inputModel, uniqueId: { (uploadFileUniqueId) in
//                print("********************************")
//                print("UploadImageUniqueId is = \(uploadFileUniqueId)")
//                print("********************************")
//            }, progress: { (progress) in
//                print("Upload Image Progress = \(progress)")
//            }, completion: { (response) in
//                print("********************************")
//                print("Response from Upload Image:")
//                let responseModel: UploadImageModel = response as! UploadImageModel
//                let responseJSON: JSON = responseModel.returnDataAsJSON()
//                print("\(responseJSON)")
//                print("********************************")
//            })
            
        }
        
    }
    
    
    
    
    func setupView() {
        
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        
        navigationItem.title = "Test Chat"
        
        myLogCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        myLogCollectionView.delegate = self
        myLogCollectionView.dataSource = self
        
        setupViewItems()
        setupLayouts()
    }
    
    func setupViewItems() {
        getUserInfoButton.setTitle("Get UserInfo...", for: .normal)
        getUserInfoButton.addTarget(self, action: #selector(getUserInfoButtonPressed), for: .touchUpInside)
        
        getThreadsButton.setTitle("Get Threads...", for: .normal)
        getThreadsButton.addTarget(self, action: #selector(getThreadsButtonPressed), for: .touchUpInside)
        
        getHistoryButton.setTitle("Get History...", for: .normal)
        getHistoryButton.addTarget(self, action: #selector(getHistoryButtonPressed), for: .touchUpInside)
        
        getThreadParticipantsButton.setTitle("Get thread Participants...", for: .normal)
        getThreadParticipantsButton.addTarget(self, action: #selector(getThreadParticipantsButtonPressed), for: .touchUpInside)
        
        createThreadButton.setTitle("Create Thread...", for: .normal)
        createThreadButton.addTarget(self, action: #selector(createThreadButtonPressed), for: .touchUpInside)
        
        getContactsButton.setTitle("Get Contacts...", for: .normal)
        getContactsButton.addTarget(self, action: #selector(getContactsButtonPressed), for: .touchUpInside)
        
        sendMessageToSocketButton.setTitle("Click to send message thought socket...", for: .normal)
        sendMessageToSocketButton.addTarget(self, action: #selector(sendMessageToSocketPressed), for: .touchUpInside)
        
        addParticipantButton.setTitle("Sent isTyping...", for: .normal)
        addParticipantButton.addTarget(self, action: #selector(addParticipantsButtonPressed), for: .touchUpInside)
        
        removeParticipantButton.setTitle("Remove Participant...", for: .normal)
        removeParticipantButton.addTarget(self, action: #selector(removeParticipantsButtonPressed), for: .touchUpInside)
        
        addContactButton.setTitle("Add Contact...", for: .normal)
        addContactButton.addTarget(self, action: #selector(addContactButtonPressed), for: .touchUpInside)
        
        updateContactButton.setTitle("Update Contact...", for: .normal)
        updateContactButton.addTarget(self, action: #selector(updateContactButtonPressed), for: .touchUpInside)
        
        removeContactButton.setTitle("Remove Contact...", for: .normal)
        removeContactButton.addTarget(self, action: #selector(removeContactButtonPressed), for: .touchUpInside)
        
        uploadFileButton.setTitle("Upload File...", for: .normal)
        uploadFileButton.addTarget(self, action: #selector(uploadFileButtonPressed), for: .touchUpInside)
        
        uploadImageButton.setTitle("Upload Image...", for: .normal)
        uploadImageButton.addTarget(self, action: #selector(uploadImageButtonPressed), for: .touchUpInside)
        
        sendFileMessageButton.setTitle("Send File Message...", for: .normal)
        sendFileMessageButton.addTarget(self, action: #selector(sendFileMessageButtonnPressed), for: .touchUpInside)
        
        muteThreadButton.setTitle("Mute Thread...", for: .normal)
        muteThreadButton.addTarget(self, action: #selector(muteThreadButtonPressed), for: .touchUpInside)
        
        unmuteThreadButton.setTitle("Unmute Thread...", for: .normal)
        unmuteThreadButton.addTarget(self, action: #selector(unmuteThreadButtonPressed), for: .touchUpInside)
        
        updateThreadInfoButton.setTitle("Update Metadata...", for: .normal)
        updateThreadInfoButton.addTarget(self, action: #selector(updateThreadInfoButtonPressed), for: .touchUpInside)
        
        syncContactsButton.setTitle("Sync Contacts...", for: .normal)
        syncContactsButton.addTarget(self, action: #selector(syncContactsButtonPressed), for: .touchUpInside)
        
        searchThreadButton.setTitle("Search Thread...", for: .normal)
        searchThreadButton.addTarget(self, action: #selector(searchThreadButtonPressed), for: .touchUpInside)
        
        searchContactButton.setTitle("Search Contacr...", for: .normal)
        searchContactButton.addTarget(self, action: #selector(searchContactsButtonPressed), for: .touchUpInside)
        
        searchHistoryButton.setTitle("Search History...", for: .normal)
        searchHistoryButton.addTarget(self, action: #selector(searchHistoryButtonPressed), for: .touchUpInside)
        
        clearHistoryButton.setTitle("Clear History...", for: .normal)
        clearHistoryButton.addTarget(self, action: #selector(clearHistoryButtonPressed), for: .touchUpInside)
        
        blockButton.setTitle("Block...", for: .normal)
        blockButton.addTarget(self, action: #selector(blockContactButtonPressed), for: .touchUpInside)
        
        unblockButton.setTitle("Unblock...", for: .normal)
        unblockButton.addTarget(self, action: #selector(unblockContactButtonPressed), for: .touchUpInside)
        
        getBlockedButton.setTitle("Get Block List...", for: .normal)
        getBlockedButton.addTarget(self, action: #selector(getBlockedContactsButtonPressed), for: .touchUpInside)
        
        leaveThreadButton.setTitle("Leave Thread...", for: .normal)
        leaveThreadButton.addTarget(self, action: #selector(leaveThreadButtonPressed), for: .touchUpInside)
        
        spamThreadButton.setTitle("Spam Pv Thread...", for: .normal)
        spamThreadButton.addTarget(self, action: #selector(spamThreadButtonPressed), for: .touchUpInside)
        
        messageDeliverList.setTitle("Message Deliver List...", for: .normal)
        messageDeliverList.addTarget(self, action: #selector(messageDeliverListButtonPressed), for: .touchUpInside)
        
        messageSeenList.setTitle("Message Seen List...", for: .normal)
        messageSeenList.addTarget(self, action: #selector(messageSeenListButtonPressed), for: .touchUpInside)
        
        getImage.setTitle("Get Image...", for: .normal)
        getImage.addTarget(self, action: #selector(getImgeButtonPressed), for: .touchUpInside)
        
        getFile.setTitle("Get File...", for: .normal)
        getFile.addTarget(self, action: #selector(getFileButtonPressed), for: .touchUpInside)
        
        mapReverse.setTitle("Map Reverse...", for: .normal)
        mapReverse.addTarget(self, action: #selector(mapReverseButtonPressed), for: .touchUpInside)
        
        mapSearch.setTitle("Map Search...", for: .normal)
        mapSearch.addTarget(self, action: #selector(mapSearchButtonPressed), for: .touchUpInside)
        
        mapRouting.setTitle("Map Routing...", for: .normal)
        mapRouting.addTarget(self, action: #selector(mapRoutingButtonPressed), for: .touchUpInside)
        
        mapStaticImage.setTitle("Map Static Image...", for: .normal)
        mapStaticImage.addTarget(self, action: #selector(mapStaticImageButtonPressed), for: .touchUpInside)
        
        sendLocatinoMessage.setTitle("send location Message...", for: .normal)
        sendLocatinoMessage.addTarget(self, action: #selector(sendLocationMessageButtonPressed), for: .touchUpInside)
        
        sendBotMessage.setTitle("send Bot Message...", for: .normal)
        sendBotMessage.addTarget(self, action: #selector(sendBotMessageButtonPressed), for: .touchUpInside)
        
        setAuditor.setTitle("set Audito...", for: .normal)
        setAuditor.addTarget(self, action: #selector(SetAuditorButtonSelected), for: .touchUpInside)
        
        deleteCache.setTitle("delete Cache", for: .normal)
        deleteCache.addTarget(self, action: #selector(deleteCacheButtonPressed), for: .touchUpInside)
        
    }
    

    func setupLayouts() {
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
        view.addSubview(sendFileMessageButton)
        
        view.addSubview(muteThreadButton)
        view.addSubview(unmuteThreadButton)
        view.addSubview(updateThreadInfoButton)
        view.addSubview(syncContactsButton)
        
        view.addSubview(searchThreadButton)
        view.addSubview(searchContactButton)
        view.addSubview(searchHistoryButton)
        view.addSubview(clearHistoryButton)
        
        view.addSubview(blockButton)
        view.addSubview(unblockButton)
        view.addSubview(getBlockedButton)
        
        view.addSubview(leaveThreadButton)
        view.addSubview(spamThreadButton)
        
        view.addSubview(messageDeliverList)
        view.addSubview(messageSeenList)
        
        view.addSubview(getImage)
        view.addSubview(getFile)
        
        view.addSubview(mapReverse)
        view.addSubview(mapSearch)
        view.addSubview(mapRouting)
        view.addSubview(mapStaticImage)
        view.addSubview(sendLocatinoMessage)
        view.addSubview(sendBotMessage)
        view.addSubview(setAuditor)
        view.addSubview(deleteCache)
        
        view.addSubview(logView)
        logView.addSubview(myLogCollectionView)
        
        getUserInfoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        getUserInfoButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        getUserInfoButton.widthAnchor.constraint(equalToConstant: ((view.frame.width - 24) / 2)).isActive = true
        getUserInfoButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        getThreadsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        getThreadsButton.leftAnchor.constraint(equalTo: getUserInfoButton.rightAnchor, constant: 8).isActive = true
        getThreadsButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        getThreadsButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        getHistoryButton.topAnchor.constraint(equalTo: getUserInfoButton.bottomAnchor, constant: 4).isActive = true
        getHistoryButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        getHistoryButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        getHistoryButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        getThreadParticipantsButton.topAnchor.constraint(equalTo: getThreadsButton.bottomAnchor, constant: 4).isActive = true
        getThreadParticipantsButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getThreadParticipantsButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getThreadParticipantsButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        createThreadButton.topAnchor.constraint(equalTo: getHistoryButton.bottomAnchor, constant: 4).isActive = true
        createThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        createThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        createThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        getContactsButton.topAnchor.constraint(equalTo: getThreadParticipantsButton.bottomAnchor, constant: 4).isActive = true
        getContactsButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getContactsButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getContactsButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        inputTextFieldToSendMessage.topAnchor.constraint(equalTo: createThreadButton.bottomAnchor, constant: 4).isActive = true
        inputTextFieldToSendMessage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        inputTextFieldToSendMessage.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        inputTextFieldToSendMessage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        sendMessageToSocketButton.topAnchor.constraint(equalTo: inputTextFieldToSendMessage.bottomAnchor, constant: 4).isActive = true
        sendMessageToSocketButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        sendMessageToSocketButton.rightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        sendMessageToSocketButton.leftAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        sendMessageToSocketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addParticipantButton.topAnchor.constraint(equalTo: sendMessageToSocketButton.bottomAnchor, constant: 4).isActive = true
        addParticipantButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        addParticipantButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        addParticipantButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        removeParticipantButton.topAnchor.constraint(equalTo: sendMessageToSocketButton.bottomAnchor, constant: 4).isActive = true
        removeParticipantButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        removeParticipantButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        removeParticipantButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addContactButton.topAnchor.constraint(equalTo: addParticipantButton.bottomAnchor, constant: 4).isActive = true
        addContactButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        addContactButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        addContactButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        updateContactButton.topAnchor.constraint(equalTo: addContactButton.topAnchor).isActive = true
        updateContactButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        updateContactButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        updateContactButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        removeContactButton.topAnchor.constraint(equalTo: addContactButton.bottomAnchor, constant: 4).isActive = true
        removeContactButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        removeContactButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        removeContactButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        uploadFileButton.topAnchor.constraint(equalTo: removeContactButton.bottomAnchor, constant: 4).isActive = true
        uploadFileButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        uploadFileButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        uploadFileButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        uploadImageButton.topAnchor.constraint(equalTo: uploadFileButton.topAnchor).isActive = true
        uploadImageButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        uploadImageButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        uploadImageButton.bottomAnchor.constraint(equalTo: uploadFileButton.bottomAnchor).isActive = true
        
        sendFileMessageButton.topAnchor.constraint(equalTo: uploadFileButton.bottomAnchor, constant: 4).isActive = true
        sendFileMessageButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        sendFileMessageButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        sendFileMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        muteThreadButton.topAnchor.constraint(equalTo: sendFileMessageButton.bottomAnchor, constant: 4).isActive = true
        muteThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        muteThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        muteThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        unmuteThreadButton.topAnchor.constraint(equalTo: muteThreadButton.topAnchor).isActive = true
        unmuteThreadButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        unmuteThreadButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        unmuteThreadButton.bottomAnchor.constraint(equalTo: muteThreadButton.bottomAnchor).isActive = true
        
        updateThreadInfoButton.topAnchor.constraint(equalTo: muteThreadButton.bottomAnchor, constant: 4).isActive = true
        updateThreadInfoButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        updateThreadInfoButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        updateThreadInfoButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        syncContactsButton.topAnchor.constraint(equalTo: updateThreadInfoButton.topAnchor).isActive = true
        syncContactsButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        syncContactsButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        syncContactsButton.bottomAnchor.constraint(equalTo: updateThreadInfoButton.bottomAnchor).isActive = true
        
        searchThreadButton.topAnchor.constraint(equalTo: updateThreadInfoButton.bottomAnchor, constant: 4).isActive = true
        searchThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        searchThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        searchThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        searchContactButton.topAnchor.constraint(equalTo: searchThreadButton.topAnchor).isActive = true
        searchContactButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        searchContactButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        searchContactButton.bottomAnchor.constraint(equalTo: searchThreadButton.bottomAnchor).isActive = true
        
        searchHistoryButton.topAnchor.constraint(equalTo: searchThreadButton.bottomAnchor, constant: 4).isActive = true
        searchHistoryButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        searchHistoryButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        searchHistoryButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        clearHistoryButton.topAnchor.constraint(equalTo: searchHistoryButton.topAnchor).isActive = true
        clearHistoryButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        clearHistoryButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        clearHistoryButton.bottomAnchor.constraint(equalTo: searchHistoryButton.bottomAnchor).isActive = true
        
        blockButton.topAnchor.constraint(equalTo: searchHistoryButton.bottomAnchor, constant: 4).isActive = true
        blockButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        blockButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        blockButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        unblockButton.topAnchor.constraint(equalTo: blockButton.topAnchor).isActive = true
        unblockButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        unblockButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        unblockButton.bottomAnchor.constraint(equalTo: blockButton.bottomAnchor).isActive = true
        
        getBlockedButton.topAnchor.constraint(equalTo: blockButton.bottomAnchor, constant: 4).isActive = true
        getBlockedButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        getBlockedButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        getBlockedButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        leaveThreadButton.topAnchor.constraint(equalTo: getBlockedButton.bottomAnchor, constant: 4).isActive = true
        leaveThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        leaveThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        leaveThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        spamThreadButton.topAnchor.constraint(equalTo: leaveThreadButton.topAnchor).isActive = true
        spamThreadButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        spamThreadButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        spamThreadButton.bottomAnchor.constraint(equalTo: leaveThreadButton.bottomAnchor).isActive = true
        
        messageDeliverList.topAnchor.constraint(equalTo: getBlockedButton.bottomAnchor, constant: 4).isActive = true
        messageDeliverList.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        messageDeliverList.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        messageDeliverList.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        messageSeenList.topAnchor.constraint(equalTo: messageDeliverList.topAnchor).isActive = true
        messageSeenList.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        messageSeenList.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        messageSeenList.bottomAnchor.constraint(equalTo: messageDeliverList.bottomAnchor).isActive = true
        
        getImage.topAnchor.constraint(equalTo: messageDeliverList.bottomAnchor, constant: 4).isActive = true
        getImage.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        getImage.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        getImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        getFile.topAnchor.constraint(equalTo: getImage.topAnchor).isActive = true
        getFile.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getFile.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getFile.bottomAnchor.constraint(equalTo: getImage.bottomAnchor).isActive = true
        
        mapReverse.topAnchor.constraint(equalTo: getImage.bottomAnchor, constant: 4).isActive = true
        mapReverse.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        mapReverse.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        mapReverse.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        mapSearch.topAnchor.constraint(equalTo: mapReverse.topAnchor).isActive = true
        mapSearch.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        mapSearch.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        mapSearch.bottomAnchor.constraint(equalTo: mapReverse.bottomAnchor).isActive = true
        
        mapRouting.topAnchor.constraint(equalTo: mapReverse.bottomAnchor, constant: 4).isActive = true
        mapRouting.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        mapRouting.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        mapRouting.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        mapStaticImage.topAnchor.constraint(equalTo: mapRouting.topAnchor).isActive = true
        mapStaticImage.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        mapStaticImage.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        mapStaticImage.bottomAnchor.constraint(equalTo: mapRouting.bottomAnchor).isActive = true
        
        sendLocatinoMessage.topAnchor.constraint(equalTo: mapRouting.bottomAnchor, constant: 4).isActive = true
        sendLocatinoMessage.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        sendLocatinoMessage.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        sendLocatinoMessage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        sendBotMessage.topAnchor.constraint(equalTo: sendLocatinoMessage.topAnchor).isActive = true
        sendBotMessage.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        sendBotMessage.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        sendBotMessage.bottomAnchor.constraint(equalTo: sendLocatinoMessage.bottomAnchor).isActive = true
        
        setAuditor.topAnchor.constraint(equalTo: sendLocatinoMessage.bottomAnchor, constant: 4).isActive = true
        setAuditor.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        setAuditor.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        setAuditor.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        deleteCache.topAnchor.constraint(equalTo: setAuditor.topAnchor).isActive = true
        deleteCache.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        deleteCache.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        deleteCache.bottomAnchor.constraint(equalTo: setAuditor.bottomAnchor).isActive = true
        
        
        logView.topAnchor.constraint(equalTo: setAuditor.bottomAnchor, constant: 8).isActive = true
        logView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        logView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        logView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        myLogCollectionView.topAnchor.constraint(equalTo: logView.topAnchor, constant: 8).isActive = true
        myLogCollectionView.leftAnchor.constraint(equalTo: logView.leftAnchor, constant: 8).isActive = true
        myLogCollectionView.rightAnchor.constraint(equalTo: logView.rightAnchor, constant: -8).isActive = true
        myLogCollectionView.bottomAnchor.constraint(equalTo: logView.bottomAnchor, constant: -8).isActive = true
        
    }
    
    
}

