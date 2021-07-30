//
//  FruitCardView.swift
//  FruitsApp_Aula
//
//  Created by Carlos Tinoco on 23/April/2021.
//

import SwiftUI

struct DishRowView: View{
    //MARK: - Propreties
    var dish : Dish
//MARK: - Body
    var body: some View {
        
        HStack (spacing: 20) {
            
            //Imagem
            Image(dish.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: .leading)
                .clipped()
                //.cornerRadius(75)
                //.padding(.top)
                //.shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 0, x: 6, y: 8)
            
            VStack {
            
            //text
            Text(dish.name)
                .foregroundColor(.black)
                .font(.headline)
                //.shadow(color: Color(red:0, green:0, blue:0, opacity:0.15), radius: 2, x: 2, y: 2)
            
                //titulo (por no canto superior esquerdo)
                Text(dish.meal[0].rawValue)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.heavy)
                    //.shadow(color: Color(red:0, green:0, blue:0, opacity:0.15), radius: 2, x: 0, y: 0)
                
               // StartButtonView()
             }
            
            }
        //.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        //.cornerRadius(20)
        //.padding(20)
   }
}

struct DishRowToPerfil : View
{
    var dish : Dish
    
    var body: some View {
        
        HStack {
            
            //Imagem
            Image(dish.image)
                .resizable()
                //.aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250, alignment: .center)
                .clipped()
                .cornerRadius(150)
                .padding(.top)
            
        }
    }
}


struct DishRowView_Previews: PreviewProvider {
    static var previews: some View {
        DishRowToPerfil(dish: dishData[1])
            .previewLayout(.fixed(width: 320, height: 480))
           
    }
}
