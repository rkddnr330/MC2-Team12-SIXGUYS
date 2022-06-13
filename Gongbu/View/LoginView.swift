import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @StateObject var loginData = LoginViewModel()
    var body: some View {
        ZStack{
            Image("loginView")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                
                SignInWithAppleButton { (request) in
                    // 파라미터 요청
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
            .padding(.bottom, 50)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
