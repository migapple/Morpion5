//
//  GrilleView.swift
//  Morpion4
//
//  Created by Michel Garlandat on 26/05/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct GrilleView: View {
    @Binding var actif: Bool
    var liste: [[DescriptionCase]]
    var damier: Damier
    var action: () -> Void
    
    var body: some View {
        VStack {
            ForEach(0..<liste.count, id: \.self) { ligne in
                HStack {
                    ForEach(0..<self.liste[ligne].count, id:\.self) { colonne in
                        CaseView(description: self.liste[ligne][colonne])
                            .onTapGesture {
                                if self.actif {
                                    // Joueur joue
                                    self.damier.toucheCases(index: self.liste[ligne][colonne].index)
                                    self.action()
                                }
                        }
                    }
                }
            }
        }
    }
}

struct GrilleView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
