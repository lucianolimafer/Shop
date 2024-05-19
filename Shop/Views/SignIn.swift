//
//  SignIn.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 18/05/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                    Text("Entrar")
                        .font(.title)
                    Text("Entre com o endereço do seu e-mail para continuar na comprando.")
                        .font(.callout)
                }
                
                // MARK: Fields
                VStack(spacing: 15) {
                    TextField("Endereço do e-mail", text: $email)
                        .keyboardType(.emailAddress)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.5)
                    }
                    
                    SecureField("Senha", text: $password)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.5)
                        }
                }
                
                Spacer()
                
                // MARK: Login Button
                VStack(spacing: 15, content: {
                    Button {
                        isLoading = true
                        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                            if error != nil {
                                print(error?.localizedDescription ?? "")
                                withAnimation {
                                    isLoading.toggle()
                                }
                            } else {
                                isSigned = true
                                Firestore.firestore()
                                    .collection("USERS")
                                    .document(result?.user.uid ?? "")
                                    .getDocument { (document, error) in
                                        
                                    if let document = document, document.exists {
                                        let name = document.get("UserName") as? String ?? ""
                                        let email = document.get("Email") as? String ?? ""
                                        
                                        UserDefaults.standard.set(name, forKey: "NAME")
                                        UserDefaults.standard.set(email, forKey: "EMAIL")
                                        
                                        isLoading.toggle()
                                    } else {
                                        isLoading.toggle()
                                        print("Document not exists")
                                    }
                                }
                            }
                        }
                    } label: {
                        if isLoading {
                            
                        } else {
                            Text("Continuar")
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
                        SignUp()
                    } label: {
                        Text("Ainda não possui uma conta? **Cadastre-se**")
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
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
