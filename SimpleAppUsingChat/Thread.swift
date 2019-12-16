//
//  ThreadActions.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 9/19/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import FanapPodChatSDK
import SwiftyJSON

extension MyViewController {
    
    @objc func getThreadsButtonPressed() {
        
        let inputModel = GetThreadsRequestModel(count: 10,
                                                creatorCoreUserId: nil,
                                                metadataCriteria: nil,
                                                name: nil,
                                                new: nil,
                                                offset: nil,
                                                partnerCoreContactId: nil,
                                                partnerCoreUserId: nil,
                                                threadIds: nil,
                                                typeCode: nil,
                                                uniqueId: nil)
        Chat.sharedInstance.getThreads(inputModel: inputModel, uniqueId: { (getThreadUniqueId) in
            print("\n get thread request uniqueId = \t \(getThreadUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetThreadsModel = myResponse as! GetThreadsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get thread response from Server:")
            print("\(myResponseJSON) \n")
        }, cacheResponse: { (threadResponse) in
            print("\n this is my get thread response from Cache:")
            let responseJSON = threadResponse.returnDataAsJSON()
            print("\(responseJSON)")
        })
        
    }
    
    @objc func getThreadParticipantsButtonPressed() {
        
        let inputModel = GetThreadParticipantsRequestModel(admin: nil,
                                                           count: 22,
                                                           firstMessageId: nil,
                                                           lastMessageId: nil,
                                                           name: nil,
                                                           offset: 0,
                                                           threadId: 3284,
                                                           typeCode: nil,
                                                           uniqueId: nil)
        Chat.sharedInstance.getThreadParticipants(inputModel: inputModel, uniqueId: { (getThreadParticipantUniqueId) in
            print("\n get thread participant request unique id = \t \(getThreadParticipantUniqueId)")
        }, completion: { (myResponse) in
            let myResponseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get thread participants response from Server:")
            print("\(myResponseJSON) \n")
        }, cacheResponse: { (myCacheResponse) in
            let myResponseJSON: JSON = myCacheResponse.returnDataAsJSON()
            print("\n this is my get thread participants response from Cache:")
            print("\(myResponseJSON) \n")
        })
        
        
    }
    
