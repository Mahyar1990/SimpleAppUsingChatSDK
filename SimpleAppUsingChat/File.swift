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
    
    
    
}


