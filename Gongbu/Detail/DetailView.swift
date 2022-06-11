//
//  DetailView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct DetailView: View {
    @State private var selectedTab = 1
    
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
//                .background(Color.gray)
                .cornerRadius(15)
                .onAppear {
                      setupAppearance()
                }
            }
            ///NavigationLink로 넘어와서 생기는 윗 공간 없애려고
            .navigationBarHidden(true)
            
//            이거 별 상관없는 코드 같으니, 나중에 확인하고 지우기
//            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarTitle(Text("영어 회화 스터디"), displayMode: .inline)
    }
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
