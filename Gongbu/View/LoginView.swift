//
//  LoginView.swift
//  Gongbu
//
//  Created by Kyubo Shim on 2022/06/05.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @StateObject var loginData = LoginViewModel()
    var body: some View {
        VStack{
            Text("(대충 코끼리 로고 있는 배경사진)")
            
            SignInWithAppleButton { (request) in
                // requesting parameters from apple login
                loginData.nonce = randomNonceString()
                request.requestedScopes = [.email, .fullName]
                request.nonce = sha256(loginData.nonce)
            } onCompletion : {(result) in
                switch result {
                case .success(let user):
                    // do login with firebase
                    print("success")
                    guard let credential = user.credential as?
                            ASAuthorizationAppleIDCredential else {
                        print("error in firebase")
                        return
                    }
                    loginData.authenticate(credential: credential)
                case .failure(let error):
                    print("loginview failed..")
                    print(error.localizedDescription)
                }
            }
            .signInWithAppleButtonStyle(.white)
            .frame(height: 55)
            .clipShape(Capsule())
            .padding(.horizontal, 30)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
