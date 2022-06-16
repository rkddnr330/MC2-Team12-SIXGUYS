////
////  DetailView.swift
////  Gongbu
////
////  Created by Terry Koo on 2022/06/14.
////
//
//import SwiftUI
//import Firebase
//import FirebaseFirestoreSwift
//
//struct DetailView: View {
//    @EnvironmentObject var data: DataViewModel
//    let db = Firestore.firestore()
//
//    var body: some View {
//        //Text((data.user!.fullName!))
////        Text(data.study?[0].title! ?? "없음")
////        Text(data.study?.title! ?? "없음")
//
//
//        Button(action: {
//            db.collection("cities").document("LA").setData([
//                "name": "Los Angeles",
//                "state": "CA",
//                "country": "USA"
//            ]) { err in
//                if let err = err {
//                    print("Error writing document: \(err)")
//                } else {
//                    print("Document successfully written!")
//                }
//            }
//
//
//
//            let docData: [String: Any] = [
//                "stringExample": "Hello world!",
//                "booleanExample": true,
//                "numberExample": 3.14159265,
//                "dateExample": Timestamp(date: Date()),
//                "arrayExample": [5, true, "hello"],
//                "nullExample": NSNull(),
//                "objectExample": [
//                    "a": 5,
//                    "b": [
//                        "nested": "foo"
//                    ]
//                ]
//            ]
//            db.collection("data").document("one").setData(docData) { err in
//                if let err = err {
//                    print("Error writing document: \(err)")
//                } else {
//                    print("Document successfully written!")
//                }
//            }
//
//
//
//        }, label: {
//            Text("Add")
//        })
//    }
//}
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
