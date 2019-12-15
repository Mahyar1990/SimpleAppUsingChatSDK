//
//  ManageCache.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 9/23/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import Foundation
import FanapPodChatSDK


extension MyViewController {
    
    @objc func deleteCacheButtonPressed() {
        Chat.sharedInstance.deleteCache()
    }
    
}




