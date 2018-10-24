//
//  File.swift
//  SimpleAppUsingChat
//
//  Created by Mahyar Zhiani on 7/28/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import UIKit
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
        inputTextFieldToSendMessage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        sendMessageToSocketButton.topAnchor.constraint(equalTo: inputTextFieldToSendMessage.bottomAnchor, constant: 4).isActive = true
        sendMessageToSocketButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        sendMessageToSocketButton.rightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        sendMessageToSocketButton.leftAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        sendMessageToSocketButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addParticipantButton.topAnchor.constraint(equalTo: sendMessageToSocketButton.bottomAnchor, constant: 8).isActive = true
        addParticipantButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        addParticipantButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        addParticipantButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        removeParticipantButton.topAnchor.constraint(equalTo: sendMessageToSocketButton.bottomAnchor, constant: 8).isActive = true
        removeParticipantButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        removeParticipantButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        removeParticipantButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addContactButton.topAnchor.constraint(equalTo: addParticipantButton.bottomAnchor, constant: 8).isActive = true
        addContactButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        addContactButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        addContactButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        updateContactButton.topAnchor.constraint(equalTo: addContactButton.topAnchor).isActive = true
        updateContactButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        updateContactButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        updateContactButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        removeContactButton.topAnchor.constraint(equalTo: addContactButton.bottomAnchor, constant: 8).isActive = true
        removeContactButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        removeContactButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        removeContactButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        uploadFileButton.topAnchor.constraint(equalTo: removeContactButton.bottomAnchor, constant: 8).isActive = true
        uploadFileButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        uploadFileButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        uploadFileButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        uploadImageButton.topAnchor.constraint(equalTo: uploadFileButton.topAnchor).isActive = true
        uploadImageButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        uploadImageButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        uploadImageButton.bottomAnchor.constraint(equalTo: uploadFileButton.bottomAnchor).isActive = true
        
        sendFileMessageButton.topAnchor.constraint(equalTo: uploadFileButton.bottomAnchor, constant: 8).isActive = true
        sendFileMessageButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        sendFileMessageButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        sendFileMessageButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        muteThreadButton.topAnchor.constraint(equalTo: sendFileMessageButton.bottomAnchor, constant: 8).isActive = true
        muteThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        muteThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        muteThreadButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        unmuteThreadButton.topAnchor.constraint(equalTo: muteThreadButton.topAnchor).isActive = true
        unmuteThreadButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        unmuteThreadButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        unmuteThreadButton.bottomAnchor.constraint(equalTo: muteThreadButton.bottomAnchor).isActive = true
        
        updateThreadInfoButton.topAnchor.constraint(equalTo: muteThreadButton.bottomAnchor, constant: 8).isActive = true
        updateThreadInfoButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        updateThreadInfoButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        updateThreadInfoButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        syncContactsButton.topAnchor.constraint(equalTo: updateThreadInfoButton.topAnchor).isActive = true
        syncContactsButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        syncContactsButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        syncContactsButton.bottomAnchor.constraint(equalTo: updateThreadInfoButton.bottomAnchor).isActive = true
        
        searchThreadButton.topAnchor.constraint(equalTo: updateThreadInfoButton.bottomAnchor, constant: 8).isActive = true
        searchThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        searchThreadButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        searchThreadButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        searchContactButton.topAnchor.constraint(equalTo: searchThreadButton.topAnchor).isActive = true
        searchContactButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        searchContactButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        searchContactButton.bottomAnchor.constraint(equalTo: searchThreadButton.bottomAnchor).isActive = true
        
        searchHistoryButton.topAnchor.constraint(equalTo: searchThreadButton.bottomAnchor, constant: 8).isActive = true
        searchHistoryButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        searchHistoryButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        searchHistoryButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        logView.topAnchor.constraint(equalTo: searchHistoryButton.bottomAnchor, constant: 8).isActive = true
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
            
            let myParams: JSON = ["fileName": "newPicture"]
            
            myChatObject?.uploadImage(params: myParams, dataToSend: data, uniqueId: { (uploadFileUniqueId) in
                print("********************************")
                print("UploadImageUniqueId is = \(uploadFileUniqueId)")
                print("********************************")
            }, progress: { (progress) in
                print("Upload Image Progress = \(progress)")
            }, completion: { (response) in
                print("********************************")
                print("Response from Upload Image:")
                print("\(response)")
                print("********************************")
            })
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}

