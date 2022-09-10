//
//  AuthViewModel.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 7.09.2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    // if have a user , this property have value , of not have a user this propety null
    @Published var isAuthUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    
    
    
    private let service = UserService()
    
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
     
    }
    
    func login(withEmail email: String , password: String){
        print("DEBUG: Login with is \(String(email)) ")
        
        Auth.auth().signIn(withEmail: email, password: password){result , error in
            if let error = error  {
                print("DEBUG: Failed to login with error \(error.localizedDescription) ")
                       } else {
                           print("DEBUG: Login succsess , user is \(self.userSession) ")
                       }
                   }
               }
           
    
    func register(withEmail email: String , password: String,fullname: String, username: String){
//        print("DEBUG: Register with is \(String(email)) ")
        
        Auth.auth().createUser(withEmail: email, password: password ){ result , error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription) ")
                return
            }
            
            guard let user = result?.user else {return}

            self.tempUserSession = user
            print("DEBUG: Register succsess , user is \(self.userSession) ")
            
            
            let data = ["email": email , "username:" : username.lowercased(), "fullanme:": fullname, "uid:": user.uid ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){ _ in
                    self.isAuthUser = true
                }
        }
    }
    
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return print("bla blabbla")}
        
        print("burda knk not blabla")
        ImageUploadService.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]){_ in
                    self.userSession = self.tempUserSession
                }
        }
    }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return}
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
}







// field validate with regex
extension String {
    
    enum RegexType {
        case none
        case mobileNumberWithItalianCode    // Example: "+39 3401234567"
        case email                          // Example: "foo@example.com"
        case minLetters    // Example: "Al"
        case minDigit(_ digits: Int)        // Example: "0612345"
        case onlyLetters                    // Example: "ABDEFGHILM"
        case onlyNumbers                    // Example: "132543136"
        case noSpecialChars                 // Example: "Malago'": OK - "Malagò": KO
        
        fileprivate var pattern: String {
            switch self {
            case .none:
                return ""
            case .mobileNumberWithItalianCode:
                return #"^(\+39 )\d{9,}$"#
            case .email:
                return #"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"#
            case .minLetters:
                return #"^[a-zA-Z0-9\s,-]{5,}"#
            case .minDigit(let digits):
                return #"^(\d{"# + "\(digits)" + #",}){1}$"#
            case .onlyLetters:
                return #"^[A-Za-z]+$"#
            case .onlyNumbers:
                return #"^[0-9]"#
            case .noSpecialChars:
                return #"^[A-Za-z0-9\s+\\\-\/?:().,']+$"#
            }
        }
    }
    

    func isValidWith(regexType: RegexType) -> Bool {
        
        switch regexType {
        case .none : return true
        default    : break
        }
        
        let pattern = regexType.pattern
        guard let gRegex = try? NSRegularExpression(pattern: pattern) else {
            return false
        }
        
        let range = NSRange(location: 0, length: self.utf16.count)
        
        if gRegex.firstMatch(in: self, options: [], range: range) != nil {
            return true
        }
        
        return false
    }
}
