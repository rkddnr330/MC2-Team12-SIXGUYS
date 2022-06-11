//
//  ToastView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/11.
//

import SwiftUI

struct ToastView: View {
    @State private var isShowingToast = false
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .onTapGesture {
                isShowingToast = true
            }
            .toast(isShowing: $isShowingToast)
    }
}

//struct ToastModifier: ViewModifier {
//    @Binding var isShowing: Bool
//    let duration: TimeInterval
//
//    func body(content: Content) -> some View {
//        ZStack {
//            content
//            if isShowing {
//                toast
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
//                            withAnimation {
//                                isShowing = false
//                            }
//                        }
//                    }
//            }
//        }
//    }
//    private var toast: some View {
//        VStack {
//            Spacer()
//            HStack {
//                Image(systemName: "heart.fill")
//                Text("Post saved!")
//                    .font(.footnote)
//                Spacer()
//            }
//            .frame(minWidth: 0, maxWidth: .infinity)
//            .padding()
//            .background(Color.white)
//            .cornerRadius(5)
//            .shadow(radius: 5)
//        }
//        .padding()
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
//                withAnimation {
//                    isShowing = false
//                }
//            }
//        }
//    }
//}
//extension View {
//    func toast(isShowing: Binding<Bool>, duration: TimeInterval = 3) -> some
//        View {
//        modifier(ToastModifier(isShowing: isShowing, duration: duration))
//    }
//}


struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView()
    }
}
