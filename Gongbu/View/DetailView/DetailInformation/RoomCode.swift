//
//  RoomCode.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct RoomCode: View {
    @State private var isShowingToast = false
    private let pasteboard = UIPasteboard.general
    
    @ObservedObject private var rankingModel = RankingModel()
    var roomId: String
    
    var body: some View {
        HStack {
            Text("방 코드")
                .font(.title)
                .bold()
                .foregroundColor(.black)
            Spacer()
            Button {
                pasteboard.string = roomId
                isShowingToast = true
            } label: {
                Text(roomId)
                    .font(.title)
                    .foregroundColor(.black)
                    .underline()
                    .frame(width: 130)
            }
            .toast(isShowing: $isShowingToast)
        }
        .padding()
        .frame(width: 320, height: 80)
        .background(Color(red: 0.969, green: 0.969, blue: 0.969))
        .cornerRadius(10)
    }
}
///room code 터치시 복사 됐다는 알림 표시
struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    let duration: TimeInterval
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
                toast
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            withAnimation {
                                isShowing = false
                            }
                        }
                    }
            }
        }
    }
    private var toast: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(Color("MainColor"))
                Text("Code Copied!")
                    .font(.footnote)
                    .foregroundColor(.black)
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 3)
        }
        .padding()
    }
}
extension View {
    func toast(isShowing: Binding<Bool>, duration: TimeInterval = 2) -> some
        View {
        modifier(ToastModifier(isShowing: isShowing, duration: duration))
    }
}


//struct RoomCode_Previews: PreviewProvider {
//    static var previews: some View {
//        RoomCode()
//    }
//}
