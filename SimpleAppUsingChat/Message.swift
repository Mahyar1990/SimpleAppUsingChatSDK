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
        
        let inputModel = GetHistoryRequestModel(count: nil,
                                                fromTime: nil,
                                                messageId: nil,
                                                messageType: nil,
                                                metadataCriteria: nil,
                                                offset: 0,
                                                order: nil,
                                                query: nil,
                                                senderId: nil,
                                                threadId: 13544,//6494,// 10720,
                                                toTime: nil,
                                                uniqueIds: nil,
                                                userId: nil,
                                                typeCode: nil,
                                                uniqueId: nil)
        Chat.sharedInstance.getHistory(getHistoryInput: inputModel, uniqueId: { (getHistoryUniqueId) in
            print("\n get history request uniqueId = \t \(getHistoryUniqueId) \n")
        }, completion: { (myResponse) in
            let myResponseModel: GetHistoryModel = myResponse as! GetHistoryModel
            let myResponseJSON: JSON = myResponseModel.returnDataAsJSON()
            print("\n this is my get history response from Server:")
            print("\(myResponseJSON) \n")
        }, cacheResponse: { (historyResponse) in
            print("\n this is my get history response from Cache:")
            let responseJSON = historyResponse.returnDataAsJSON()
            print("\(responseJSON)")
        }, textMessagesNotSent: { (_) in }, editMessagesNotSent: { (_) in }, forwardMessagesNotSent: { (_) in }, fileMessagesNotSent: { (_) in }, uploadImageNotSent: { (_) in }, uploadFileNotSent: { (_) in })
        
    }
    
    @objc func sendMessageToSocketPressed() {
        sendMessage()
//        editMessage()
//        replyMessage()
//        forwardMessage()
//        deleteMessage()
//        deleteMultipleMessages()
    }
    
    func sendMessage() {
        let metadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
        let inputModel = SendTextMessageRequestModel(content: "\(inputTextFieldToSendMessage.text ?? "empty message")", metaData: metadata, repliedTo: nil, systemMetadata: nil, threadId: 6500, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.sendTextMessage(sendTextMessageInput: inputModel, uniqueId: { (uniqueIdStr) in
            print("message uniqueId is: \(uniqueIdStr)")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
        
    }
    
    func editMessage() {
        let inputModel = EditTextMessageRequestModel(content: "text message", metaData: nil, repliedTo: nil, messageId: 10799, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.editMessage(editMessageInput: inputModel, uniqueId: { (editMessageUniqueId) in
            print("\n edit message request uniqueId = \t \(editMessageUniqueId) \n")
        }, completion: { (successResponse) in
            print("message is edited successfully: \(successResponse)")
        })
        
    }
    
    func replyMessage() {
        
        let inputModel = ReplyTextMessageRequestModel(content: "\(inputTextFieldToSendMessage.text ?? "empty message")", metaData: nil, repliedTo: 35447, subjectId: 9953, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.replyMessage(replyMessageInput: inputModel, uniqueId: { (uniqueIdStr) in
            print("message uniqueId is: \(uniqueIdStr)")
        }, onSent: { (isSent) in
            print("the message is sent = \(isSent)")
        }, onDelivere: { (isDeliver) in
            print("the message is delivered: '\(isDeliver)'")
        }, onSeen: { (isSeen) in
            print("the message with is Seen: '\(isSeen)'")
        })
        
    }
    
    func forwardMessage() {
        
        let inputModel = ForwardMessageRequestModel(messageIds: [15395], metaData: nil, repliedTo: nil, threadId: 1133, typeCode: nil)
        Chat.sharedInstance.forwardMessage(forwardMessageInput: inputModel, uniqueIds: { (uniqueIdArr) in
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
        Chat.sharedInstance.deleteMessage(deleteMessageInput: inputModel, uniqueId: { (deleteMEssageUniqueId) in
            print("Delete Message Unique ID = \(deleteMEssageUniqueId)")
        }, completion: { (response) in
            print("delete Message response: \n \(response)")
        })
        
    }
    
    func deleteMultipleMessages() {
        
        let inputModel = DeleteMultipleMessagesRequestModel(deleteForAll: nil,
                                                            threadId: 1103,
                                                            messageIds: [35486],
                                                            typeCode: nil)
        Chat.sharedInstance.deleteMultipleMessages(deleteMessageInput: inputModel, uniqueId: { (deleteMEssageUniqueId) in
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
                                                              sendMessageThreadId:  1342,
                                                              sendMessageContent:   "This is my location on the map",
                                                              sendMessageMetaData:  metadata,
                                                              sendMessageRepliedTo: nil,
                                                              sendMessageTypeCode:  nil,
                                                              typeCode:             nil,
                                                              uniqueId:             nil)
        
        Chat.sharedInstance.sendLocationMessage(sendLocationMessageRequest: locationMessage, uniqueId: { (sendLocationMessageUniqueId) in
            print("sendLocationMessageUniqueId = \(sendLocationMessageUniqueId)")
        }, downloadProgress: { (progress) in
            print("downloaded progress = \(progress)")
        }, uploadProgress: { (progress) in
            print("uploaded progress = \(progress)")
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
        Chat.sharedInstance.clearHistory(clearHistoryInput: inputModel, uniqueId: { (createHistoryUniqueId) in
            print("\n create history request uniqueId = \t \(createHistoryUniqueId) \n")
        }, completion: { (myResponseJSON) in
            print("\n create history server response:")
            print("\(myResponseJSON) \n")
        })
    }
    
    @objc func sendBotMessageButtonPressed() {
        
        let inputModel = SendInteractiveMessageRequestModel(content: "Hi.........",
                                                            messageId: 63288,
                                                            metaData: ["key1":"value1"],
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
    
    @objc func sendFileMessageButtonnPressed() {
        
        let metadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE", "owner": "Mahyar"]
        
        let image = UIImage(named: "pic")
        if let data = UIImageJPEGRepresentation(image!, 1) {
            
            let inputModel = SendFileMessageRequestModel(fileName: "newPic",
                                                         imageName: "newPic",
                                                         xC: nil,
                                                         yC: nil,
                                                         hC: nil,
                                                         wC: nil,
                                                         threadId: 1101,
                                                         content: "empty message",
                                                         metaData: metadata,
                                                         repliedTo: nil,
                                                         fileToSend: nil,
                                                         imageToSend: data,
                                                         typeCode: nil,
                                                         uniqueId: nil)
            Chat.sharedInstance.sendFileMessage(sendFileMessageInput: inputModel, uniqueId: { (messageUniqueId) in
                print("message unique id is = \(messageUniqueId)")
            }, uploadProgress: { (prpgress) in
                print("upload progress is = \(prpgress)")
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
                                                            metaData:       metadata,
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


