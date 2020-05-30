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
        
        let inputModel = GetThreadsRequestModel(count: 7,
                                                creatorCoreUserId: nil,
                                                metadataCriteria: nil,
                                                name: nil,
                                                new: false,
                                                offset: 0,
                                                partnerCoreContactId: nil,
                                                partnerCoreUserId: nil,
                                                threadIds: nil,
                                                typeCode: nil,
                                                uniqueId: nil)
        Chat.sharedInstance.getThreads(inputModel: inputModel, getCacheResponse: nil, uniqueId: { (getThreadUniqueId) in
            print("\n get thread request uniqueId = \t \(getThreadUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetThreadsResponse = myResponse as! GetThreadsResponse
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
        Chat.sharedInstance.getThreads(inputModel: inputModel, getCacheResponse: nil, uniqueId: { (getThreadUniqueId) in
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
//        let mehdi = Invitee(id: "4457", idType: "\(InviteeVoIdTypes.TO_BE_USER_CONTACT_ID.stringValue())")
//        let sina = Invitee(id: "3157", idType: "\(InviteeVoIdTypes.TO_BE_USER_CONTACT_ID.stringValue())")
//        let arvin = Invitee(id: "4539", idType: "\(InviteeVoIdTypes.TO_BE_USER_CONTACT_ID.stringValue())")
//        let sina = Invitee(id: "s.javaheri", idType: InviteeVoIdTypes.TO_BE_USER_USERNAME.stringValue())
//        let sara = Invitee(id: "23464", idType: InviteeVoIdTypes.TO_BE_USER_CONTACT_ID)
//        let zizi = Invitee(id: "09981084527", idType: InviteeVoIdTypes.TO_BE_USER_CELLPHONE_NUMBER.stringValue())
        let sss = Invitee(id: "563", idType: InviteeVoIdTypes.TO_BE_USER_CONTACT_ID.stringValue())
        
        let inputModel = CreateThreadRequestModel(description:  nil,
                                                  image:        nil,
                                                  invitees:     [sss],
                                                  metadata:     nil,
                                                  uniqueName:   nil,
                                                  title:        "new public thread created by contactId",
                                                  type:         ThreadTypes.OWNER_GROUP,
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
    
    @objc func joinThreadButtonPressed() {
        let inputModel = JoinThreadRequestModel(uniqueName: "mahyarrrrrrrrrrrrrrrr",
                                                typeCode:   nil,
                                                uniqueId:   nil)
        Chat.sharedInstance.joinThread(inputModel: inputModel, uniqueId: { (joinThreadInfoUniqueId) in
            print("join thread unique id = \(joinThreadInfoUniqueId)")
        }) { (response) in
            print("join thread response = \n\((response as! ThreadModel).returnDataAsJSON())")
        }
    }
    
    @objc func isNameAvailableThreadButtonPressed() {
        let inputModel = IsNameAvailableThreadRequestModel(name:       "unique_name_1584261352017",
                                                           typeCode:   nil,
                                                           uniqueId:   nil)
        Chat.sharedInstance.isNameAvailable(inputModel: inputModel, uniqueId: { (isNameAvailableThreadUniqueId) in
            print("isNameAvailable thread unique id = \(isNameAvailableThreadUniqueId)")
        }) { (response) in
            print("isNameAvailable thread response = \n\((response as! IsAvailableNameModel).returnDataAsJSON())")
        }
    }
    
    @objc func updateThreadInfoButtonPressed() {
        let meta: JSON = ["id": 33, "owner": "mahyar", "date": "10/01/99"]
        let inputModel = UpdateThreadInfoRequestModel(description: "myDescription2",
                                                      image: "https://static2.farakav.com/files/pictures/thumb/01330673.jpg",
                                                      metadata: "\(meta)",
                                                      threadId: 7828,
                                                      title: "This is new title",
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
                                        messageType:        MessageType.TEXT,
//                                        metadata:           nil,
                                        systemMetadata:     nil,
                                        uniqueId:           nil)
        
        let invitee = Invitee(id: "25397", idType: InviteeVoIdTypes.TO_BE_USER_CONTACT_ID)
        let createThreadModel = CreateThreadRequestModel(description: nil,
                                                         image:     nil,
                                                         invitees:  [invitee],
                                                         metadata:  nil,
                                                         uniqueName: nil,
                                                         title:     "Mahyar",
                                                         type:      ThreadTypes.OWNER_GROUP,
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
    
    
    // ToDo: implemnt this method with new implementation of createThreadWIthMessage
    @objc func createThreadWithFileMessageButtonPressed() {
        
//        let image = UIImage(named: "pic")
//        if let data = UIImageJPEGRepresentation(image!, 1) {
//            let invitee = Invitee(id: "09155081967", idType: InviteeVoIdTypes.TO_BE_USER_CELLPHONE_NUMBER)
//            let createThreadModel = CreateThreadRequestModel(description:   nil,
//                                                             image:         nil,
//                                                             invitees:      [invitee],
//                                                             metadata:      nil,
//                                                             uniqueName:    nil,
//                                                             title:         "new Thread",
//                                                             type:          ThreadTypes.NORMAL,
//                                                             typeCode:      nil,
//                                                             uniqueId:      nil)
//            let messageModel = MessageInput(forwardedMessageIds: nil,
//                                            repliedTo:          nil,
//                                            text:               "dummy message text",
//                                            messageType:        MessageType.PICTURE,
////                                            metadata:           nil,
//                                            systemMetadata:     nil,
//                                            uniqueId:           nil)
//            let createThreadMessageModel = CreateThreadWithMessageRequestModel(createThreadInput:   createThreadModel,
//                                                                               sendMessageInput:    messageModel)
//            let uploadModel = UploadFileRequestModel(dataToSend:    data,
//                                                     fileExtension: nil,
//                                                     fileName:      nil,
//                                                     mimeType:      nil,
//                                                     originalFileName: nil,
//                                                     threadId:      nil,
//                                                     typeCode:      nil,
//                                                     uniqueId:      nil)
//            let inputModel = CreateThreadWithFileMessageRequestModel(creatThreadWithMessageInput:   createThreadMessageModel,
//                                                                     uploadInput:                   uploadModel)
//            Chat.sharedInstance.createThreadWithFileMessage(inputModel: inputModel, uploadUniqueId: { (uploadUniqueIdResponse) in
//                print("the upload uniqueId = \(uploadUniqueIdResponse)")
//            }, uploadProgress: { (progress) in
//                print("the upload progress = \(progress)")
//            }, uniqueId: { (messageUniqueIdResponse) in
//                print("the createThread uniqueId = \(messageUniqueIdResponse)")
//            }, completion: { (createThreadResponse) in
//                print("the createThread response is sent = \((createThreadResponse as! ThreadModel).returnDataAsJSON())")
//            }, onSent: { (isSent) in
//                print("the message is sent = \(isSent)")
//            }, onDelivered: { (isDeliver) in
//                print("the message is delivered: '\(isDeliver)'")
//            }, onSeen: { (isSeen) in
//                print("the message with is Seen: '\(isSeen)'")
//            })
//        }
        
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
            } else if let blockThread = response as? BlockedUserModel {
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
    
    
    @objc func setRoleButtonPressed() {
        let roleModel = SetRemoveRoleModel(userId: 1, roles: [Roles.EDIT_THREAD])
        let inputModel = RoleRequestModel(userRoles: [roleModel],
                                          threadId: 3284,
                                          typeCode: nil,
                                          uniqueId: nil)
        Chat.sharedInstance.setRole(inputModel: inputModel, uniqueId: { (setRoleUniqueId) in
            print("\n set role request unique id = \t \(setRoleUniqueId)")
        }, completion: { (serverResponse) in
            let serverRes = serverResponse as! UserRolesModel
            print("\n set role response from Server:")
            print("\(serverRes.returnDataAsJSON()) \n")
        })
    }
    
    @objc func removeRoleButtonPressed() {
        let roleModel = SetRemoveRoleModel(userId: 1, roles: [Roles.EDIT_THREAD])
        let inputModel = RoleRequestModel(userRoles: [roleModel],
                                          threadId: 3284,
                                          typeCode: nil,
                                          uniqueId: nil)
        Chat.sharedInstance.removeRole(inputModel: inputModel, uniqueId: { (removeRoleUniqueId) in
            print("\n remove role request unique id = \t \(removeRoleUniqueId)")
        }, completion: { (serverResponse) in
            let serverRes = serverResponse as! UserRolesModel
            print("\n remove role response from Server:")
            print("\(serverRes.returnDataAsJSON()) \n")
        })
    }
    
    @objc func setAuditorButtonSelected() {
        let inputModel = AddRemoveAuditorRequestModel(roles: [Roles.READ_THREAD],
                                                      threadId: 3284,
                                                      userId: 1,
                                                      typeCode: nil,
                                                      uniqueId: nil)
        Chat.sharedInstance.setAuditor(inputModel: inputModel, uniqueId: { (setAuditoUniqueId) in
            print("\n set auditor request unique id = \t \(setAuditoUniqueId)")
        }) { (serverResponse) in
            let serverRes = serverResponse as! UserRolesModel
            print("\n set auditor response from Server:")
            print("\(serverRes.returnDataAsJSON()) \n")
        }
    }
    
    @objc func removeAuditorButtonSelected() {
        let inputModel = AddRemoveAuditorRequestModel(roles: [Roles.READ_THREAD],
                                                      threadId: 3284,
                                                      userId: 1,
                                                      typeCode: nil,
                                                      uniqueId: nil)
        Chat.sharedInstance.removeAuditor(inputModel: inputModel, uniqueId: { (removeAuditoUniqueId) in
            print("\n remove auditor request unique id = \t \(removeAuditoUniqueId)")
        }) { (serverResponse) in
            let serverRes = serverResponse as! UserRolesModel
            print("\n remove auditor response from Server:")
            print("\(serverRes.returnDataAsJSON()) \n")
        }
    }
    
    @objc func pinThreadButtonPressed() {
        let inputModel = PinAndUnpinThreadRequestModel(threadId: 3311,
                                                       typeCode: nil,
                                                       uniqueId: nil)
        Chat.sharedInstance.pinThread(inputModel: inputModel, uniqueId: { (pinThreadUniqueId) in
            print("\n pin thread request unique id = \t \(pinThreadUniqueId)")
        }) { (serverResponse) in
            print("\n pin thread response from Server: \n\((serverResponse as! UserRolesModel).returnDataAsJSON())\n")
        }
    }
    
    @objc func unpinThreadButtonPressed() {
        let inputModel = PinAndUnpinThreadRequestModel(threadId: 3311,
                                                       typeCode: nil,
                                                       uniqueId: nil)
        Chat.sharedInstance.unpinThread(inputModel: inputModel, uniqueId: { (unpinThreadUniqueId) in
            print("\n unpin thread request unique id = \t \(unpinThreadUniqueId)")
        }) { (serverResponse) in
            print("\n unpin thread response from Server: \n\((serverResponse as! UserRolesModel).returnDataAsJSON())\n")
        }
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
        
//        let inputModel = AddParticipantsRequestModel(contactIds: [2202, 2869], threadId: 7550, typeCode: nil, uniqueId: nil)
        let inputModel = AddParticipantsRequestModel(usernames: ["yrojadsfljjnsvBOT"], threadId: 7468, typeCode: nil, uniqueId: nil)
//        let inputModel = AddParticipantsRequestModel(coreUserIds: [16704], threadId: 7468, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.addParticipants(inputModel: inputModel, uniqueId: { (addParticipantsUniqueId) in
            print("\n add participant request uniqueId = \t \(addParticipantsUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my add participants response:")
            let response: AddParticipantModel = myResponse as! AddParticipantModel
            let responseJSON: JSON = response.returnDataAsJSON()
            print("\(responseJSON) \n")
        })
        
        
//        let input = SendSignalMessageRequestModel(signalType: SignalMessageType.IS_TYPING, threadId: 293, uniqueId: nil)
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
                                                           threadId: 12090,
                                                           typeCode: nil,
                                                           uniqueId: nil)
        Chat.sharedInstance.getThreadParticipants(inputModel: inputModel, getCacheResponse: nil, uniqueId: { (getThreadParticipantUniqueId) in
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
        
        let inputModel = GetCurrentUserRolesRequestModel(threadId: 7042,
                                                         typeCode: nil,
                                                         uniqueId: nil)
        Chat.sharedInstance.getCurrentUserRoles(inputModel: inputModel, getCacheResponse: nil, uniqueId: { (getUserRolesUniqueId) in
            print("\n get current user roles request unique id = \t \(getUserRolesUniqueId)")
        }, completion: { (getUserRoles) in
            let myResponse: GetCurrentUserRolesModel = getUserRoles as! GetCurrentUserRolesModel
            print("\n this is my get current user roles response: \n \(myResponse.returnDataAsJSON())")
        }, cacheResponse: { (myCacheResponse) in
            let myResponseJSON: JSON = myCacheResponse.returnDataAsJSON()
            print("\n this is my get current user roles response from Cache:")
            print("\(myResponseJSON) \n")
        })
        
    }
    
    
    @objc func messageDeliverListButtonPressed() {
        let inputModel = MessageDeliverySeenListRequestModel(count:     nil,
                                                             messageId: 16791,
                                                             offset:    nil,
                                                             typeCode:  nil,
                                                             uniqueId:  nil)
        Chat.sharedInstance.messageDeliveryList(inputModel: inputModel, uniqueId: { (messageDeliverListUniqueId) in
            print("\n Message Deliver list request uniqueId = \t \(messageDeliverListUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my Message Deliver list response:")
            let responseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
            let responseJSON: JSON = responseModel.returnDataAsJSON()
            print("\(responseJSON) \n")
        })
    }
    
    @objc func messageSeenListButtonPressed() {
        let inputModel = MessageDeliverySeenListRequestModel(count:     nil,
                                                             messageId: 16791,
                                                             offset:    nil,
                                                             typeCode:  nil,
                                                             uniqueId:  nil)
        Chat.sharedInstance.messageSeenList(inputModel: inputModel, uniqueId: { (messageSeenListUniqueId) in
            print("\n Message Seen list request uniqueId = \t \(messageSeenListUniqueId) \n")
        }, completion: { (myResponse) in
            print("\n this is my Message Seen list response:")
            let responseModel: GetThreadParticipantsModel = myResponse as! GetThreadParticipantsModel
            let responseJSON: JSON = responseModel.returnDataAsJSON()
            print("\(responseJSON) \n")
        })
    }
    
    
}

