//
//  MessageActions.swift
//  SimpleAppUsingChat
//
//  Created by MahyarZhiani on 9/19/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import FanapPodChatSDK
import SwiftyJSON
import UIKit

extension MyViewController {
    
    @objc func getHistoryButtonPressed() {
        
        let inputModel = GetHistoryRequestModel(count: 10,
                                                fromTime: nil,
                                                messageId: nil,
                                                messageType: nil,
                                                metadataCriteria: nil,
                                                offset: 0,
                                                order: nil,
                                                query: nil,
                                                senderId: nil,
                                                threadId: 3284,//13544,//6494,// 10720,
                                                toTime: nil,
                                                uniqueIds: nil,
                                                userId: nil,
                                                typeCode: nil,
                                                uniqueId: nil)
        Chat.sharedInstance.getHistory(inputModel: inputModel, uniqueId: { (getHistoryUniqueId) in
            print("\n get history request uniqueId = \t \(getHistoryUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseJSON = (myResponse as! GetHistoryModel).returnDataAsJSON()
            print("\n this is my get history response from Server: \n \(myResponseJSON) \n")
        }, cacheResponse: { (historyResponse) in
            let responseJSON = historyResponse.returnDataAsJSON()
            print("\n this is my get history response from Cache: \n \(responseJSON) \n")
        }, textMessagesNotSent: { (textMessagesWaiting) in
            print("\n this is my TextWaitQueue response from Cache:")
            for item in textMessagesWaiting {
                print("\(item.returnDataAsJSON())")
            }
        }, editMessagesNotSent: { (editMessagesWaiting) in
            print("\n this is my EditWaitQueue response from Cache:")
            for item in editMessagesWaiting {
                print("\(item.returnDataAsJSON())")
            }
        }, forwardMessagesNotSent: { (forwardMessagesWaiting) in
            print("\n this is my ForwardWaitQueue response from Cache:")
            for item in forwardMessagesWaiting {
                print("\(item.returnDataAsJSON())")
            }
        }, fileMessagesNotSent: { (fileMessagesWaiting) in
            print("\n this is my FileWaitQueue response from Cache:")
            for item in fileMessagesWaiting {
                print("\(item.returnDataAsJSONAndData())")
            }
        }, uploadImageNotSent: { (uploadImagesWaiting) in
            print("\n this is my uploadImageWaitQueue response from Cache:")
            for item in uploadImagesWaiting {
                print("\(item.returnDataAsJSONAndData())")
            }
        }) { (uploadFilesWaiting) in
            print("\n this is my uploadFileWaitQueue response from Cache:")
            for item in uploadFilesWaiting {
                print("\(item.returnDataAsJSONAndData())")
            }
        }
        
    }
    
    @objc func sendTextMessageButtonPressed() {
        let metadata: JSON = ["id": 3333, "type": "DUMMY_MESSAGE", "owner": "Mahyar"]
        let inputModel = SendTextMessageRequestModel(content: "\(inputTextFieldToSendMessage.text ?? "empty message")", metadata: metadata, repliedTo: nil, systemMetadata: nil, threadId: 3284/*13544,6494*/, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.sendTextMessage(inputModel: inputModel, uniqueId: { (uniqueIdStr) in
            print("message uniqueId is: \(uniqueIdStr)")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
        
    }
    
    @objc func editTextMessageButtonPressed() {
        let inputModel = EditTextMessageRequestModel(content: "text message", metadata: nil, repliedTo: nil, messageId: 63291, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.editMessage(inputModel: inputModel, uniqueId: { (editMessageUniqueId) in
            print("\n edit message request uniqueId = \t \(editMessageUniqueId) \n")
        }, completion: { (successResponse) in
            print("message is edited successfully: \(successResponse)")
        })
        
    }
    
    @objc func replyTextMessageButtonPressed() {
        
        let inputModel = ReplyTextMessageRequestModel(content: "\(inputTextFieldToSendMessage.text ?? "empty message")", metadata: nil, repliedTo: 35447, subjectId: 9953, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.replyMessage(inputModel: inputModel, uniqueId: { (uniqueIdStr) in
            print("message uniqueId is: \(uniqueIdStr)")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
        
    }
    
    @objc func forwardMessageButtonPressed() {
        
        let inputModel = ForwardMessageRequestModel(messageIds: [15395], metadata: nil, repliedTo: nil, threadId: 1133, typeCode: nil)
        Chat.sharedInstance.forwardMessage(inputModel: inputModel, uniqueIds: { (uniqueIdArr) in
            print("message uniqueId is: \(uniqueIdArr)")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
        
    }
    
    func deleteMessage() {
        
        let inputModel = DeleteMessageRequestModel(deleteForAll: nil, subjectId: 35486, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.deleteMessage(inputModel: inputModel, uniqueId: { (deleteMEssageUniqueId) in
            print("Delete Message Unique ID = \(deleteMEssageUniqueId)")
        }, completion: { (response) in
            print("delete Message response: \n \(response)")
        })
        
    }
    
    @objc func deleteMultipleMessages() {
        
        let inputModel = DeleteMultipleMessagesRequestModel(deleteForAll: nil,
                                                            threadId: 1103,
                                                            messageIds: [35486],
                                                            typeCode: nil)
        Chat.sharedInstance.deleteMultipleMessages(inputModel: inputModel, uniqueId: { (deleteMEssageUniqueId) in
            print("Delete Multiple Messages Unique ID = \(deleteMEssageUniqueId)")
        }, completion: { (response) in
            print("delete Message response: \n \(response)")
        })
        
    }
    
    @objc func searchHistoryButtonPressed() {  }
    
    @objc func sendLocationMessageButtonPressed() {
        let metadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
        let locationMessage = SendLocationMessageRequestModel(mapStaticCenterLat:   36.310886959563085,
                                                              mapStaticCenterLng:   59.53563741408013,
                                                              mapStaticHeight:      500,
                                                              mapStaticType:        "standard-night",
                                                              mapStaticWidth:       800,
                                                              mapStaticZoom:        15,
                                                              sendMessageImageName: "staticLocationPic",
                                                              sendMessageXC:        nil,
                                                              sendMessageYC:        nil,
                                                              sendMessageHC:        nil,
                                                              sendMessageWC:        nil,
                                                              sendMessageThreadId:  3284,
                                                              sendMessageContent:   "This is my location on the map",
                                                              sendMessageMetadata:  metadata,
                                                              sendMessageRepliedTo: nil,
                                                              sendMessageTypeCode:  nil,
                                                              typeCode:             nil,
                                                              uniqueId:             nil)
        
        Chat.sharedInstance.sendLocationMessage(inputModel: locationMessage, downloadProgress: { (progress) in
            print("downloaded progress = \(progress)")
        }, uploadUniqueId: { (uploadUniqueId) in
            print("upload UniqueId = \(uploadUniqueId)")
        }, uploadProgress: { (progress) in
            print("uploaded progress = \(progress)")
        }, messageUniqueId: { (sendLocationMessageUniqueId) in
            print("sendLocationMessageUniqueId = \(sendLocationMessageUniqueId)")
        }, onSent: { (sent) in
            print("the messsage has been sent: \n\(sent)")
        }, onDelivere: { (deliver) in
            print("the messsage has been delivered: \n\(deliver)")
        }, onSeen: { (seen) in
            print("the messsage has been seen: \n\(seen)")
        })
        
    }
    
    @objc func clearHistoryButtonPressed() {
        let inputModel = ClearHistoryRequestModel(threadId: 4622,
                                                  typeCode: nil,
                                                  uniqueId: nil)
        Chat.sharedInstance.clearHistory(inputModel: inputModel, uniqueId: { (createHistoryUniqueId) in
            print("\n create history request uniqueId = \t \(createHistoryUniqueId) \n")
        }, completion: { (myResponseJSON) in
            print("\n create history server response:")
            print("\(myResponseJSON) \n")
        })
    }
    
    @objc func sendBotMessageButtonPressed() {
        
        let inputModel = SendInteractiveMessageRequestModel(content: "Hi.........",
                                                            messageId: 63288,
                                                            metadata: ["key1":"value1"],
                                                            systemMetadata: nil,
                                                            typeCode: nil,
                                                            uniqueId: nil)
        Chat.sharedInstance.sendInteractiveMessage(inputModel: inputModel,
                                                   uniqueId: { (botMessageUniqueId) in
            print("bot message unique id is = \(botMessageUniqueId)")
        }, onSent: { (isSent) in
            print("bot message Sent:")
            print("\(isSent)")
        }, onDelivered: { (isDelivered) in
            print("bot message Deliver:")
            print("\(isDelivered)")
        }, onSeen: { (isSeen) in
            print("bot message Seen:")
            print("\(isSeen)")
        })
        
    }
    
    @objc func replyFileMessageButtonnPressed() {
        
        let image = UIImage(named: "pic")
        if let data = UIImageJPEGRepresentation(image!, 1) {
            
            let textMessage = SendTextMessageRequestModel(content: "empty message",
                                                          metadata: nil,
                                                          repliedTo: 73297,
                                                          systemMetadata: nil,
                                                          threadId: 3284,
                                                          typeCode: nil,
                                                          uniqueId: nil)
            let uploadInput = UploadFileRequestModel(dataToSend: data,
                                                     fileExtension: nil,
                                                     fileName: "newPic",
                                                     originalFileName: nil,
                                                     threadId: 3284,
                                                     typeCode: nil,
                                                     uniqueId: nil)
            let inputModel = SendFileMessageRequestModel(messageInput:  textMessage,
                                                         uploadInput:   uploadInput)
            
            Chat.sharedInstance.replyFileMessage(inputModel: inputModel, uploadUniqueId: { (uploadUniqueId) in
                print("upload unique id is = \(uploadUniqueId)")
            }, uploadProgress: { (prpgress) in
                print("upload progress is = \(prpgress)")
            }, messageUniqueId: { (messageUniqueId) in
                print("message unique id is = \(messageUniqueId)")
            }, onSent: { (isSent) in
                print("message Sent:")
                print("\(isSent)")
            }, onDelivered: { (isDelivered) in
                print("message Deliver:")
                print("\(isDelivered)")
            }, onSeen: { (isSeen) in
                print("message Seen:")
                print("\(isSeen)")
            })
            
        }
    }
    
    @objc func sendInteractiveMessageButtonPressed() {
        
        let metadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
        let inputModel = SendInteractiveMessageRequestModel(content:        "heloooo",
                                                            messageId:      121212121212,
                                                            metadata:       metadata,
                                                            systemMetadata: nil,
                                                            typeCode:       nil,
                                                            uniqueId:       nil)
        
        Chat.sharedInstance.sendInteractiveMessage(inputModel: inputModel, uniqueId: { (interactiveMessageUniqueId) in
            print("interactive Message unique id is = \(interactiveMessageUniqueId)")
        }, onSent: { (isSent) in
            print("message Sent: \n \(isSent)")
        }, onDelivered: { (isDelivered) in
            print("message Deliver: \n \(isDelivered)")
        }) { (isSeen) in
            print("message Seen: \n \(isSeen)")
        }
    }
    
    
    
}


