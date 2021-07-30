//
//  AddView.swift
//  OurRecipes
//
//  Created by Carlos Tinoco on 25/May/2021.
//
import Foundation
import SwiftUI

struct AddView: View
{
    
    @State var b : Bool = false //breakfast
    @State var l : Bool = false //lunch
    @State var d : Bool = false //dinner
    @State var s : Bool = false //snack
    
    @State var Boiled : Bool = false
    @State var Grilled : Bool = false
    @State var Fried : Bool = false
    @State var Stewed : Bool = false
    @State var Roasted : Bool = false
    
    @State var Fruit : Bool = false
    @State var Vegetables : Bool = false
    @State var Fish : Bool = false
    @State var Meat : Bool = false
    @State var Cereal : Bool = false
    @State var Drink : Bool = false
    @State var DairyProducts : Bool = false
    @State var Spices : Bool = false
    
    
    @State var lista : [Bool] = [false,false,false,false]
    @State var list : [Bool] = [false,false,false,false,false]
    @State var IngredientsList : [Bool] = [false,false,false,false,false,false,false,false]
    
     @State var input = ""
  //@State  var lista : [String: Bool] = ["b" : false, "l" : false, "d" : false, "s" : false]
   
    @State var badded : Bool = false
    @State var p : Perfil
    @State var dish : Dish = Dish(id : dishData.count , name: "",
                                  image: "Prato",
                                  description: "",
                                  time: 60.description,
                                  kcal: "",
                                  meal: [],
                                  ingredients: [],
                                  confection: [])
    
    
    
    
    
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/){
            
        
        VStack(alignment: .leading)
            
        {
            
            Text("Add Dish")
                .font(.title)
                .multilineTextAlignment(.leading)
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, alignment: .center)
                .padding(.vertical, 0.0)
            
            Text("\nName")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.leading, 0.0)
            TextField("Write Here", text: $dish.name)
            
            Text("\nDescription")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.leading, 0.0)
            //TextField("Write Here", text: $dish.image)
            TextField("Write Here", text: $dish.description)
            
        /*
            Text("\nTime")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.leading, 0.0)
            TextField("Write Here", text: $dish.time)
          */
        
            //  TextField("Write Here",)
            Text("\nKcal")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.leading, 0.0)
            TextField("Write Here", text: $dish.kcal)
            
            
            
            //nao sei porque, mas estes espacos fazem com que o name, description... nao estejam tapados
           // Text("\n\n\n")
                   
            
            //Meal Box in the bottom
            GroupBox(){
                DisclosureGroup("Meal") {
                    
                    VStack {
                        
                        Group {
                           
                            Toggle(isOn : $b) { Text("BreakFast") }
                            Toggle(isOn : $l) { Text("Lunch") }
                            Toggle(isOn : $d) { Text("Dinner") }
                            Toggle(isOn : $s) { Text("Snack") }
                        }
                        
                        Spacer(minLength: 0)
                        
                    }
                    
                }
                
            }
            GroupBox() {
                
                DisclosureGroup("Confection") {
                    
                    VStack {
                    
                        Group {
                          
                            Toggle(isOn : $Boiled) { Text("Boiled") }
                            Toggle(isOn : $Fried) { Text("Fried") }
                            Toggle(isOn : $Roasted) { Text("Roasted") }
                            Toggle(isOn : $Grilled) { Text("Grilled") }
                            Toggle(isOn : $Stewed ) { Text("Stewed") }
                        }
                        
                        Spacer(minLength: 0)
                        
                    }
                    
                }
                
            }
            
 
            GroupBox() {
                
                DisclosureGroup("Ingredients") {
                    
                    VStack {
                        
                        Group {
                            
                            Toggle(isOn : $Fruit) { Text("Fruit") }
                            Toggle(isOn : $Vegetables) { Text("Vegetables") }
                            Toggle(isOn : $Fish) { Text("Fish") }
                            Toggle(isOn : $Meat) { Text("Meat") }
                            Toggle(isOn : $Cereal ) { Text("Cereal") }
                            Toggle(isOn : $Drink ) { Text("Drink") }
                            Toggle(isOn : $DairyProducts ) { Text("DairyProducts") }
                            Toggle(isOn : $Spices) { Text("Spices") }
                            
                        }
                        
                        Spacer(minLength: 0)
                        
                    }
                    
                }
                
            }
            
          /*  if(badded)
            {
                OkView()
            }
            
           NavigationLink(
                destination: CameraView(),
                label: {
                    Image(systemName: "camera")
                })
            */
            
        }
        .padding(.all)
       
        .navigationBarItems(trailing: Button(action: {
            
          
            if(!badded){
            lista[0] = s
            lista[1] = b
            lista[2] = l
            lista[3] = d
            
            list[0] = (Boiled)
            list[1] = (Fried)
            list[2] = (Grilled)
            list[3] = (Stewed)
            list[4] = (Roasted)
            
            IngredientsList[0] = (Fruit)
            IngredientsList[1] = (Vegetables)
            IngredientsList[2] = (Fish)
            IngredientsList[3] = (Meat)
            IngredientsList[4] = (Cereal)
            IngredientsList[5] = (Drink)
            IngredientsList[6] = (DairyProducts)
            IngredientsList[7] = (Spices)
            
            dish = PutConf(list: list, d: dish)
            dish = PutMeal(list: lista, d: dish)
            dish = PutIngredients(list: IngredientsList, d: dish)
            
            
            dishData.append(dish)
            dish.id = dishData.count
            RegDish(d: dish)
            
            p.listOfDishes.append(dish.id)
            RegPerfil(p: p)
            }
            badded = true
        },
        
        label: {
            Image(systemName: "plus")
                .scaledToFit()
                .imageScale(.large)
        }))
        }}
}


