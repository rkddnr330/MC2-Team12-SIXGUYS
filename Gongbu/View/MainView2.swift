//
//  MainView().swift
//  Gongbu
//
//  Created by Terry Koo on 2022/06/14.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct MainView: View {
    @EnvironmentObject var data: ViewData
    var body: some View {
        NavigationView {
            NavigationLink (destination: DetailView(), label: {
                Text("Detail")
            })
        }
    }
    
}

struct MainViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
