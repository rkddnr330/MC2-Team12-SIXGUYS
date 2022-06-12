//
//  DetailView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct DetailView: View {
    @State private var selectedTab = 1
    @State private var studyName = "영어 회화 스터디"
    
    var body: some View {
        NavigationView{
            VStack {
                ///우리가 얘기한 Carousel : TabView의 Style 중 하나 (PageTabViewStyle)
                TabView(selection: $selectedTab){
                    DetailRankingView()
                        .tag(0)
                    DetailNFCView()
                        .tag(1)
                    DetailInformationView()
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
        .navigationBarTitle(Text(studyName), displayMode: .inline)
    }
    ///page control (indicator)
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(red: 0.467, green: 0.696, blue: 0.821, alpha: 1.0)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
