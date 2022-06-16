//
//  MainView().swift
//  Gongbu
//
//  Created by Terry Koo on 2022/06/14.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct MainView2: View {
    @EnvironmentObject var data: DataViewModel
    var body: some View {
        NavigationView {
            NavigationLink (destination: MainListView(), label: {
                Text("Detail")
            })
        }
    }
    
}

struct MainView2Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
