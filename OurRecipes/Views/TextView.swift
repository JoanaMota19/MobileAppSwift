//
//  TextView.swift
//  OurRecipes
//
//  Created by Abílio Tinoco on 04/06/2021.
//

import SwiftUI

struct TextView: View {
    
    var s : String
    var body: some View {
        Text(s)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(s:"1")
    }
}
