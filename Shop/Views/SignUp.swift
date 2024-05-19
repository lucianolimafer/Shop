//
//  SignUp.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 18/05/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct SignUp: View {
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""
    @State private var errorMessage: String?
    
    @State private var isLoading = false
    @State private var isSigned = false
    
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40, content: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Cadastrar")
                        .font(.title)
                    Text("Preencha seus dados parar criar sua conta e continuar comprando.")
                        .font(.callout)
                }
                
                // MARK: Fields
                VStack(spacing: 15) {
                    TextField("Nome", text: $userName)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.5)
                        }
                    
                    TextField("Endereço do e-mail", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.5)
                        }
                    
                    
                    
                    SecureField("Criar uma Senha", text: $password)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.5)
                        }
                        .padding(.top)
                    
                    
                    SecureField("Confirmar Senha", text: $passwordConfirmation)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.5)
                        }
                }
                // MARK: error info
                if let errorMessage = errorMessage {
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(.red)
                            .font(.subheadline)
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
                Spacer()
                
                // MARK: Button SIGNUP
                VStack(spacing: 15, content: {
                    Button {
                       
                        if allFieldsHasValues() {
                            isLoading.toggle()
                            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                                isLoading.toggle()
                                
                                if error != nil {
                                    print(error?.localizedDescription ?? "")
                                    withAnimation {
                                        isLoading.toggle()
                                    }
                                } else {
                                    // MARK: write user into FIRESTORE DB
                                    let db = Firestore.firestore()
                                    let data: [String: Any] = [
                                        "User Name": userName,
                                        "Email": email
                                    ]
                                    
                                    UserDefaults.standard.setValue(result?.user.uid, forKey: "UID")
                                    UserDefaults.standard.setValue(userName, forKey: "NAME")
                                    UserDefaults.standard.setValue(email, forKey: "EMAIL")
                                    
                                    db.collection("USERS").addDocument(data: data)
                                    isLoading.toggle()
                                    isSigned = true
                                }
                            }
                        } else {
                            validatePassword()
                        }
                    } label: {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("Cadastrar")
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.red)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .navigationDestination(isPresented: $isSigned) {
                        ContentView()
                    }
                    
                    NavigationLink {
                        SignIn()
                    } label: {
                        Text("Já possui uma conta? **Entrar**")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(.white)
                })
            })
            .padding()
            .preferredColorScheme(.dark)
        }
        .navigationBarHidden(true)
    }
    
    private func validatePassword() {
        if !isValidEmail(email) {
            errorMessage = "Por favor, insira um e-mail válido."
        } else if userName.isEmpty {
            errorMessage = "Por favor, insira um nome."
        } else if userName.count < 2 {
            errorMessage = "Por favor, insira um nome."
        } else if password.isEmpty || passwordConfirmation.isEmpty {
            errorMessage = "Senha não pode estar vazia."
        } else if password.count < 8 {
            errorMessage = "A senha deve ter pelo menos 8 caracteres."
        } else if password != passwordConfirmation {
            errorMessage = "As senhas não correspondem."
        } else {
            errorMessage = nil
            // Continue com o processo de registro
            print("Senhas válidas. Prosseguir com o registro.")
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    private func allFieldsHasValues() -> Bool {
        return !userName.isEmpty && !email.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty
    }

}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
