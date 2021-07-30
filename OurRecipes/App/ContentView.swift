//
//  ContentView.swift
//  FruitsApp_Aula
//
//  Created by Carlos Tinoco on 16/April/2021.
//

import SwiftUI

struct ContentView: View
{
  
    var p : Perfil
  // var Lista : [Dish] = dishData
   @State var text : String = ""
    

    
    @State var dishes : [Dish] = DishData()
    var body: some View
    
    {
        ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)  {
        
        
        VStack {
                        
                        SearchBar(text: $text)
                        HStack(alignment: .top, spacing: 60) {
                            
                            //botao para aceder À camara
                            NavigationLink (destination : CameraView(),
                                label: {
                                    Image(systemName:
                                            "camera")
                                        .imageScale(.large)
                                        .padding( 10)
                                     //   .navigationBarBackButtonHidden(true)
                                    
                                }).padding(.top, 0.0).navigationBarBackButtonHidden(true)
                            
                            //Botao para ir para o perfil
                            NavigationLink (destination : PerfilView(p : p),
                                label: {
                                    Image(systemName : "person.crop.circle")
                                        .imageScale(.large)
                                        .padding(10)
                                })
                            //botao de adicionar
                                NavigationLink( destination : AddView(p : p),
                                    label: {
                                        Image(systemName:
                                                "plus")
                                                .imageScale(.large)
                                            .padding(10)
                                    })
                            //botao de resfresh
                                NavigationLink( destination : ContentView(p : p),
                                    label: {
                                        Image(systemName : "arrow.clockwise")
                                            .imageScale(.large)
                                            .padding(10)
                                    })
                        }

                        List {
                            let Lista = dishes.filter({ text.isEmpty ? true : $0.name.contains(text)})
                            
                            //AQUI É ONDE CARREGAS E MUDAS DE VIEW
                                ForEach(Lista.shuffled())
                                {
                                    item in NavigationLink(destination: DishCardView(dish: item))
                                    {
                                        DishRowView(dish: item)
                                            .padding(.top, 0)
                                            
                                            
                                    }
                                }
                        }
          
                    }
                    .navigationBarTitle("Refeições", displayMode: .inline)
                    .padding(10)
    }
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(p: perfis[0])
    }
}