    @objc func createThreadButtonPressed() {
        
        let messageMetadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
        // CreateThread
//        let mehdi = Invitee(id: "4457", idType: "\(INVITEE_VO_ID_TYPES.TO_BE_USER_CONTACT_ID.stringValue())")
//        let sina = Invitee(id: "3157", idType: "\(INVITEE_VO_ID_TYPES.TO_BE_USER_CONTACT_ID.stringValue())")
//        let arvin = Invitee(id: "4539", idType: "\(INVITEE_VO_ID_TYPES.TO_BE_USER_CONTACT_ID.stringValue())")
        let mehdi = Invitee(id: "mahdi.akbari", idType: INVITEE_VO_ID_TYPES.TO_BE_USER_USERNAME.stringValue())
        let inputModel = CreateThreadRequestModel(description:  nil,
                                                  image:        nil,
                                                  invitees:     [mehdi],
                                                  metadata:     "\(messageMetadata)",
                                                  title:        "new thread created by username",
                                                  type:         ThreadTypes.NORMAL,
                                                  typeCode:     nil,
                                                  uniqueId:     nil)
        
        Chat.sharedInstance.createThread(inputModel: inputModel, uniqueId: { (createThreadUniqeuId) in
            print("\n create thread reqeuest uniqueId = \t \(createThreadUniqeuId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ThreadModel = myResponse as! ThreadModel
            print("\n this is my create thread response: \n \(myResponseModel.returnDataAsJSON()) \n")
        })
        
        
        // createThread and SendMessage
        /*
        let inviteeArray: [Invitee] = [Invitee(id: "09981084527", idType: "\(InviteeVOidTypes.TO_BE_USER_CELLPHONE_NUMBER.rawValue)")]
        
//        let inputModel = CreateThreadWithMessageRequestModel(threadDescription: nil,
//                                                             threadImage: nil,
//                                                             threadInvitees: inviteeArray,
//                                                             threadMetadata: nil,
//                                                             threadTitle: "New Group",
//                                                             threadType: "\(ThreadTypes.NORMAL.rawValue)",
//                                                             messageContentText: "This is the text of the message",
//                                                             messageForwardMessageIds: nil,
//                                                             messageMetaData: messageMetadata,
//                                                             messageRepliedTo: nil,
//                                                             messageSystemMetadata: nil,
//                                                             messageType: nil,
//                                                             messageUniqueId: nil)
        
        let inputModel = CreateThreadWithMessageRequestModel(threadDescription: nil,
                                                             threadImage: nil,
                                                             threadInvitees: inviteeArray,
                                                             threadMetadata: nil,
                                                             threadTitle: "New Group",
                                                             threadType: "\(ThreadTypes.NORMAL.rawValue)",
                                                             uniqueId: nil,
                                                             messageContent: "This is the text of the message",
                                                             messageMetaDataId: 2341234123,
                                                             messageMetaDataType: "BOT_MESSAGE",
                                                             messageMetaDataOwner: "Mahyar")
        Chat.sharedInstance.createThreadWithMessage(creatThreadWithMessageInput: inputModel, uniqueId: { (createWithSendMessageUniqeuId) in
            print("\n create thread reqeuest uniqueId = \t \(createWithSendMessageUniqeuId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: CreateThreadModel = myResponse as! CreateThreadModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my create thread response:")
            print("\(myResponseJSON) \n")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
        */
        
    }
    
    @objc func addParticipantsButtonPressed() {
//        let paramsToSend: JSON = ["threadId": 1330/*1101*/, "contacts": [2202, 952, 1281, 2306]]
//        Chat.sharedInstance.addParticipants(params: paramsToSend, uniqueId: { (addParticipantsUniqueId) in
//            print("\n add participant request uniqueId = \t \(addParticipantsUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("\n this is my add participants response:")
//            let response: AddParticipantModel = myResponse as! AddParticipantModel
//            let responseJSON: JSON = response.returnDataAsJSON()
//            print("\(responseJSON) \n")
//        })
        
//        let inputModel = AddParticipantsRequestModel(contacts: [2202, 2869], threadId: 3861, typeCode: nil, uniqueId: nil)
//        Chat.sharedInstance.addParticipants(addParticipantsInput: inputModel, uniqueId: { (addParticipantsUniqueId) in
//            print("\n add participant request uniqueId = \t \(addParticipantsUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("\n this is my add participants response:")
//            let response: AddParticipantModel = myResponse as! AddParticipantModel
//            let responseJSON: JSON = response.returnDataAsJSON()
//            print("\(responseJSON) \n")
//        })
        
        
        let input = SendSignalMessageRequestModel(signalType: SignalMessageType.IS_TYPING, threadId: 293, uniqueId: nil)
//        Chat.sharedInstance.startSignalMessage(input: input)
        
    }
    
    @objc func removeParticipantsButtonPressed() {
        
        let inputModel = RemoveParticipantsRequestModel(participantIds: [1], threadId: 1330, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.removeParticipants(inputModel: inputModel, uniqueId: { (removeParticipantsUniqueId) in
            print("\n remove participant request uniqueId = \t \(removeParticipantsUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my remove participants response:")
            let response: RemoveParticipantModel = myResponse as! RemoveParticipantModel
            let responseJSON: JSON = response.returnDataAsJSON()
            print("\(responseJSON) \n")
        })
        
    }
    
    @objc func muteThreadButtonPressed() {
        
       let inputModel = MuteAndUnmuteThreadRequestModel(subjectId: 2195, typeCode: nil, uniqueId: nil)
       Chat.sharedInstance.muteThread(inputModel: inputModel, uniqueId: { (muteThreadUniqueId) in
           print("\n mute thread request uniqueId = \t \(muteThreadUniqueId) \n")
       }, completion: { (response) in
           print("\n this is my mute thread response:")
           print("\(response) \n")
       })
   }
   
    @objc func unmuteThreadButtonPressed() {
       
       let inputModel = MuteAndUnmuteThreadRequestModel(subjectId: 1101, typeCode: nil, uniqueId: nil)
       Chat.sharedInstance.unmuteThread(inputModel: inputModel, uniqueId: { (unmuteThreadUniqueId) in
           print("\n unmute thread request uniqueId = \t \(unmuteThreadUniqueId) \n")
       }, completion: { (response) in
           print("\n this is my unmute thread response:")
           print("\(response) \n")
       })
       
   }
   
    @objc func updateThreadInfoButtonPressed() {
        let metaData: JSON = ["id": 1202,
                                "owner": "masoudmanson",
                                "name": "Masoud"]
        
        let inputModel = UpdateThreadInfoRequestModel(description: "توضیحات ترد",
                                                        image: "https://static2.farakav.com/files/pictures/thumb/01330672.jpg",
                                                        metadata: metaData,
                                                        threadId: 10794,
                                                        title: "عنوان ترد",
                                                        typeCode: nil,
                                                        uniqueId: nil)
        
        Chat.sharedInstance.updateThreadInfo(inputModel: inputModel, uniqueId: { (updateThreadInfoUniqueId) in
            print("***************************")
            print("update thread info unique id = \(updateThreadInfoUniqueId)")
            print("***************************")
        }, completion: { (response) in
            print("***************************")
            print("***************************")
            let resModel = response as! GetThreadsModel
            print("\(resModel.returnDataAsJSON())")
            print("***************************")
            print("***************************")
        })
        
    }
    
    @objc func searchThreadButtonPressed() {  }
    
    @objc func leaveThreadButtonPressed() {
        
        let inputModel = LeaveThreadRequestModel(threadId: 1343, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.leaveThread(inputModel: inputModel, uniqueId: { (leaveThreadUniqueId) in
            print("\n get blocked list request uniqueId = \t \(leaveThreadUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: ThreadModel = myResponse as! ThreadModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my leave thread response:")
            print("\(myResponseJSON) \n")
        })
    }
        
    @objc func spamThreadButtonPressed() {
//        let paramsToSend: JSON = ["threadId": 1329]
//        Chat.sharedInstance.spamPvThread(params: paramsToSend, uniqueId: { (spamThreadUniqueId) in
//            print("\n get blocked list request uniqueId = \t \(spamThreadUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("\n this is my spam thread response:")
//            print("\(myResponse) \n")
//        })
    }
    
    @objc func messageDeliverListButtonPressed() {
//        let paramsToSend: JSON = ["messageId": 16791, "subjectId": 1330]
//        Chat.sharedInstance.messageDeliveryList(params: paramsToSend, uniqueId: { (messageDeliverListUniqueId) in
//            print("\n Message Deliver list request uniqueId = \t \(messageDeliverListUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("\n this is my Message Deliver list response:")
//            let responseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
//            let responseJSON: JSON = responseModel.returnDataAsJSON()
//            print("\(responseJSON) \n")
//        })
    }
    
    @objc func messageSeenListButtonPressed() {
//        let paramsToSend: JSON = ["messageId": 16791]
//        Chat.sharedInstance.messageSeenList(params: paramsToSend, uniqueId: { (messageSeenListUniqueId) in
//            print("\n Message Seen list request uniqueId = \t \(messageSeenListUniqueId) \n")
//        }, completion: { (myResponse) in
//            print("\n this is my Message Seen list response:")
//            let responseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
//            let responseJSON: JSON = responseModel.returnDataAsJSON()
//            print("\(responseJSON) \n")
//        })
    }
    
    @objc func SetAuditorButtonSelected() {
        
        let roles = [Roles.READ_THREAD , Roles.EDIT_THREAD]
        let inputModel = SetRoleRequestModel(roles: roles,
                                             roleOperation: RoleOperations.Add,
                                             threadId: 3284,
                                             userId: 1,
                                             typeCode: nil,
                                             uniqueId: nil)
        Chat.sharedInstance.setRole(inputModel: [inputModel], uniqueId: { (setAuiditoUniqueId) in
            print("\n set auditor request unique id = \t \(setAuiditoUniqueId)")
        }, completion: { (serverResponse) in
            let serverRes = serverResponse as! UserRolesModel
            print("\n set auditor response from Server:")
            print("\(serverRes.returnDataAsJSON()) \n")
        }) { (cacheResponse) in
            print("\n set auditor response from Server:")
            print("\(cacheResponse) \n")
        }
        
    }
    
}

