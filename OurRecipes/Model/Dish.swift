//
//  Dish.swift
//  OurRecipes
//
//  Created by Carlos Tinoco on 25/May/2021.
//

import SwiftUI

enum TypeOfMeal : String {
    case Breakfast
    case Lunch
    case Dinner
    case Snack
}

enum TypeOfIngredient : String, CaseIterable {
    case Fruit
    case Vegetables
    case Fish
    case Meat
    case Cereal
    case Drink
    case DairyProducts
    case Spices
}

enum TypeOfConfection : String, CaseIterable {
   case Boiled
   case Grilled
   case Fried
   case Stewed
   case Roasted
}


struct Dish :  Identifiable {
    var id : Int
    var name: String
    var image : String
    var description : String
    var time : String
    var kcal : String
    var meal : [TypeOfMeal]
    var ingredients : [TypeOfIngredient]
    var confection : [TypeOfConfection]
    
 }



