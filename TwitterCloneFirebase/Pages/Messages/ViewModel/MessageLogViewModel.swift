//
//  MessageLogViewModel.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 19.09.2022.
//

import Firebase

class MessageLogViewModel: ObservableObject {

    @Published var chatText = ""
    @Published var errorMessage = ""

    let chatUser: User?

    init(chatUser: User?) {
        self.chatUser = chatUser
    }

    func handleSend() {
        print(chatText)
        guard let fromId = Auth.auth().currentUser?.uid else { return }

        guard let toId = chatUser?.id else { return }

        let document = Firestore.firestore().collection("messages")
            .document(fromId)
            .collection(toId)
            .document()

        let messageData = ["fromId": fromId, "toId": toId, "text": self.chatText, "timestamp": Timestamp()] as [String : Any]

        document.setData(messageData) { error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }

            print("Successfully saved current user sending message")
            self.chatText = ""
        }

        let recipientMessageDocument = Firestore.firestore().collection("messages")
            .document(toId)
            .collection(fromId)
            .document()

        recipientMessageDocument.setData(messageData) { error in
            if let error = error {
                print(error)
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            }

            print("Recipient saved message as well")
        }
    }
}
