//
//  FruitRowView.swift
//  FruitsApp_Aula
//
//  Created by Carlos Tinoco on 04/May/2021.
//

import SwiftUI

struct DishCardView: View {
    //MARK: - Properties
    var dish : Dish
    
    
    //MARK: - Body
    //perguntar a prof por causa da parte de cima (notch)
    var body: some View {
        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)  {
        
        
        VStack(spacing: 0){
           
            Text(dish.name)
                .font(.largeTitle)
                .bold()
                .frame(width: 390, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .bottom)
            
            Image(dish.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 390, height: 200, alignment: .center)
                    .clipped()
                    //.cornerRadius(150)
                    .padding(.top)
            
            HStack {
                //ver melhor a posicao do timer e kacl
                Image(systemName: "timer").frame(width: 20, height: 75, alignment: .trailing)
                Text(dish.time.description + " min")
                
                KcalView(dish: dish).frame(width: 230, height: 75, alignment: .leading)
                   
                
            }
           
            VStack(alignment: .leading, spacing: 0){
             
                
                Text("\nIdeal for: ")
                        .font(.title2)
                        .bold()
                   
                   
                
                TextView(s: listaMeal(dish : dish))
                    .font(.title3)
                    .scaledToFit()
                
                Text("\nMethod: ")
                        .font(.title2)
                        .bold()
                Text( listaConfection(dish : dish))
                    .font(.title3)
                    .scaledToFit()
                
                Text("\nDescription: ")
                    .font(.title2)
                    .bold()
                Text(dish.description).font(.title3)
                
                Text("\nIngredientes: ").font(.title2)
                    .bold()
                Text(listaIngredients(dish : dish))
                    .font(.title3)
                    .scaledToFit()
               
              /*  Text("\nNutricional Value: ")
                    .font(.title3)
                Text( dish.kcal)
                    .font(.title)*/

            }
            .frame(width: 390, height: 500, alignment:.topLeading)
            .navigationBarItems(trailing:
                                    Button(action: {Share(d:dish)}) {
                Image(systemName: "square.and.arrow.up")
                    .scaledToFit()
                    .imageScale(.large)
                    
            })
            
        }
        }}
    
}

func Share(d:Dish)
{
    let items = [d.name,d.description]
let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
    UIApplication.shared.windows.first?.rootViewController?.present(ac, animated: true)
    
}
func listaMeal(dish : Dish) -> (String) {
    
    var string : String = ""
    for item in 0...dish.meal.count {
        
        if (item == dish.meal.count - 1 ) {
            
            string += dish.meal[item].rawValue
            
        }
        
        else if (item == dish.meal.count ) {}
        
        else {
       string += dish.meal[item].rawValue + "\n"
            
        }
        
    }
    return string
    
}

//ingredients
func listaIngredients(dish : Dish) -> (String) {
    
    var string : String = ""
    for item in 0...dish.ingredients.count {
    
    if (item == dish.ingredients.count - 1 ) {
        string += dish.ingredients[item].rawValue
        }
    
    else if (item == dish.ingredients.count ) {}
    else{
        
   string += dish.ingredients[item].rawValue + "\n"
        
        }
    }
    return string
}


//confection

func listaConfection(dish : Dish) -> (String) {
    
    var string : String = ""
    for item in 0...dish.confection.count {
    
    if (item == dish.confection.count - 1 ) {
        string += dish.confection[item].rawValue
        }
    else if (item == dish.confection.count ) {}
    else{
    string += dish.confection[item].rawValue + "\n"
        
        }
    }
    return string
}
    
    
struct DishCardView_Previews: PreviewProvider {
    static var previews: some View {
        DishCardView(dish: teste[0])
    }
}

