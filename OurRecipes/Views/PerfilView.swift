//
//  PerfilView.swift
//  OurRecipes
//
//  Created by Abílio Tinoco on 28/05/2021.
//

import SwiftUI

struct PerfilView: View {
    
    @State var p : Perfil
    var dishes = dishData

    var body: some View {
     
            VStack {
                
                Image(p.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipped()
                    .cornerRadius(150)
                    .padding(.top, 0)
                
                Text(p.name)
         
               NavigationLink(
                destination: ChangeSet(perfil: p) ,
                label: {
                    HStack
                    {
                        Text("Settings").font(.title2)
                        Image(systemName: "ellipsis.circle").imageScale(.large)

                    }
                })
                
                
                NavigationLink( destination: LoginView()
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true),
                    label: {
                        
                        HStack {
                            
                            Text("Log Out")
                            
                            Image(systemName: "arrow.up.right.square.fill").imageScale(.large).font(.headline)
                            
                        }
                        
                    })
                
            }.padding()
        
    }
    
    struct ChangeSet : View {
        
        @State var perfil : Perfil/*
        @State var name : String = ""
        var body: some View
        {
            VStack{
                
            Text("Change Name")
            TextField("Here", text: $name)
            Text("Change Password")
            
                
                
            }*/
        var body: some View
        {
            Text("Soon..")
            
        }
    }
struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        //PerfilView(p: testep[0])
        ChangeSet(perfil: testep[0])
        
    }
    }
}