func PutMeal (list : [Bool], d :  Dish) -> (Dish) {
    
    var dish = d
    for i  in 0...3 {
        if(list[i] && i == 0) { dish.meal.append(TypeOfMeal.Snack) }
        else  if (list[i] && i == 1) { dish.meal.append(TypeOfMeal.Breakfast) }
        else  if (list[i] && i == 2) { dish.meal.append(TypeOfMeal.Lunch) }
        else  if (list[i] && i == 3) { dish.meal.append(TypeOfMeal.Dinner) }
    }
    return dish
}

func PutConf(list : [Bool], d :  Dish) -> (Dish) {
    
    var dish = d
    for i  in 0...4 {
        
        if(list[i] && i == 0) { dish.confection.append(TypeOfConfection.Boiled) }
        else  if(list[i] && i == 1) { dish.confection.append(TypeOfConfection.Fried) }
        else  if(list[i] && i == 2) { dish.confection.append(TypeOfConfection.Grilled) }
        else  if(list[i] && i == 3) { dish.confection.append(TypeOfConfection.Stewed) }
        else  if(list[i] && i == 4) { dish.confection.append(TypeOfConfection.Roasted) }
      }
    return dish
}

func PutIngredients(list : [Bool], d :  Dish) -> (Dish) {
   
    var dish = d
    for i  in 0...5 {
        
        if(list[i] && i == 0) { dish.ingredients.append(TypeOfIngredient.Fruit) }
        else  if(list[i] && i == 1) { dish.ingredients.append(TypeOfIngredient.Vegetables) }
        else  if(list[i] && i == 2) { dish.ingredients.append(TypeOfIngredient.Fish) }
        else  if(list[i] && i == 3) { dish.ingredients.append(TypeOfIngredient.Meat) }
        else  if(list[i] && i == 4) { dish.ingredients.append(TypeOfIngredient.Cereal) }
        else  if(list[i] && i == 5) { dish.ingredients.append(TypeOfIngredient.Drink) }
        else  if(list[i] && i == 6) { dish.ingredients.append(TypeOfIngredient.DairyProducts) }
        else  if(list[i] && i == 7) { dish.ingredients.append(TypeOfIngredient.Spices) }
    }
    return dish
}

struct OkView : View {
    
    var body: some View {
        
        Text("Dish added")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(p: perfis[0])
    }
}
