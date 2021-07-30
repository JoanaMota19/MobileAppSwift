
import SwiftUI

struct SearchBar: View {
    @Binding var text : String
    @State private var isWriting = false
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "magnifyingglass.circle")
                .imageScale(.large)
                .background(Color(.systemBackground))
            
            TextField( "Search...",text: $text )
            .padding()
            .padding(.horizontal, 0)
            .background(Color(.systemBackground))
            .cornerRadius(0)
            .padding(.horizontal, 0)
            .onTapGesture { self.isWriting = true }
        
        if isWriting {
            
            Button(action: {
                    self.isWriting = false
                    self.text = ""}) {
                
                Text("Cancel")
                
            }
            .padding(.trailing, 10)
            .transition(.move(edge: .trailing))
            .animation((.default))
            
            }
     
        }
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
