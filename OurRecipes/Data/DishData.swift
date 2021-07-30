import SwiftUI





var teste : [Dish] = [Dish(
    id: 0,
    name: "Massa c/atum",
    image: "Atum",
    description: "Cozes massa e metes atum",
    time: "15",
    kcal: "250 kcal",
    meal: [TypeOfMeal.Lunch,TypeOfMeal.Dinner],
    ingredients: [TypeOfIngredient.Fish,TypeOfIngredient.Cereal],
                        confection: [TypeOfConfection.Boiled,TypeOfConfection.Fried])]

var testep : [Perfil] = [  Perfil(id:0,image: "P1", name: "Passos", password: "123", listOfDishes: [0]) ]

 var perfis : [Perfil] = PerfilData()
 var dishData : [Dish] = DishData()
/*



var perfis : [Perfil] =
    [
    Perfil(image: "P1", name: "Passos", password: "123", listOfDishes: [1]),
    Perfil(image: "P2", name: "Tino", password: "1234", listOfDishes: [2])

    ]



var dishData : [Dish] = [
  Dish(
    name: "Massa c/atum",
    image: "Atum",
    description: "Cozes massa e metes atum",
    time: 15,
    kcal: "250 kcal",
    meal: [TypeOfMeal.Lunch,TypeOfMeal.Dinner],
    ingredients: [TypeOfIngredient.Fish,TypeOfIngredient.Cereal],
    confection: [TypeOfConfection.Boiled]),
    
    Dish(
      name: "Bacalhau à Brás",
      image: "cod",
      description: "1001 maneira de fazer bacalhau",
      time: 15,
      kcal: "250 kcal",
      meal: [TypeOfMeal.Lunch],
      ingredients: [TypeOfIngredient.Fish,TypeOfIngredient.Cereal],
      confection: [TypeOfConfection.Boiled])
]
*/
