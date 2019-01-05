//
//  File.swift
//  SimpleAppUsingChat
//
//  Created by Mahyar Zhiani on 7/28/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import UIKit
import Chat
import SwiftyJSON


extension MyViewController {
    
    
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
        view.addSubview(sendFileMessageButton)
        
        view.addSubview(muteThreadButton)
        view.addSubview(unmuteThreadButton)
        view.addSubview(updateThreadInfoButton)
        view.addSubview(syncContactsButton)
        
        view.addSubview(searchThreadButton)
        view.addSubview(searchContactButton)
        view.addSubview(searchHistoryButton)
        
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
        
        inputTextFieldToSendMessage.topAnchor.constraint(equalTo: createThreadButton.bottomAnchor, constant: 8).isActive = true
        inputTextFieldToSendMessage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        inputTextFieldToSendMessage.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        inputTextFieldToSendMessage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        sendMessageToSocketButton.topAnchor.constraint(equalTo: inputTextFieldToSendMessage.bottomAnchor, constant: 4).isActive = true
        sendMessageToSocketButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        sendMessageToSocketButton.rightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        sendMessageToSocketButton.leftAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        sendMessageToSocketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addParticipantButton.topAnchor.constraint(equalTo: sendMessageToSocketButton.bottomAnchor, constant: 8).isActive = true
        addParticipantButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        addParticipantButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        addParticipantButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        removeParticipantButton.topAnchor.constraint(equalTo: sendMessageToSocketButton.bottomAnchor, constant: 8).isActive = true
        removeParticipantButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        removeParticipantButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        removeParticipantButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addContactButton.topAnchor.constraint(equalTo: addParticipantButton.bottomAnchor, constant: 8).isActive = true
        addContactButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        addContactButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        addContactButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        updateContactButton.topAnchor.constraint(equalTo: addContactButton.topAnchor).isActive = true
        updateContactButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        updateContactButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        updateContactButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        removeContactButton.topAnchor.constraint(equalTo: addContactButton.bottomAnchor, constant: 8).isActive = true
        removeContactButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        removeContactButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        removeContactButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        uploadFileButton.topAnchor.constraint(equalTo: removeContactButton.bottomAnchor, constant: 8).isActive = true
        uploadFileButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        uploadFileButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        uploadFileButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        uploadImageButton.topAnchor.constraint(equalTo: uploadFileButton.topAnchor).isActive = true
        uploadImageButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        uploadImageButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        uploadImageButton.bottomAnchor.constraint(equalTo: uploadFileButton.bottomAnchor).isActive = true
        
        sendFileMessageButton.topAnchor.constraint(equalTo: uploadFileButton.bottomAnchor, constant: 8).isActive = true
        sendFileMessageButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        sendFileMessageButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        sendFileMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        muteThreadButton.topAnchor.constraint(equalTo: sendFileMessageButton.bottomAnchor, constant: 8).isActive = true
        muteThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        muteThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        muteThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        unmuteThreadButton.topAnchor.constraint(equalTo: muteThreadButton.topAnchor).isActive = true
        unmuteThreadButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        unmuteThreadButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        unmuteThreadButton.bottomAnchor.constraint(equalTo: muteThreadButton.bottomAnchor).isActive = true
        
        updateThreadInfoButton.topAnchor.constraint(equalTo: muteThreadButton.bottomAnchor, constant: 8).isActive = true
        updateThreadInfoButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        updateThreadInfoButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        updateThreadInfoButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        syncContactsButton.topAnchor.constraint(equalTo: updateThreadInfoButton.topAnchor).isActive = true
        syncContactsButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        syncContactsButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        syncContactsButton.bottomAnchor.constraint(equalTo: updateThreadInfoButton.bottomAnchor).isActive = true
        
        searchThreadButton.topAnchor.constraint(equalTo: updateThreadInfoButton.bottomAnchor, constant: 8).isActive = true
        searchThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        searchThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        searchThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        searchContactButton.topAnchor.constraint(equalTo: searchThreadButton.topAnchor).isActive = true
        searchContactButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        searchContactButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        searchContactButton.bottomAnchor.constraint(equalTo: searchThreadButton.bottomAnchor).isActive = true
        
        searchHistoryButton.topAnchor.constraint(equalTo: searchThreadButton.bottomAnchor, constant: 8).isActive = true
        searchHistoryButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        searchHistoryButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        searchHistoryButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blockButton.topAnchor.constraint(equalTo: searchHistoryButton.bottomAnchor, constant: 8).isActive = true
        blockButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        blockButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        blockButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        unblockButton.topAnchor.constraint(equalTo: blockButton.topAnchor).isActive = true
        unblockButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        unblockButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        unblockButton.bottomAnchor.constraint(equalTo: blockButton.bottomAnchor).isActive = true
        
        getBlockedButton.topAnchor.constraint(equalTo: blockButton.bottomAnchor, constant: 8).isActive = true
        getBlockedButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        getBlockedButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        getBlockedButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        leaveThreadButton.topAnchor.constraint(equalTo: getBlockedButton.bottomAnchor, constant: 8).isActive = true
        leaveThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        leaveThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        leaveThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        spamThreadButton.topAnchor.constraint(equalTo: leaveThreadButton.topAnchor).isActive = true
        spamThreadButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        spamThreadButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        spamThreadButton.bottomAnchor.constraint(equalTo: leaveThreadButton.bottomAnchor).isActive = true
        
        messageDeliverList.topAnchor.constraint(equalTo: getBlockedButton.bottomAnchor, constant: 8).isActive = true
        messageDeliverList.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        messageDeliverList.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        messageDeliverList.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        messageSeenList.topAnchor.constraint(equalTo: messageDeliverList.topAnchor).isActive = true
        messageSeenList.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        messageSeenList.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        messageSeenList.bottomAnchor.constraint(equalTo: messageDeliverList.bottomAnchor).isActive = true
        
        getImage.topAnchor.constraint(equalTo: messageDeliverList.bottomAnchor, constant: 8).isActive = true
        getImage.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        getImage.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        getImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        getFile.topAnchor.constraint(equalTo: getImage.topAnchor).isActive = true
        getFile.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getFile.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getFile.bottomAnchor.constraint(equalTo: getImage.bottomAnchor).isActive = true
        
        mapReverse.topAnchor.constraint(equalTo: getImage.bottomAnchor).isActive = true
        mapReverse.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        mapReverse.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        mapReverse.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        mapSearch.topAnchor.constraint(equalTo: mapReverse.topAnchor).isActive = true
        mapSearch.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        mapSearch.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        mapSearch.bottomAnchor.constraint(equalTo: mapReverse.bottomAnchor).isActive = true
        
        mapRouting.topAnchor.constraint(equalTo: mapReverse.bottomAnchor).isActive = true
        mapRouting.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        mapRouting.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        mapRouting.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        mapStaticImage.topAnchor.constraint(equalTo: mapRouting.topAnchor).isActive = true
        mapStaticImage.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        mapStaticImage.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        mapStaticImage.bottomAnchor.constraint(equalTo: mapRouting.bottomAnchor).isActive = true
        
        logView.topAnchor.constraint(equalTo: mapRouting.bottomAnchor, constant: 8).isActive = true
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
    
    
    
    
    
    
    
    
    
    
}

