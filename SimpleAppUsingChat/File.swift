//
//  FileActions.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 9/19/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import Foundation
import FanapPodChatSDK
import SwiftyJSON
import UIKit

extension MyViewController {
    
    @objc func getImgeButtonPressed() {
        
        let inputModel = GetImageRequestModel(actual: nil, downloadable: nil, height: nil, hashCode: "16f621fa6ce-0.6413126404223938", imageId: 67976, width: nil, serverResponse: nil)

        Chat.sharedInstance.getImage(inputModel: inputModel, uniqueId: { (getImageUniqueId) in
            print("getImage UniqueId = \(getImageUniqueId)")
        }, progress: { (myDownloadProgress) in
            print("downloadProcess = \(myDownloadProgress)")
        }, completion: { (data, responseModel) in
            print("This is my GetImage Response from Server")
            let rsponseJSON = responseModel.returnDataAsJSON()
            print("\(rsponseJSON)")
//        }, cacheResponse: { (filePath, cacheResponse) in
        }, cacheResponse: { (fileData, cacheResponse) in
            print("This is my GetImage Response from Cache")
            let rsponseJSON = cacheResponse.returnDataAsJSON()
            print("response = \(rsponseJSON)")
//            print("filePath = \(filePath)")
        })
        
    }
    
    @objc func getFileButtonPressed() {
        
        let inputModel = GetFileRequestModel(downloadable: true, fileId: 52171, hashCode: "168232d744d-0.9990232707506134", serverResponse: nil)
        Chat.sharedInstance.getFile(inputModel: inputModel, uniqueId: { (getFileUniqueId) in
            print("getFile UniqueId = \(getFileUniqueId)")
        }, progress: { (myDownloadProgress) in
            print("downloadProcess = \(myDownloadProgress)")
        }, completion: { (data, response) in
            print("This is my GetFile Response from Server")
            let rsponseJSON = response.returnDataAsJSON()
            print("\(rsponseJSON)")
//        }, cacheResponse: { (cacheResponse, filePath) in
        }, cacheResponse: { (fileData, cacheResponse) in
            print("This is my GetFile Response from Cache")
            let rsponseJSON = cacheResponse.returnDataAsJSON()
            print("response = \(rsponseJSON)")
//            print("filePath = \(filePath)")
        })
        
    }
    
    @objc func sendUploadFileMessageButtonPressed() {
        let image = UIImage(named: "pic")
        if let data = UIImageJPEGRepresentation(image!, 1) {
            let inputModel = UploadFileRequestModel(dataToSend: data,
                                                    fileExtension: nil,
                                                    fileName: "newPic",
                                                    originalFileName: nil,
                                                    threadId: 3284,
                                                    typeCode: nil,
                                                    uniqueId: nil)
            let message = SendTextMessageRequestModel(content: "",
                                                      metadata: nil,
                                                      repliedTo: nil,
                                                      systemMetadata: nil,
                                                      threadId: 3284,
                                                      typeCode: nil,
                                                      uniqueId: nil)
            let fileMessage = SendFileMessageRequestModel(messageInput: message,
                                                          uploadInput:  inputModel)
            
            Chat.sharedInstance.sendFileMessage(inputModel: fileMessage, uploadUniqueId: { (uploadImageUniqueId) in
                print("********************************")
                print("Upload File UniqueId is = \(uploadImageUniqueId)")
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
            
//            Chat.sharedInstance.uploadFile(inputModel: inputModel, uniqueId: { (uploadFileUniqueId) in
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
            
        }
    }
    
    @objc func uploadImageButtonPressed() {
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
}


