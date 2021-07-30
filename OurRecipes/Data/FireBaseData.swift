//
//  FireBaseData.swift
//  OurRecipes
//
//  Created by Abílio Tinoco on 11/06/2021.
//

//import FirebaseFirestore
//import FirebaseFirestoreSwift
import Firebase

var perfilData : [Perfil] = []
var dishDatab : [Dish] = []

func convToTypeOfmeal(s: String)-> [TypeOfMeal] {
    
    var list : [TypeOfMeal] = []
    var d = s
    d = d.replacingOccurrences(of: "[", with: "")
    d = d.replacingOccurrences(of: " ", with: "")
    d = d.replacingOccurrences(of: "]", with: "")
    let lista : [String] = d.components(separatedBy: ",")
  
    //print(lista)
    let c = lista.capacity - 1
    
    for i in 0...c {
          switch lista[i] {
          case "OurRecipes.TypeOfMeal.Breakfast":
            list.append(TypeOfMeal.Breakfast)
          case "OurRecipes.TypeOfMeal.Lunch":
            list.append(TypeOfMeal.Lunch)
          case "OurRecipes.TypeOfMeal.Dinner":
            list.append(TypeOfMeal.Dinner)
          case "OurRecipes.TypeOfMeal.Snack":
            list.append(TypeOfMeal.Snack)
          default:
          break
          }
    }
    return list
}

func convToTypeOfIngredient (s : String ) -> [TypeOfIngredient] {
    
    var list : [TypeOfIngredient] = []
    var d = s
    d = d.replacingOccurrences(of: "[", with: "")
    d = d.replacingOccurrences(of: " ", with: "")
    d = d.replacingOccurrences(of: "]", with: "")
    
    let lista : [String] = d.components(separatedBy: ",")
    
    print(lista)
    let c = lista.capacity - 1
    
    for i in 0...c {
          switch lista[i] {
          case "OurRecipes.TypeOfIngredient.DairyProducts":
            list.append(TypeOfIngredient.DairyProducts)
          case "OurRecipes.TypeOfIngredient.Drink":
            list.append(TypeOfIngredient.Drink)
          case "OurRecipes.TypeOfIngredient.Meat":
            list.append(TypeOfIngredient.Meat)
          case "OurRecipes.TypeOfIngredient.Fish":
            list.append(TypeOfIngredient.Fish)
          case "OurRecipes.TypeOfIngredient.Spices":
            list.append(TypeOfIngredient.Spices)
          case "OurRecipes.TypeOfIngredient.Cereal":
            list.append(TypeOfIngredient.Cereal)
          case "OurRecipes.TypeOfIngredient.Vegetables":
            list.append(TypeOfIngredient.Vegetables)
          case "OurRecipes.TypeOfIngredient.Fruit":
            list.append(TypeOfIngredient.Fruit)
          default:
          break
            
          }
    }
    return list
}

func convToTypeOfConfection (s : String ) -> [TypeOfConfection] {
    
    var list : [TypeOfConfection] = []
    
    var d = s
    d = d.replacingOccurrences(of: "[", with: "")
    d = d.replacingOccurrences(of: " ", with: "")
    d = d.replacingOccurrences(of: "]", with: "")
    
    let lista : [String] = d.components(separatedBy: ",")
    
   // print(lista)
    let c = lista.capacity - 1
    
    for i in 0...c {
        
          switch lista[i] {
          
          case "OurRecipes.TypeOfConfection.Fried":
            list.append(TypeOfConfection.Fried)
          case "OurRecipes.TypeOfConfection.Roasted":
            list.append(TypeOfConfection.Roasted)
          case "OurRecipes.TypeOfConfection.Grilled":
            list.append(TypeOfConfection.Grilled)
          case "OurRecipes.TypeOfConfection.Stewed":
            list.append(TypeOfConfection.Stewed)
          case "OurRecipes.TypeOfConfection.Boiled":
            list.append(TypeOfConfection.Boiled)
          default:
          break
            
          }
    }
    return list
}




func PerfilData() -> [Perfil] {

        let db = Firestore.firestore()
        
        db.collection("Perfil").getDocuments {
            
            (snap, err) in
            
            guard let itemData = snap else{return}
            
            perfilData = itemData.documents.compactMap({ (doc) -> Perfil? in
                
                let id = doc.get("id") as! Int
                let image = doc.get("image") as! String
                let name = doc.get("name") as! String
                let password = doc.get("password") as! String
               // let listOfDishes = doc.get("listOfDishes") as! String
               
                print(id)
                
                return Perfil(id : id, image: image, name: name, password: password, listOfDishes: [])
            })
        }
    return perfilData
    }

func DishData() -> [Dish] {
  
        let db = Firestore.firestore()
        
        db.collection("Dish").getDocuments {
            
            (snap, err) in
            
            guard let itemData = snap else {return}
            
            dishDatab = itemData.documents.compactMap({ (doc) -> Dish? in
                
                let id = doc.get("id") as! Int
                let image = doc.get("image") as! String
                let name = doc.get("name") as! String
                let description = doc.get("description") as! String
                let time = doc.get("time") as! String
                let kcal = doc.get("kcal") as! String
                let typeOfMeal = doc.get("typeOfMeal") as! String
               let ingredients = doc.get("ingredients") as! String
                let confection = doc.get("confection") as! String
                
                return Dish(id: id ,
                            name : name,
                            image : image,
                            description : description,
                            time : time,
                            kcal : kcal,
                            meal : convToTypeOfmeal(s: typeOfMeal),
                            ingredients :convToTypeOfIngredient(s: ingredients),
                            confection : convToTypeOfConfection(s: confection))
                
            })
          
        }
    return dishDatab
    }



func RegDish (d : Dish) {
        
        let db = Firestore.firestore()
        
        db.collection("Dish").document(d.id.description).setData([
        
        "id" : d.id,
        "image" : d.image,
        "name" : d.name,
        "description" : d.description,
        "time" : d.time,
        "kcal" : d.kcal,
        "typeOfMeal" : d.meal.description,
        "ingredients" : d.ingredients.description,
        "confection" : d.confection.description
            
        ])
        
    }

func RegPerfil(p : Perfil) {
        
        let db = Firestore.firestore()
        
    db.collection("Perfil").document(p.id.description).setData([
        
        "id" : p.id,
        "image" : p.image,
        "name" : p.name,
        "password" : p.password,
        "ListOfDishes" : p.listOfDishes
        ])
        
    }

func RemoveDish(d : Dish) {
    
    let db = Firestore.firestore()
    db.collection("Dish").document(d.id.description).delete()
}
