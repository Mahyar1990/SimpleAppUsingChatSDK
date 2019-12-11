//
//  MapActions.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 9/19/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import Foundation
import FanapPodChatSDK

extension MyViewController {
    
    @objc func mapReverseButtonPressed() {
        let inputModel = MapReverseRequestModel(lat: 36.310886959563085, lng: 59.53563741408013)
        Chat.sharedInstance.mapReverse(mapReverseInput: inputModel, uniqueId: { (mapReverseUniqueId) in
            print("Map Reverse UniqueId request = \(mapReverseUniqueId)")
        }, completion: { (theResponse) in
            let res = theResponse as! MapReverseModel
            print("Map Reverse Response: \n\(res.returnDataAsJSON())")
        })
    }
    
    @objc func mapSearchButtonPressed() {
        let inputModel = MapSearchRequestModel(lat: 36.310886959563085, lng: 59.53563741408013, term: "س")
        Chat.sharedInstance.mapSearch(mapSearchInput: inputModel, uniqueId: { (mapSearchUniqueId) in
            print("Map Search UniqueId request = \(mapSearchUniqueId)")
        }, completion: { (theResponse) in
            let res = theResponse as! MapSearchModel
            print("Map Reverse Response: \n\(res.returnDataAsJSON())")
        })
    }
    
    @objc func mapRoutingButtonPressed() {
        let inputModel = MapRoutingRequestModel(alternative: true, destinationLat: 36.310886959563085, destinationLng: 59.53563741408013, originLat: 36.28984398444424, originLng: 59.59045107288)
        Chat.sharedInstance.mapRouting(mapRoutingInput: inputModel, uniqueId: { (mapRoutingUniqueId) in
            print("Map Routing UniqueId request = \(mapRoutingUniqueId)")
        }, completion: { (theResponse) in
            let res = theResponse as! MapRoutingModel
            print("Map Reverse Response: \n\(res.returnDataAsJSON())")
        })
    }
    
    @objc func mapStaticImageButtonPressed() {
        let inputModel = MapStaticImageRequestModel(centerLat: 36.310886959563085, centerLng: 59.53563741408013, height: 500, type: "standard-night", width: 800, zoom: 15)
        Chat.sharedInstance.mapStaticImage(mapStaticImageInput: inputModel, uniqueId: { (mapStaticImageUniqueId) in
            print("Map Static Image UniqueId request = \(mapStaticImageUniqueId)")
        }, progress: { (myProgress) in
            print("progress downloaded: \(myProgress)")
        }, completion: { (theResponse) in
            print("Image Downloaded Successfully")
        })
    }
    
    
}
