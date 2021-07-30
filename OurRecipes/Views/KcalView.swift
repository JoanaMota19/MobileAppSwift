import SwiftUI

struct KcalView: View
{
    
    var dish:  Dish
    
    var body: some View {
        
        GroupBox(){
            
            DisclosureGroup("Nutricional Value") {
                
                HStack {
                    
                    Group {
                        Image(systemName: "info.circle")
                        Text("Energy");
                        
                        /*Image(systemName: "info.circle ")
                        Text("\nProtein");
                        Image(systemName: "info.circle ")
                        Text("\n Salt")*/
                    }
                    .foregroundColor(.red)

                    Spacer(minLength: 25)
                    
                    Text(dish.kcal)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.trailing)
                    
                }
            }
        }
    }
}

struct KcalView_Previews: PreviewProvider {
    static var previews: some View {
        KcalView(dish: dishData[1])
            .previewLayout(.sizeThatFits)
    }
}
