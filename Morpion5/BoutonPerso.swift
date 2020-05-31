//
//  BoutonPerso.swift
//  Morpion5
//
//  Created by Michel Garlandat on 31/05/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct BoutonPerso: View {
    var text: String
    var couleur: Color
    
    var body: some View {
        Text(text)
            .font(.caption)
            .bold()
            .foregroundColor(.white)
            .padding()
            .background(couleur)
            .cornerRadius(10)
            .padding()
    }
}

struct BoutonPerso_Previews: PreviewProvider {
    static var previews: some View {
        BoutonPerso(text: "Bonjour", couleur: Color.red)
    }
}
