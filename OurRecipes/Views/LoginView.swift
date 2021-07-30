//
//  LoginView.swift
//  OurRecipes
//
//  Created by Abílio Tinoco on 28/05/2021.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
//MARK: - Body
    @State private var p : Perfil = Perfil(id:perfis.count ,image: "P2", name: "", password: "", listOfDishes: [])
    
    //KeyBoard
  //  enum UIKeyboardAppearance : Int
    
    var body: some View {
        
        NavigationView {
            
                VStack(alignment: .center, spacing: 40.0) {
                    
                    Text("Hi there!")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(width: 150, height: 20, alignment: .top)
                        .padding(.top)
                    
                    Image("P1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipped()
                        .cornerRadius(150)
                        .padding(.bottom, 100)
                    
                    TextField("User", text: $p.name)
                        .padding()
                        .cornerRadius(6.0)
                        .frame(width: 380, height: 5, alignment: .leading)
                        .padding(.bottom)
                    
                    SecureField("Password", text: $p.password)
                        .padding()
                        .cornerRadius(6.0)
                        .frame(width: 380, height: 5, alignment: .leading)
                        .padding(.bottom)
                    
                    //Botoes de login e registar
                    NavigationLink(
                            //Perguntar como verificar se ja la existe
                        destination: LoginViewCheck(p : p),
                        label: {
                            Text("Login")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 220, height: 50)
                                //.background(Color.gray)
                                .cornerRadius(30.0)
                                
                            
                        })
                    
                    NavigationLink ( destination: RegView(), label: {
                            Text("Register")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 220, height: 20)
                                .cornerRadius(30.0)
                        })
                        
                }.navigationBarBackButtonHidden(true)
                //.navigationViewStyle(StackNavigationViewStyle())
        }
}

struct RegView : View {
  
    
    @State private var p : Perfil = Perfil(id : perfis.count,
                                           image: "P2",
                                           name: "",
                                           password: "",
                                           listOfDishes: [])
    @State var ok : Bool = false
     var body: some View {
        
        VStack {
            
            Text("REGISTER")
            TextField("Name", text : $p.name)
            TextField("PassWord", text : $p.password)
           
            Button(action: {
                
                if( CheckExi(p : p)) {
                    print("FezAcc")
                   perfis = PerfilData()
                    p.id = perfis.count
                   perfis.append(p)
                   RegPerfil(p: p)
                    
                ok = true
                    
                }
                
            }, label: { Image(systemName: "person.badge.plus").imageScale(.large) })
            
            if(ok){OkView()}
        }
    }
    
    func CheckExi(p : Perfil) -> Bool {
        
        let list = perfis.filter({ p.name.isEmpty || p.password.isEmpty  ? false : $0.name == p.name})
      
        return list.isEmpty
    }
}
    struct OkView : View {
        
        var body: some View {
            
            Text("Profiel added")
        }
    }
    
    struct LoginViewCheck : View {
        
       var p : Perfil
        
        
       var body : some View {
         
        let login : Login = Login(p : p)
        let perf = PerfilData()
      
          
            if login.Check() {
                
                let pro : Perfil = perf[login.GiveId()]
                    ContentView(p: pro)
            } else {
               Invalid()
             // LoginView()
                
            }
       }
    }
        
    struct Invalid:View {
        
        var body: some View { Text("Invalid Account") }
    
    }
    


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
       // LoginView( )
         RegView()
        //Invalid()
        }
    }
}
