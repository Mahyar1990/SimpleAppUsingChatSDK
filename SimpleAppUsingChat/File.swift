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
        
        let inputModel = GetImageRequest(imageId:           67976,
                                         hashCode:          "SUDJUDMVTOVBIW6T",
                                         quality:           nil,
                                         crop:              nil,
                                         size:              nil,
                                         serverResponse:    nil)
        Chat.sharedInstance.getImage(inputModel: inputModel, getCacheResponse: nil, uniqueId: { (getImageUniqueId) in
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
        
        
//        let input = UploadImageRequest(dataToSend: <#T##Data#>, fileExtension: <#T##String?#>, fileName: <#T##String?#>, mimeType: <#T##String?#>, originalFileName: <#T##String?#>, threadId: <#T##Int?#>, xC: <#T##Int?#>, yC: <#T##Int?#>, hC: <#T##Int?#>, wC: <#T##Int?#>, typeCode: <#T##String?#>, uniqueId: <#T##String?#>)
//        Chat.sharedInstance.uploadImage(inputModel: input, uniqueId: { (uploadImageUniqueId) in
//            print("upload Image UniqueId = \(uploadImageUniqueId)")
//        }, progress: { (uploadProcess) in
//            print("uploadProcess = \(uploadProcess)")
//        }) { (myResponse) in
//            let response = myResponse as! UploadImageResponse
//            print("This is my UploadImage Response: \n\(response.returnDataAsJSON())")
//        }
        
    }
    
    @objc func getFileButtonPressed() {
        
        let inputModel = GetFileRequest(fileId:         52171,
                                        hashCode:       "SUDJUDMVTOVBIW6T",
                                        serverResponse: nil)
        Chat.sharedInstance.getFile(inputModel: inputModel, getCacheResponse: nil, uniqueId: { (getFileUniqueId) in
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
    
    
    @objc func uploadFileButtonPressed() {
        
        let image = UIImage(named: "pic")
        if let data = UIImageJPEGRepresentation(image!, 1) {
            let inptutModel = UploadFileRequest(dataToSend:     data,
                                                fileExtension:  nil,
                                                fileName:       nil,
                                                isPublic:       true,
                                                mimeType:       "",
                                                typeCode:       nil,
                                                uniqueId:       nil)
            
//            let inptutModel = UploadFileRequest(dataToSend:     data,
//                                                fileExtension:  nil,
//                                                fileName:       nil,
//                                                mimeType:       "",
//                                                userGroupHash:  "TXZLOYMAFZCCVS",
//                                                typeCode:       nil,
//                                                uniqueId:       nil)
            
            Chat.sharedInstance.uploadFile(inputModel: inptutModel, uniqueId: { (uploadFileUniqueId) in
                print("Upload File UniqueId = \(uploadFileUniqueId)")
            }, progress: { (myUploadProgress) in
                print("uploadProcess = \(myUploadProgress)")
            }) { (response) in
                let rsponseJSON = (response as! UploadFileResponse).returnDataAsJSON()
                print("This is my Upload File Response: \n\(rsponseJSON)")
            }
        }
        
    }
    
    
    @objc func uploadImageButtonPressed() {
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    
}


