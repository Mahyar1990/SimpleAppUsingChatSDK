//
//  ThreadActions.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 9/19/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import FanapPodChatSDK
import SwiftyJSON
import UIKit

extension MyViewController {
    
    @objc func getThreadsButtonPressed() {
        
        let inputModel = GetThreadsRequestModel(count: 10,
                                                creatorCoreUserId: nil,
                                                metadataCriteria: nil,
                                                name: nil,
                                                new: nil,
                                                offset: 0,
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
    
    @objc func searchThreadButtonPressed() {
        
        let inputModel = GetThreadsRequestModel(count: 10,
                                                creatorCoreUserId: nil,
                                                metadataCriteria: nil,
                                                name: "mehdi",
                                                new: nil,
                                                offset: 0,
                                                partnerCoreContactId: nil,
                                                partnerCoreUserId: nil,
                                                threadIds: nil,
                                                typeCode: nil,
                                                uniqueId: nil)
        Chat.sharedInstance.getThreads(inputModel: inputModel, uniqueId: { (getThreadUniqueId) in
            print("\n get thread (search) request uniqueId = \t \(getThreadUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetThreadsModel = myResponse as! GetThreadsModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get thread (search) response from Server:")
            print("\(myResponseJSON) \n")
        }, cacheResponse: { (threadResponse) in
            print("\n this is my get thread (search) response from Cache:")
            let responseJSON = threadResponse.returnDataAsJSON()
            print("\(responseJSON)")
        })
        
    }
    
    @objc func createThreadButtonPressed() {
            
            // CreateThread
    //        let mehdi = Invitee(id: "4457", idType: "\(INVITEE_VO_ID_TYPES.TO_BE_USER_CONTACT_ID.stringValue())")
    //        let sina = Invitee(id: "3157", idType: "\(INVITEE_VO_ID_TYPES.TO_BE_USER_CONTACT_ID.stringValue())")
    //        let arvin = Invitee(id: "4539", idType: "\(INVITEE_VO_ID_TYPES.TO_BE_USER_CONTACT_ID.stringValue())")
            let mehdi = Invitee(id: "s.javaheri", idType: INVITEE_VO_ID_TYPES.TO_BE_USER_USERNAME.stringValue())
            let inputModel = CreateThreadRequestModel(description:  nil,
                                                      image:        nil,
                                                      invitees:     [mehdi],
                                                      metadata:     nil,
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
    
    @objc func updateThreadInfoButtonPressed() {
        
        let inputModel = UpdateThreadInfoRequestModel(description: "توضیحات ترد",
                                                        image: "https://static2.farakav.com/files/pictures/thumb/01330672.jpg",
                                                        metadata: nil,
                                                        threadId: 6873,
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
            print("update thread info response = \n\(resModel.returnDataAsJSON())")
            print("***************************")
            print("***************************")
        })
        
    }
    
    @objc func createThreadWithMessageButtonPressed() {
        
        let messageModel = MessageInput(forwardedMessageIds: nil,
                                        repliedTo:          nil,
                                        text:               "blah blah",
                                        type:               nil,
//                                        metadata:           nil,
                                        systemMetadata:     nil,
                                        uniqueId:           nil)
        
        let invitee = Invitee(id: "09155081967", idType: INVITEE_VO_ID_TYPES.TO_BE_USER_CELLPHONE_NUMBER)
        let createThreadModel = CreateThreadRequestModel(description: nil,
                                                         image:     nil,
                                                         invitees:  [invitee],
                                                         metadata:  nil,
                                                         title:     "new Conversation",
                                                         type:      ThreadTypes.NORMAL,
                                                         typeCode:  nil,
                                                         uniqueId:  nil)
        let inputModel = CreateThreadWithMessageRequestModel(createThreadInput: createThreadModel, sendMessageInput: messageModel)
        Chat.sharedInstance.createThreadWithMessage(inputModel: inputModel, threadUniqueId: { (threaduniqueIdResponse) in
            print("the createThread uniqueId = \(threaduniqueIdResponse)")
        }, messageUniqueId: { (messageUniqueIdResponse) in
            print("the message uniqueIds = \(messageUniqueIdResponse)")
        }, completion: { (createThreadResponse) in
            print("the createThread response is sent = \((createThreadResponse as! ThreadModel).returnDataAsJSON())")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
    }
    
    @objc func createThreadWithFileMessageButtonPressed() {
        
        let image = UIImage(named: "pic")
        if let data = UIImageJPEGRepresentation(image!, 1) {
            let invitee = Invitee(id: "09155081967", idType: INVITEE_VO_ID_TYPES.TO_BE_USER_CELLPHONE_NUMBER)
            let createThreadModel = CreateThreadRequestModel(description:   nil,
                                                             image:         nil,
                                                             invitees:      [invitee],
                                                             metadata:      nil,
                                                             title:         "new Thread",
                                                             type:          ThreadTypes.NORMAL,
                                                             typeCode:      nil,
                                                             uniqueId:      nil)
            let messageModel = MessageInput(forwardedMessageIds: nil,
                                            repliedTo:          nil,
                                            text:               "dummy message text",
                                            type:               nil,
//                                            metadata:           nil,
                                            systemMetadata:     nil,
                                            uniqueId:           nil)
            let createThreadMessageModel = CreateThreadWithMessageRequestModel(createThreadInput:   createThreadModel,
                                                                               sendMessageInput:    messageModel)
            let uploadModel = UploadFileRequestModel(dataToSend:    data,
                                                     fileExtension: nil,
                                                     fileName:      nil,
                                                     originalFileName: nil,
                                                     threadId:      nil,
                                                     typeCode:      nil,
                                                     uniqueId:      nil)
            let inputModel = CreateThreadWithFileMessageRequestModel(creatThreadWithMessageInput:   createThreadMessageModel,
                                                                     uploadInput:                   uploadModel)
            Chat.sharedInstance.createThreadWithFileMessage(inputModel: inputModel, uploadUniqueId: { (uploadUniqueIdResponse) in
                print("the upload uniqueId = \(uploadUniqueIdResponse)")
            }, uploadProgress: { (progress) in
                print("the upload progress = \(progress)")
            }, uniqueId: { (messageUniqueIdResponse) in
                print("the createThread uniqueId = \(messageUniqueIdResponse)")
            }, completion: { (createThreadResponse) in
                print("the createThread response is sent = \((createThreadResponse as! ThreadModel).returnDataAsJSON())")
            }, onSent: { (isSent) in
                print("the message is sent = \(isSent)")
            }, onDelivered: { (isDeliver) in
                print("the message is delivered: '\(isDeliver)'")
            }, onSeen: { (isSeen) in
                print("the message with is Seen: '\(isSeen)'")
            })
        }
        
    }
    
    
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
        
        let inputModel = SpamPvThreadRequestModel(threadId: 9766, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.spamPvThread(inputModel: inputModel, uniqueId: { (spamThreadUniqueId) in
            print("\n spam thread request uniqueId = \t \(spamThreadUniqueId) \n")
        }) { (response) in
            
            if let clearHistory = response as? ClearHistoryModel {
                print("\n spam thread clearHistory = \t \(clearHistory.returnDataAsJSON()) \n")
            } else if let blockThread = response as? BlockedContactModel {
                print("\n spam thread blockThread = \t \(blockThread.returnDataAsJSON()) \n")
            } else if let threadModel = response as? ThreadModel {
                print("\n spam thread threadModel = \t \(threadModel.returnDataAsJSON()) \n")
            }
            
        }
        
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
    
    
    @objc func setAuditorButtonSelected() {
        
        
        let roleModel = SetRemoveRoleModel(userId: 1, roles: [Roles.READ_THREAD])
        let inputModel = RoleRequestModel(userRoles: [roleModel],
                                          threadId: 3284,
                                          typeCode: nil,
                                          uniqueId: nil)
        Chat.sharedInstance.setRole(inputModel: inputModel, uniqueId: { (setAuiditoUniqueId) in
            print("\n set auditor request unique id = \t \(setAuiditoUniqueId)")
        }, completion: { (serverResponse) in
            let serverRes = serverResponse as! UserRolesModel
            print("\n set auditor response from Server:")
            print("\(serverRes.returnDataAsJSON()) \n")
        })
        
    }
    
    @objc func removeAuditorButtonSelected() {
        
        
        
    }
    
    @objc func pinThreadButtonPressed() {
        
    }
    
    @objc func unpinThreadButtonPressed() {
        
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
    
    
    @objc func getCurrentUserRolesButtonPressed() {
        
        let inputModel = GetCurrentUserRolesRequestModel(threadId: 3284,
                                                         typeCode: nil,
                                                         uniqueId: nil)
        Chat.sharedInstance.getCurrentUserRoles(inputModel: inputModel, uniqueId: { (getUserRolesUniqueId) in
            print("\n get current user roles request unique id = \t \(getUserRolesUniqueId)")
        }) { (getUserRoles) in
            let myResponse: GetCurrentUserRolesModel = getUserRoles as! GetCurrentUserRolesModel
            print("\n this is my get current user roles response: \n \(myResponse.returnDataAsJSON())")
        }
        
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
    
    
}

