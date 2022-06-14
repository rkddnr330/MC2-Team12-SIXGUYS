//
//  DataTestVIew.swift
//  Gongbu
//
//  Created by Terry Koo on 2022/06/14.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct DataTestVIew: View {
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    
    struct Tmodel: Codable {
        var A: String?
        var B: String?
    
        enum CodingKeys: String, CodingKey {
            case A
            case B
        }
    }
    
    var model: Tmodel = Tmodel()
    
    init(){
        let docRef = db.collection("Test").document("Doc")

        docRef.getDocument(as: Tmodel.self) { result in
            switch result {
                case .success(let model):
                    // 성공했을 때
                    print("Tmodel: \(model)")
                case .failure(let error):
                    // 실패했을 때
                    print("Error decoding city: \(error)")
                }
        }
        
        print("###############################")
        
        db.collection("Test").document("Doc")
            .addSnapshotListener { documentSnapshot, error in
              guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
              }
              guard let data = document.data() else {
                print("Document data was empty.")
                return
              }
              print("Current data: \(data)")
            }

        
        
        
        
        print("-------------------------------")
        db.collection("Room").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if document.documentID == "A6msZhgAxzUua8RvNb8G" {
//                        let participant:[Any] = document["Participant"] as! [Any]
//                        print("\(document.documentID) => \(participant)")
                        print(type(of: document["Participant"]!))
                        (document["Participant"] as! [Any]).map({print(($0 as? Dictionary<String,String>))})
                }
                    
                  
                }
            }
        }
    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DataTestVIew_Previews: PreviewProvider {
    static var previews: some View {
        DataTestVIew()
    }
}
