//
//  DetailView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct DetailView: View {
    @State private var selectedTab = 1
    @EnvironmentObject var data: DataViewModel
    var roomId: String
    
    var body: some View {
        NavigationView{
            VStack {
                TabView(selection: $selectedTab){
                    DetailRankingView(roomId: roomId)
                        .tag(0)
                    DetailQRView(roomId: roomId)
                        .tag(1)
                    DetailInformationView(roomId: roomId)
                        .tag(2)
                }
                .frame(width: 340, height: 700)
                .tabViewStyle(PageTabViewStyle())
                .cornerRadius(15)
                .onAppear {
                      setupAppearance()
                }
            }
            .navigationBarHidden(true)
        }
        .navigationBarTitle(Text("Study"), displayMode: .inline)
    }
    ///page control (indicator)
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(red: 0.467, green: 0.696, blue: 0.821, alpha: 1.0)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
