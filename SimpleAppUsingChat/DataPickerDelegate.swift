//
//  DataPickerDelegate.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 10/11/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import UIKit
import FanapPodChatSDK
import SwiftyJSON

extension MyViewController: UIPickerViewDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImage: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
        
        if let data = UIImageJPEGRepresentation(selectedImage!, 100) {
//            let inputModel = UploadImageRequestModel(dataToSend:        data,
//                                                     fileExtension:     nil,
//                                                     fileName:          "newPicture",
//                                                     originalFileName:  nil,
//                                                     threadId:          nil,
//                                                     xC:                nil,
//                                                     yC:                nil,
//                                                     hC:                nil,
//                                                     wC:                nil,
//                                                     typeCode:          nil,
//                                                     uniqueId:          nil)
            
            let inputModel = UploadImageRequestModel(dataToSend:        data,
                                                     fileExtension:     nil,
                                                     fileName:          "newPicture",
                                                     originalFileName:  nil,
                                                     threadId:          3284,
                                                     xC:                nil,
                                                     yC:                nil,
                                                     hC:                nil,
                                                     wC:                nil,
                                                     typeCode:          nil,
                                                     uniqueId:          nil)
            let message = SendTextMessageRequestModel(content:          "",
                                                      metadata:         nil,
                                                      repliedTo:        nil,
                                                      systemMetadata:   nil,
                                                      threadId:         3284,
                                                      typeCode:         nil,
                                                      uniqueId:         nil)
            let fileMessage = SendFileMessageRequestModel(messageInput: message,
                                                          uploadInput:  inputModel)
            
            Chat.sharedInstance.sendFileMessage(inputModel: fileMessage, uploadUniqueId: { (uploadImageUniqueId) in
                print("********************************")
                print("Upload ImageUniqueId is = \(uploadImageUniqueId)")
                print("********************************")
            }, uploadProgress: { (progress) in
                print("Upload File progress is = \(progress)")
            }, messageUniqueId: { (messageUniqueId) in
                print("********************************")
                print("file sendMessageUniqueId is = \(messageUniqueId)")
                print("********************************")
            }, onSent: { (sent) in
                print("********************************")
                print("file message is Sent = \(sent)")
                print("********************************")
            }, onDelivered: { (delivered) in
                print("********************************")
                print("file message is Delivered = \(delivered)")
                print("********************************")
            }) { (seen) in
                print("********************************")
                print("file message is Seen = \(seen)")
                print("********************************")
            }
            
            
//            Chat.sharedInstance.uploadImage(inputModel: inputModel, uniqueId: { (uploadFileUniqueId) in
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
