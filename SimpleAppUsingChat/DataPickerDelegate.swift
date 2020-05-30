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
            
//            let inputModel = UploadImageRequest(dataToSend:     data,
//                                                fileExtension:  "png",
//                                                fileName:       "newPicture",
//                                                mimeType:       nil,
//                                                xC:             nil,
//                                                yC:             nil,
//                                                hC:             nil,
//                                                wC:             nil,
//                                                userGroupHash:  "",
//                                                typeCode:       nil,
//                                                uniqueId:       "qqqqqqqqqqqqqqqqqqqqqqqqqqqq")
//            let message = SendTextMessageRequestModel(content:          "message",
//                                                      messageType:      MessageType.TEXT,
//                                                      metadata:         nil,
//                                                      repliedTo:        nil,
//                                                      systemMetadata:   nil,
//                                                      threadId:         25301,
//                                                      typeCode:         nil,
//                                                      uniqueId:         "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm")
//            let fileMessage = SendFileMessageRequestModel(messageInput: message,
//                                                          uploadInput:  inputModel)
//            Chat.sharedInstance.sendFileMessage(inputModel: fileMessage, uploadUniqueId: { (uploadImageUniqueId) in
//                print("********************************")
//                print("Upload ImageUniqueId is = \(uploadImageUniqueId)")
//                print("********************************")
//            }, uploadProgress: { (progress) in
//                print("Upload File progress is = \(progress)")
//            }, messageUniqueId: { (messageUniqueId) in
//                print("********************************")
//                print("file sendMessageUniqueId is = \(messageUniqueId)")
//                print("********************************")
//            }, onSent: { (sent) in
//                print("********************************")
//                print("file message is Sent = \(sent)")
//                print("********************************")
//            }, onDelivered: { (delivered) in
//                print("********************************")
//                print("file message is Delivered = \(delivered)")
//                print("********************************")
//            }) { (seen) in
//                print("********************************")
//                print("file message is Seen = \(seen)")
//                print("********************************")
//            }
            
            
            let inptutModel = UploadImageRequest(dataToSend:    data,
                                                 fileExtension: nil,
                                                 fileName:      nil,
                                                 isPublic:      true,
                                                 mimeType:      "",
                                                 xC:            0,
                                                 yC:            0,
                                                 hC:            99999,
                                                 wC:            99999,
                                                 typeCode:      nil,
                                                 uniqueId:      nil)
//            let inptutModel = UploadImageRequest(dataToSend:    data,
//                                                 fileExtension: nil,
//                                                 fileName:      nil,
//                                                 mimeType:      "",
//                                                 xC:            0,
//                                                 yC:            0,
//                                                 hC:            99999,
//                                                 wC:            99999,
//                                                 userGroupHash: "TXZLOYMAFZCCVS",
//                                                 typeCode:      nil,
//                                                 uniqueId:      nil)
            
            Chat.sharedInstance.uploadImage(inputModel: inptutModel, uniqueId: { (uploadImageUniqueId) in
                print("Upload Image UniqueId = \(uploadImageUniqueId)")
            }, progress: { (myUploadProgress) in
                print("uploadProcess = \(myUploadProgress)")
            }) { (response) in
                let rsponseJSON = (response as! UploadImageResponse).returnDataAsJSON()
                print("This is my Upload Image Response: \n\(rsponseJSON)")
            }
            
            
        }
        
    }
    
    
}
