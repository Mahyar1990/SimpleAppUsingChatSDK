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
        
        let inputModel = GetImageRequestModel(actual: nil, downloadable: nil, height: nil, hashCode: "16803a16292-0.15831373791354997", imageId: 52004, width: nil)

        Chat.sharedInstance.getImage(getImageInput: inputModel, uniqueId: { (getImageUniqueId) in
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
        Chat.sharedInstance.getFile(getFileInput: inputModel, uniqueId: { (getFileUniqueId) in
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
    
    @objc func uploadFileButtonPressed() {
        let image = UIImage(named: "pic")
        if let data = UIImageJPEGRepresentation(image!, 1) {
            let inputModel = UploadFileRequestModel(dataToSend: data,
                                                    fileExtension: nil,
                                                    fileName: "newPic",
                                                    fileSize: nil,
                                                    originalFileName: nil,
                                                    threadId: nil,
                                                    typeCode: nil,
                                                    uniqueId: nil)
            Chat.sharedInstance.uploadFile(uploadFileInput: inputModel, uniqueId: { (uploadFileUniqueId) in
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
//            Chat.sharedInstance.uploadImage(uploadImageInput: inputModel, uniqueId: { (UploadImageUniqueId) in
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
    
}


