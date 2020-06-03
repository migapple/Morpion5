//
//  GrilleView.swift
//  Morpion4
//
//  Created by Michel Garlandat on 26/05/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

/// Description
/// liste: Liste des cases à dessiner en fonction des lignes et des colonnes
/// damier: Objet devant recevoir les évènements utilisateur: quand le joueur sélectionne une case
/// action: Action de l'automate
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

//struct GrilleView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        GrilleView(actif: <#T##Binding<Bool>#>, liste: <#T##[[DescriptionCase]]#>, damier: <#T##Damier#>, action: <#T##() -> Void#>)
//    }
//}
