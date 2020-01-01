//
//  ContactActions.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 9/19/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import FanapPodChatSDK
import SwiftyJSON
//import UIKit

extension MyViewController {
    
    @objc func getContactsButtonPressed() {
        
        let inputModel = GetContactsRequestModel(count: 50, offset: 0, query: nil, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.getContacts(inputModel: inputModel, uniqueId: { (getContactUniqueId) in
            print("\n get contact request uniqueId = \t \(getContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetContactsModel = myResponse as! GetContactsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get contacts response from Server:")
            print("\(myResponseJSON) \n")
        }, cacheResponse: { (contactResponse) in
            print("\n this is my get contact response from Cache:")
            let responseJSON = contactResponse.returnDataAsJSON()
            print("\(responseJSON)")
        })
        
    }
    
    @objc func addContactButtonPressed() {
        
        let inputModel = AddContactRequestModel(cellphoneNumber: "09354045350",
                                                email: nil,
                                                firstName: "Sina",
                                                lastName: "Javaheri",
                                                typeCode: nil,
                                                uniqueId: nil)
        Chat.sharedInstance.addContact(inputModel: inputModel, uniqueId: { (addContactUniqueId) in
            print("\n add Contact request uniqueId = \t \(addContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my add contacts response:")
            print("\(myResponseJSON)")
        })
    }
    
    @objc func updateContactButtonPressed() {
        
        let inputModel = UpdateContactsRequestModel(cellphoneNumber: "09368640180",
                                                    email: "Mehdi.Akbarian@fanap.ir",
                                                    firstName: "Mehdiiiiii",
                                                    id: 2225,
                                                    lastName: "Akbarian",
                                                    typeCode: nil,
                                                    uniqueId: nil)
        Chat.sharedInstance.updateContact(inputModel: inputModel, uniqueId: { (updateContactUniqueId) in
            print("\n update Contact request uniqueId = \t \(updateContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my update contacts response:")
            print("\(myResponseJSON)")
        })
        
    }
    
    @objc func removeContactButtonPressed() {
        
        let inputModel = RemoveContactsRequestModel(contactId: 4121,
                                                    typeCode: nil,
                                                    uniqueId: nil)
        Chat.sharedInstance.removeContact(inputModel: inputModel, uniqueId: { (removeContactUniqueId) in
            print("\n remove Contact request uniqueId = \t \(removeContactUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: RemoveContactModel = myResponse as! RemoveContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my Remove contacts response:")
            print("\(myResponseJSON)")
        })
    }
    
    @objc func syncContactsButtonPressed() {
        Chat.sharedInstance.syncContacts(uniqueIds: { (syncContactUniqueIds) in
            print("\n sync Contact request uniqueIds = \t \(syncContactUniqueIds) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my sync contacts response:")
            print("\(myResponseJSON)")
        }, cacheResponse: { ([ContactModel]) in
//            <#code#>
        })
        
    }
 
    @objc func blockContactButtonPressed() {
        
        let inputModel = BlockContactsRequestModel(contactId: 896,
                                                   threadId: nil,
                                                   userId: nil,
                                                   typeCode: nil,
                                                   uniqueId: nil)
        Chat.sharedInstance.blockContact(inputModel: inputModel, uniqueId: { (blockContactUniqueId) in
            print("\n block request uniqueId = \t \(blockContactUniqueId) \n")
        }, completion: { (myResponse) in
            print("***********************")
            print("\n this is my block response:")
            let myResponseModel: BlockedContactModel = myResponse as! BlockedContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\(myResponseJSON) \n")
            print("***********************")
        })
        
    }
    
    @objc func unblockContactButtonPressed() {
        
        let inputModel = UnblockContactsRequestModel(blockId: 896,
                                                     contactId: nil,
                                                     threadId: nil,
                                                     userId: nil,
                                                     typeCode: nil,
                                                     uniqueId: nil)
        Chat.sharedInstance.unblockContact(inputModel: inputModel, uniqueId: { (unblockContactUniqueId) in
            print("\n unblock request uniqueId = \t \(unblockContactUniqueId) \n")
        }, completion: { (myResponse) in
            print("***********************")
            print("\n this is my unblock response:")
            let myResponseModel: BlockedContactModel = myResponse as! BlockedContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\(myResponseJSON) \n")
            print("***********************")
        })
        
    }
    
    @objc func getBlockedContactsButtonPressed() {
        
        let inputModel = GetBlockedContactListRequestModel(count: nil, offset: nil, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.getBlockedContacts(inputModel: inputModel, uniqueId: { (getBlockedContactListUniqueId) in
            print("\n get blocked list request uniqueId = \t \(getBlockedContactListUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetBlockedContactListModel = myResponse as! GetBlockedContactListModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get blocked list response:")
            print("\(myResponseJSON) \n")
        })
        
    }
    
    @objc func searchContactsButtonPressed() {
        
        let inputModel = SearchContactsRequestModel(cellphoneNumber: nil,
                                                    email: nil,
                                                    firstName: nil,
                                                    id: nil,
                                                    lastName: nil,
                                                    offset: nil,
                                                    size: nil,
                                                    query: "ma",
                                                    typeCode: nil,
                                                    uniqueId: nil)
        Chat.sharedInstance.searchContacts(inputModel: inputModel, uniqueId: { (searchContactsUniqueId) in
            print("\n search contacts request uniqueId = \t\(searchContactsUniqueId)")
        }, completion: { (myResponse) in
            print("***********************")
            let myResponseModel: ContactModel = myResponse as! ContactModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my search contacts response from Server:")
            print("\(myResponseJSON) \n")
            print("***********************")
        }, cacheResponse: { (searchContactResponse) in
            print("\n this is my search contact response from Cache:")
            let responseJSON = searchContactResponse.returnDataAsJSON()
            print("\(responseJSON)")
        })
        
    }
    
}


