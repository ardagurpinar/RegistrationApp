//
//  UserInfo.swift
//  RegistrationApp
//
//  Created by Arda Gürpınar on 6.12.2021.
//

import Foundation
import Firebase

let db = Firestore.firestore()

struct UserInfo {
    let firstName: String?
    let lastName: String?
    let email: String?
    let password: String?
    
    
    init(firstName: String? = nil,
         lastName: String? = nil,
         email: String? = nil,
         password: String? = nil ) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
    // Method for storing user's first name and last name under their email address using Firestore Database
    
    func storeUser(email: String, fName: String, lName: String) {
        
        db.collection("users").document(email).setData([
            "firstname": fName,
            "lastname": lName
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                print("\(fName) \(lName)")
            }
        }
        
    }
    
    // Method for accessing user's data linked to their email address
    
    func getUser(email: String) {
        
        let docRef = db.collection("users").document(email)
        
        docRef.getDocument { documentname, error in
            if let documentname = documentname {
                let fullName = "\(documentname["firstname"]!) \(documentname["lastname"]!)"
                print("User name associated with this email: \(fullName)")                
            } else {
                print("Document does not exist")
            }
        }
        
    }
    
}


