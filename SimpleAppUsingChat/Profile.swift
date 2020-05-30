//
//  Profile.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 11/20/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import FanapPodChatSDK
import SwiftyJSON


// implement button pressed actions
extension MyViewController {
    
    
    @objc func getUserInfoButtonPressed() {
//        let x = Chat.sharedInstance.isConnectedToInternet() as! String
        
//        Chat.sharedInstance.getUserInfo(getCacheResponse: nil, uniqueId: { (getUserInfoUniqueId) in
//            print("\n get user info request uniqueId = \t \(getUserInfoUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("\n this is my get user info response from Server:")
//            let myResponseModel: UserInfoModel = myResponse as! UserInfoModel
//            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
//            print("\(myResponseJSON) \n")
//        }, cacheResponse: { (userInfoResponse) in
//            print("\n this is my get user info response from Cache:")
//            let responseJSON = userInfoResponse.returnDataAsJSON()
//            print("\(responseJSON)")
//        })
        
        
        let x = 1
        let ss = x as! MyViewController
        
    }
    
    @objc func setProfileButtonPressed() {
        let bio = "iOS Developer"
        let meta: JSON = ["age": 29, "height": 173]
        let inputModel = SetProfileRequestModel(bio:        bio,
                                                metadata:   meta.toString(),
                                                typeCode:   nil,
                                                uniqueId:   nil)
        Chat.sharedInstance.setProfile(inputModel: inputModel, uniqueId: { (setProfileUniqueId) in
            print("\n set profile request uniqueId = \t \(setProfileUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my set profile response from Server:")
            let responseModel: ProfileModel = myResponse as! ProfileModel
            print("\(responseModel.returnDataAsJSON()) \n")
        })
    }
    
    
}
