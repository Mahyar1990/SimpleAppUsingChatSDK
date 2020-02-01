//
//  File.swift
//  SimpleAppUsingChat
//
//  Created by Mahyar Zhiani on 7/28/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import UIKit
import FanapPodChatSDK
import SwiftyJSON


extension MyViewController {
    
    func setupView() {
        
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        
        navigationItem.title = "Test Chat"
        
        myLogCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        myLogCollectionView.delegate = self
        myLogCollectionView.dataSource = self
        
        setupViewItems()
        setupLayouts()
    }
    
    func setupViewItems() {
        getUserInfoButton.setTitle("Get UserInfo...", for: .normal)
        getUserInfoButton.addTarget(self, action: #selector(getUserInfoButtonPressed), for: .touchUpInside)
        
        
        getThreadsButton.setTitle("Get Threads...", for: .normal)
        getThreadsButton.addTarget(self, action: #selector(getThreadsButtonPressed), for: .touchUpInside)
        
        searchThreadButton.setTitle("Search Thread...", for: .normal)
        searchThreadButton.addTarget(self, action: #selector(searchThreadButtonPressed), for: .touchUpInside)
        
        createThreadButton.setTitle("Create Thread...", for: .normal)
        createThreadButton.addTarget(self, action: #selector(createThreadButtonPressed), for: .touchUpInside)
        
        createThreadWithMessageButton.setTitle("CreateThreadWithMsg...", for: .normal)
        createThreadWithMessageButton.addTarget(self, action: #selector(createThreadWithMessageButtonPressed), for: .touchUpInside)
        
        createThreadWithFileMessageButton.setTitle("CreateThreadWithFileMsg...", for: .normal)
        createThreadWithFileMessageButton.addTarget(self, action: #selector(createThreadWithFileMessageButtonPressed), for: .touchUpInside)
        
        updateThreadInfoButton.setTitle("Update ThreadInfo...", for: .normal)
        updateThreadInfoButton.addTarget(self, action: #selector(updateThreadInfoButtonPressed), for: .touchUpInside)
        
        leaveThreadButton.setTitle("Leave Thread...", for: .normal)
        leaveThreadButton.addTarget(self, action: #selector(leaveThreadButtonPressed), for: .touchUpInside)
        
        spamThreadButton.setTitle("Spam Pv Thread...", for: .normal)
        spamThreadButton.addTarget(self, action: #selector(spamThreadButtonPressed), for: .touchUpInside)
        
        muteThreadButton.setTitle("Mute Thread...", for: .normal)
        muteThreadButton.addTarget(self, action: #selector(muteThreadButtonPressed), for: .touchUpInside)
        
        unmuteThreadButton.setTitle("Unmute Thread...", for: .normal)
        unmuteThreadButton.addTarget(self, action: #selector(unmuteThreadButtonPressed), for: .touchUpInside)
        
        setAuditor.setTitle("set Auditor...", for: .normal)
        setAuditor.addTarget(self, action: #selector(setAuditorButtonSelected), for: .touchUpInside)
        
        removeAuditor.setTitle("Remove Auditor...", for: .normal)
        removeAuditor.addTarget(self, action: #selector(removeAuditorButtonSelected), for: .touchUpInside)
        
        pinThread.setTitle("Pin Thread...", for: .normal)
        pinThread.addTarget(self, action: #selector(pinThreadButtonPressed), for: .touchUpInside)
        
        unpinThread.setTitle("Unpin Thread...", for: .normal)
        unpinThread.addTarget(self, action: #selector(unpinThreadButtonPressed), for: .touchUpInside)
        
        
        getThreadParticipantsButton.setTitle("Get thread Participants...", for: .normal)
        getThreadParticipantsButton.addTarget(self, action: #selector(getThreadParticipantsButtonPressed), for: .touchUpInside)
        
        addParticipantButton.setTitle("Add Participant...", for: .normal)
        addParticipantButton.addTarget(self, action: #selector(addParticipantsButtonPressed), for: .touchUpInside)
        
        removeParticipantButton.setTitle("Remove Participant...", for: .normal)
        removeParticipantButton.addTarget(self, action: #selector(removeParticipantsButtonPressed), for: .touchUpInside)
        
        getCurrentUserRolesButton.setTitle("GetCurrentUserRoles...", for: .normal)
        getCurrentUserRolesButton.addTarget(self, action: #selector(getCurrentUserRolesButtonPressed), for: .touchUpInside)
        
        
        getHistoryButton.setTitle("Get History...", for: .normal)
        getHistoryButton.addTarget(self, action: #selector(getHistoryButtonPressed), for: .touchUpInside)
        
        searchHistoryButton.setTitle("Search History...", for: .normal)
        searchHistoryButton.addTarget(self, action: #selector(searchHistoryButtonPressed), for: .touchUpInside)
        
        clearHistoryButton.setTitle("Clear History...", for: .normal)
        clearHistoryButton.addTarget(self, action: #selector(clearHistoryButtonPressed), for: .touchUpInside)
        
        deleteMessageButton.setTitle("Delete Message...", for: .normal)
        deleteMessageButton.addTarget(self, action: #selector(deleteMultipleMessages), for: .touchUpInside)
        
        getMentionListButton.setTitle("Get MentionList...", for: .normal)
        getMentionListButton.addTarget(self, action: #selector(getMentionListButtonPressed), for: .touchUpInside)
        
        
        
        sendTextMessageButton.setTitle("send text message...", for: .normal)
        sendTextMessageButton.addTarget(self, action: #selector(sendTextMessageButtonPressed), for: .touchUpInside)
        
        editTextMessageButton.setTitle("send edit message...", for: .normal)
        editTextMessageButton.addTarget(self, action: #selector(editTextMessageButtonPressed), for: .touchUpInside)
        
        replyTextMessageButton.setTitle("send reply message...", for: .normal)
        replyTextMessageButton.addTarget(self, action: #selector(replyTextMessageButtonPressed), for: .touchUpInside)
        
        forwardTextMessageButton.setTitle("send forward message...", for: .normal)
        forwardTextMessageButton.addTarget(self, action: #selector(forwardMessageButtonPressed), for: .touchUpInside)
        
        
        
        
        sendFileMessageButton.setTitle("Send File Message...", for: .normal)
        sendFileMessageButton.addTarget(self, action: #selector(sendUploadFileMessageButtonPressed), for: .touchUpInside)
        
        sendImageMessageButton.setTitle("Send Image Message...", for: .normal)
        sendImageMessageButton.addTarget(self, action: #selector(uploadImageButtonPressed), for: .touchUpInside)
        
        replyFileMessageButton.setTitle("Reply File Message...", for: .normal)
        replyFileMessageButton.addTarget(self, action: #selector(replyFileMessageButtonnPressed), for: .touchUpInside)
        
        sendBotMessage.setTitle("send Bot Message...", for: .normal)
        sendBotMessage.addTarget(self, action: #selector(sendBotMessageButtonPressed), for: .touchUpInside)
        
        getImage.setTitle("Get Image...", for: .normal)
        getImage.addTarget(self, action: #selector(getImgeButtonPressed), for: .touchUpInside)
        
        getFile.setTitle("Get File...", for: .normal)
        getFile.addTarget(self, action: #selector(getFileButtonPressed), for: .touchUpInside)
        
        
        
        
        getContactsButton.setTitle("Get Contacts...", for: .normal)
        getContactsButton.addTarget(self, action: #selector(getContactsButtonPressed), for: .touchUpInside)
        
        searchContactButton.setTitle("Search Contacr...", for: .normal)
        searchContactButton.addTarget(self, action: #selector(searchContactsButtonPressed), for: .touchUpInside)
        
        addContactButton.setTitle("Add Contact...", for: .normal)
        addContactButton.addTarget(self, action: #selector(addContactButtonPressed), for: .touchUpInside)
        
        updateContactButton.setTitle("Update Contact...", for: .normal)
        updateContactButton.addTarget(self, action: #selector(updateContactButtonPressed), for: .touchUpInside)
        
        removeContactButton.setTitle("Remove Contact...", for: .normal)
        removeContactButton.addTarget(self, action: #selector(removeContactButtonPressed), for: .touchUpInside)
        
        syncContactsButton.setTitle("Sync Contacts...", for: .normal)
        syncContactsButton.addTarget(self, action: #selector(syncContactsButtonPressed), for: .touchUpInside)
        
        blockButton.setTitle("Block...", for: .normal)
        blockButton.addTarget(self, action: #selector(blockContactButtonPressed), for: .touchUpInside)
        
        getBlockedButton.setTitle("Get Block List...", for: .normal)
        getBlockedButton.addTarget(self, action: #selector(getBlockedContactsButtonPressed), for: .touchUpInside)
        
        unblockButton.setTitle("Unblock...", for: .normal)
        unblockButton.addTarget(self, action: #selector(unblockContactButtonPressed), for: .touchUpInside)
        
        getNotSeenDurationButton.setTitle("NotSeenDuration...", for: .normal)
        getNotSeenDurationButton.addTarget(self, action: #selector(notSeenDurationButtonPressed), for: .touchUpInside)
        
        
        messageDeliverList.setTitle("Message Deliver List...", for: .normal)
        messageDeliverList.addTarget(self, action: #selector(messageDeliverListButtonPressed), for: .touchUpInside)
        
        messageSeenList.setTitle("Message Seen List...", for: .normal)
        messageSeenList.addTarget(self, action: #selector(messageSeenListButtonPressed), for: .touchUpInside)
        
        
        
        
        mapReverse.setTitle("Map Reverse...", for: .normal)
        mapReverse.addTarget(self, action: #selector(mapReverseButtonPressed), for: .touchUpInside)
        
        mapSearch.setTitle("Map Search...", for: .normal)
        mapSearch.addTarget(self, action: #selector(mapSearchButtonPressed), for: .touchUpInside)
        
        mapRouting.setTitle("Map Routing...", for: .normal)
        mapRouting.addTarget(self, action: #selector(mapRoutingButtonPressed), for: .touchUpInside)
        
        mapStaticImage.setTitle("Map Static Image...", for: .normal)
        mapStaticImage.addTarget(self, action: #selector(mapStaticImageButtonPressed), for: .touchUpInside)
        
        sendLocatinoMessage.setTitle("send location Message...", for: .normal)
        sendLocatinoMessage.addTarget(self, action: #selector(sendLocationMessageButtonPressed), for: .touchUpInside)
        
        
        
        
        deleteCache.setTitle("delete Cache", for: .normal)
        deleteCache.addTarget(self, action: #selector(deleteCacheButtonPressed), for: .touchUpInside)
        
    }
    

    func setupLayouts() {
        view.addSubview(getUserInfoButton)
        
        view.addSubview(getThreadsButton)
        view.addSubview(searchThreadButton)
        view.addSubview(createThreadButton)
        view.addSubview(updateThreadInfoButton)
        view.addSubview(createThreadWithMessageButton)
        view.addSubview(createThreadWithFileMessageButton)
        view.addSubview(leaveThreadButton)
        view.addSubview(spamThreadButton)
        view.addSubview(muteThreadButton)
        view.addSubview(unmuteThreadButton)
        view.addSubview(setAuditor)
        view.addSubview(removeAuditor)
        view.addSubview(pinThread)
        view.addSubview(unpinThread)
        view.addSubview(addParticipantButton)
        view.addSubview(removeParticipantButton)
        view.addSubview(getThreadParticipantsButton)
        view.addSubview(getCurrentUserRolesButton)
        
        view.addSubview(getHistoryButton)
        view.addSubview(searchHistoryButton)
        view.addSubview(clearHistoryButton)
        view.addSubview(deleteMessageButton)
        view.addSubview(getMentionListButton)
        
        view.addSubview(inputTextFieldToSendMessage)
        view.addSubview(sendTextMessageButton)
        view.addSubview(editTextMessageButton)
        view.addSubview(replyTextMessageButton)
        view.addSubview(forwardTextMessageButton)
        
        view.addSubview(getContactsButton)
        view.addSubview(searchContactButton)
        view.addSubview(addContactButton)
        view.addSubview(updateContactButton)
        view.addSubview(removeContactButton)
        view.addSubview(syncContactsButton)
        view.addSubview(blockButton)
        view.addSubview(getBlockedButton)
        view.addSubview(unblockButton)
        view.addSubview(getNotSeenDurationButton)
        
        view.addSubview(getImage)
        view.addSubview(getFile)
        view.addSubview(sendFileMessageButton)
        view.addSubview(sendImageMessageButton)
        view.addSubview(replyFileMessageButton)
        view.addSubview(sendBotMessage)
        
        view.addSubview(messageDeliverList)
        view.addSubview(messageSeenList)
        
        view.addSubview(mapReverse)
        view.addSubview(mapSearch)
        view.addSubview(mapRouting)
        view.addSubview(mapStaticImage)
        view.addSubview(sendLocatinoMessage)
        
        view.addSubview(deleteCache)
        
        view.addSubview(logView)
        logView.addSubview(myLogCollectionView)
        
        // left
        getUserInfoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        getUserInfoButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        getUserInfoButton.widthAnchor.constraint(equalToConstant: ((view.frame.width - 24) / 2)).isActive = true
        getUserInfoButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        
        // left
        getThreadsButton.topAnchor.constraint(equalTo: getUserInfoButton.bottomAnchor, constant: 12).isActive = true
        getThreadsButton.leftAnchor.constraint(equalTo: getUserInfoButton.leftAnchor).isActive = true
        getThreadsButton.rightAnchor.constraint(equalTo: getUserInfoButton.rightAnchor).isActive = true
        getThreadsButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        searchThreadButton.topAnchor.constraint(equalTo: getThreadsButton.topAnchor).isActive = true
        searchThreadButton.leftAnchor.constraint(equalTo: getUserInfoButton.rightAnchor, constant: 8).isActive = true
        searchThreadButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        searchThreadButton.bottomAnchor.constraint(equalTo: getThreadsButton.bottomAnchor).isActive = true
        // left
        createThreadButton.topAnchor.constraint(equalTo: getThreadsButton.bottomAnchor, constant: 4).isActive = true
        createThreadButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        createThreadButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        createThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        updateThreadInfoButton.topAnchor.constraint(equalTo: createThreadButton.topAnchor).isActive = true
        updateThreadInfoButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        updateThreadInfoButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        updateThreadInfoButton.bottomAnchor.constraint(equalTo: createThreadButton.bottomAnchor).isActive = true
        // left
        createThreadWithMessageButton.topAnchor.constraint(equalTo: createThreadButton.bottomAnchor, constant: 4).isActive = true
        createThreadWithMessageButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        createThreadWithMessageButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        createThreadWithMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        createThreadWithFileMessageButton.topAnchor.constraint(equalTo: createThreadWithMessageButton.topAnchor).isActive = true
        createThreadWithFileMessageButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        createThreadWithFileMessageButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        createThreadWithFileMessageButton.bottomAnchor.constraint(equalTo: createThreadWithMessageButton.bottomAnchor).isActive = true
        // left
        leaveThreadButton.topAnchor.constraint(equalTo: createThreadWithMessageButton.bottomAnchor, constant: 4).isActive = true
        leaveThreadButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        leaveThreadButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        leaveThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        spamThreadButton.topAnchor.constraint(equalTo: leaveThreadButton.topAnchor).isActive = true
        spamThreadButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        spamThreadButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        spamThreadButton.bottomAnchor.constraint(equalTo: leaveThreadButton.bottomAnchor).isActive = true
        // left
        muteThreadButton.topAnchor.constraint(equalTo: leaveThreadButton.bottomAnchor, constant: 4).isActive = true
        muteThreadButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        muteThreadButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        muteThreadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        unmuteThreadButton.topAnchor.constraint(equalTo: muteThreadButton.topAnchor).isActive = true
        unmuteThreadButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        unmuteThreadButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        unmuteThreadButton.bottomAnchor.constraint(equalTo: muteThreadButton.bottomAnchor).isActive = true
        // left
        setAuditor.topAnchor.constraint(equalTo: muteThreadButton.bottomAnchor, constant: 4).isActive = true
        setAuditor.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        setAuditor.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        setAuditor.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        removeAuditor.topAnchor.constraint(equalTo: setAuditor.topAnchor).isActive = true
        removeAuditor.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        removeAuditor.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        removeAuditor.bottomAnchor.constraint(equalTo: setAuditor.bottomAnchor).isActive = true
        // left
        pinThread.topAnchor.constraint(equalTo: setAuditor.bottomAnchor, constant: 4).isActive = true
        pinThread.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        pinThread.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        pinThread.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        unpinThread.topAnchor.constraint(equalTo: pinThread.topAnchor).isActive = true
        unpinThread.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        unpinThread.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        unpinThread.bottomAnchor.constraint(equalTo: pinThread.bottomAnchor).isActive = true
        // left
        addParticipantButton.topAnchor.constraint(equalTo: pinThread.bottomAnchor, constant: 4).isActive = true
        addParticipantButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        addParticipantButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        addParticipantButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        removeParticipantButton.topAnchor.constraint(equalTo: addParticipantButton.topAnchor).isActive = true
        removeParticipantButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        removeParticipantButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        removeParticipantButton.bottomAnchor.constraint(equalTo: addParticipantButton.bottomAnchor).isActive = true
        // left
        getThreadParticipantsButton.topAnchor.constraint(equalTo: addParticipantButton.bottomAnchor, constant: 4).isActive = true
        getThreadParticipantsButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getThreadParticipantsButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getThreadParticipantsButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        getCurrentUserRolesButton.topAnchor.constraint(equalTo: getThreadParticipantsButton.topAnchor).isActive = true
        getCurrentUserRolesButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        getCurrentUserRolesButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        getCurrentUserRolesButton.bottomAnchor.constraint(equalTo: getThreadParticipantsButton.bottomAnchor).isActive = true
        
        
        // left
        getHistoryButton.topAnchor.constraint(equalTo: getThreadParticipantsButton.bottomAnchor, constant: 12).isActive = true
        getHistoryButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getHistoryButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getHistoryButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        searchHistoryButton.topAnchor.constraint(equalTo: getHistoryButton.topAnchor).isActive = true
        searchHistoryButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        searchHistoryButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        searchHistoryButton.bottomAnchor.constraint(equalTo: getHistoryButton.bottomAnchor).isActive = true
        // left
        clearHistoryButton.topAnchor.constraint(equalTo: getHistoryButton.bottomAnchor, constant: 4).isActive = true
        clearHistoryButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        clearHistoryButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        clearHistoryButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        deleteMessageButton.topAnchor.constraint(equalTo: clearHistoryButton.topAnchor).isActive = true
        deleteMessageButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        deleteMessageButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        deleteMessageButton.bottomAnchor.constraint(equalTo: clearHistoryButton.bottomAnchor).isActive = true
        // left
        getMentionListButton.topAnchor.constraint(equalTo: clearHistoryButton.bottomAnchor, constant: 4).isActive = true
        getMentionListButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getMentionListButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getMentionListButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        inputTextFieldToSendMessage.topAnchor.constraint(equalTo: getMentionListButton.bottomAnchor, constant: 12).isActive = true
        inputTextFieldToSendMessage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        inputTextFieldToSendMessage.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        inputTextFieldToSendMessage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        // left
        sendTextMessageButton.topAnchor.constraint(equalTo: inputTextFieldToSendMessage.bottomAnchor, constant: 4).isActive = true
        sendTextMessageButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        sendTextMessageButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        sendTextMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        editTextMessageButton.topAnchor.constraint(equalTo: sendTextMessageButton.topAnchor).isActive = true
        editTextMessageButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        editTextMessageButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        editTextMessageButton.bottomAnchor.constraint(equalTo: sendTextMessageButton.bottomAnchor).isActive = true
        // left
        replyTextMessageButton.topAnchor.constraint(equalTo: sendTextMessageButton.bottomAnchor, constant: 4).isActive = true
        replyTextMessageButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        replyTextMessageButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        replyTextMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        forwardTextMessageButton.topAnchor.constraint(equalTo: replyTextMessageButton.topAnchor).isActive = true
        forwardTextMessageButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        forwardTextMessageButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        forwardTextMessageButton.bottomAnchor.constraint(equalTo: replyTextMessageButton.bottomAnchor).isActive = true
        
        
        
        
        // left
        sendFileMessageButton.topAnchor.constraint(equalTo: replyTextMessageButton.bottomAnchor, constant: 4).isActive = true
        sendFileMessageButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        sendFileMessageButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        sendFileMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        sendImageMessageButton.topAnchor.constraint(equalTo: sendFileMessageButton.topAnchor).isActive = true
        sendImageMessageButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        sendImageMessageButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        sendImageMessageButton.bottomAnchor.constraint(equalTo: sendFileMessageButton.bottomAnchor).isActive = true
        // left
        replyFileMessageButton.topAnchor.constraint(equalTo: sendFileMessageButton.bottomAnchor, constant: 4).isActive = true
        replyFileMessageButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        replyFileMessageButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        replyFileMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        sendBotMessage.topAnchor.constraint(equalTo: replyFileMessageButton.topAnchor).isActive = true
        sendBotMessage.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        sendBotMessage.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        sendBotMessage.bottomAnchor.constraint(equalTo: replyFileMessageButton.bottomAnchor).isActive = true
        // left
        getImage.topAnchor.constraint(equalTo: replyFileMessageButton.bottomAnchor, constant: 4).isActive = true
        getImage.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getImage.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        getFile.topAnchor.constraint(equalTo: getImage.topAnchor).isActive = true
        getFile.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        getFile.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        getFile.bottomAnchor.constraint(equalTo: getImage.bottomAnchor).isActive = true
        
        
        
        
        // left
        getContactsButton.topAnchor.constraint(equalTo: getImage.bottomAnchor, constant: 12).isActive = true
        getContactsButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        getContactsButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        getContactsButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        searchContactButton.topAnchor.constraint(equalTo: getContactsButton.topAnchor).isActive = true
        searchContactButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        searchContactButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        searchContactButton.bottomAnchor.constraint(equalTo: getContactsButton.bottomAnchor).isActive = true
        // left
        addContactButton.topAnchor.constraint(equalTo: getContactsButton.bottomAnchor, constant: 4).isActive = true
        addContactButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        addContactButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        addContactButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        updateContactButton.topAnchor.constraint(equalTo: addContactButton.topAnchor).isActive = true
        updateContactButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        updateContactButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        updateContactButton.bottomAnchor.constraint(equalTo: addContactButton.bottomAnchor).isActive = true
        // left
        removeContactButton.topAnchor.constraint(equalTo: addContactButton.bottomAnchor, constant: 4).isActive = true
        removeContactButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        removeContactButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        removeContactButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        syncContactsButton.topAnchor.constraint(equalTo: removeContactButton.topAnchor).isActive = true
        syncContactsButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        syncContactsButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        syncContactsButton.bottomAnchor.constraint(equalTo: removeContactButton.bottomAnchor).isActive = true
        // left
        blockButton.topAnchor.constraint(equalTo: removeContactButton.bottomAnchor, constant: 4).isActive = true
        blockButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        blockButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        blockButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        getBlockedButton.topAnchor.constraint(equalTo: blockButton.topAnchor).isActive = true
        getBlockedButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        getBlockedButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        getBlockedButton.bottomAnchor.constraint(equalTo: blockButton.bottomAnchor).isActive = true
        // left
        unblockButton.topAnchor.constraint(equalTo: blockButton.bottomAnchor, constant: 4).isActive = true
        unblockButton.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        unblockButton.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        unblockButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        getNotSeenDurationButton.topAnchor.constraint(equalTo: unblockButton.topAnchor).isActive = true
        getNotSeenDurationButton.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        getNotSeenDurationButton.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        getNotSeenDurationButton.bottomAnchor.constraint(equalTo: unblockButton.bottomAnchor).isActive = true
        
        
        // left
        messageDeliverList.topAnchor.constraint(equalTo: unblockButton.bottomAnchor, constant: 12).isActive = true
        messageDeliverList.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        messageDeliverList.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        messageDeliverList.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        messageSeenList.topAnchor.constraint(equalTo: messageDeliverList.topAnchor).isActive = true
        messageSeenList.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        messageSeenList.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        messageSeenList.bottomAnchor.constraint(equalTo: messageDeliverList.bottomAnchor).isActive = true
        
        
        
        
        // left
        mapReverse.topAnchor.constraint(equalTo: messageDeliverList.bottomAnchor, constant: 12).isActive = true
        mapReverse.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        mapReverse.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        mapReverse.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        mapSearch.topAnchor.constraint(equalTo: mapReverse.topAnchor).isActive = true
        mapSearch.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        mapSearch.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        mapSearch.bottomAnchor.constraint(equalTo: mapReverse.bottomAnchor).isActive = true
        // left
        mapRouting.topAnchor.constraint(equalTo: mapReverse.bottomAnchor, constant: 4).isActive = true
        mapRouting.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        mapRouting.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        mapRouting.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // right
        mapStaticImage.topAnchor.constraint(equalTo: mapRouting.topAnchor).isActive = true
        mapStaticImage.leftAnchor.constraint(equalTo: searchThreadButton.leftAnchor).isActive = true
        mapStaticImage.rightAnchor.constraint(equalTo: searchThreadButton.rightAnchor).isActive = true
        mapStaticImage.bottomAnchor.constraint(equalTo: mapRouting.bottomAnchor).isActive = true
        // left
        sendLocatinoMessage.topAnchor.constraint(equalTo: mapRouting.bottomAnchor, constant: 4).isActive = true
        sendLocatinoMessage.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        sendLocatinoMessage.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        sendLocatinoMessage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        // left
        deleteCache.topAnchor.constraint(equalTo: sendLocatinoMessage.bottomAnchor, constant: 12).isActive = true
        deleteCache.leftAnchor.constraint(equalTo: getThreadsButton.leftAnchor).isActive = true
        deleteCache.rightAnchor.constraint(equalTo: getThreadsButton.rightAnchor).isActive = true
        deleteCache.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        
        logView.topAnchor.constraint(equalTo: deleteCache.bottomAnchor, constant: 8).isActive = true
        logView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        logView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        logView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        myLogCollectionView.topAnchor.constraint(equalTo: logView.topAnchor, constant: 8).isActive = true
        myLogCollectionView.leftAnchor.constraint(equalTo: logView.leftAnchor, constant: 8).isActive = true
        myLogCollectionView.rightAnchor.constraint(equalTo: logView.rightAnchor, constant: -8).isActive = true
        myLogCollectionView.bottomAnchor.constraint(equalTo: logView.bottomAnchor, constant: -8).isActive = true
        
    }
    
    
}

