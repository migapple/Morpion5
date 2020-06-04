//
//  Damier.swift
//  Morpion5
//
//  Created by Michel Garlandat on 28/05/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct IndexCase {
    var ligne = 0
    var colonne = 0
}

struct DescriptionCase: Identifiable {
    var id = UUID()
    var couleur = Color.gray
    var index = IndexCase()
}

/// Description
/// Création du tableau en fonction du tableau listeCases
struct Damier {
    var cases : [[DescriptionCase]]
    
    init(nbLignes: Int, nbColonnes: Int) {
        cases = Damier.creer(nbLignes: nbLignes, nbColonnes: nbColonnes)
    }
    
    private static func creer(nbLignes: Int, nbColonnes: Int) -> [[DescriptionCase]]  {
        var tableau = [[DescriptionCase]]()
        
        for ligne in 0..<nbLignes {
            var ligneTableau = [DescriptionCase]()
            for colonne in 0..<nbColonnes {
                var description = DescriptionCase()
                description.index = IndexCase(ligne: ligne, colonne: colonne)
                ligneTableau.append(description)
            }
            tableau.append(ligneTableau)
        }
        return tableau
    }
    
    // Création nouvelle grille vierge
    mutating func nouvelleGrille(nbLignes:Int, nbColonnes:Int) {
        cases = Damier.creer(nbLignes: nbLignes, nbColonnes: nbColonnes)
    }
    
    // Action
    mutating func toucheCases(index:IndexCase) {
        let ligne = index.ligne
        let colonne = index.colonne
        let description = cases[ligne][colonne]
      
        if description.couleur == Color.gray {
            cases[ligne][colonne].couleur = Color.green
        }
    }
    
    mutating func ordiCase() {
        while true {
            let ligne = Int.random(in: 0..<3)
            let colonne = Int.random(in: 0..<3)
            
            if cases[ligne][colonne].couleur == Color.gray {
                cases[ligne][colonne].couleur = Color.red
                break
            }
        }
    }
}
