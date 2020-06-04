//
//  Automate.swift
//  Morpion5
//
//  Created by Michel Garlandat on 31/05/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

enum EtatMachine: String {
    case indetermine = "Indeterminé"
    case tourJoueur = "Tour Joueur"
    case tourIA = "Tour IA"
    case joueurGagnant = "Joueur Gagnant"
    case IAGagnant = "Joueur Perdant"
    case pasDeGagnant = "Pas de Gagnant"
    case finDujeu = "Fin du Jeu"
    case reset = "Reset"
}

struct MachineEtats {
    
    var etatCourant = EtatMachine.indetermine
    @Binding var damier: Damier
    
    // Activation de l'état de début
//    init() {
//        activer(etat: .indetermine)
//    }
    
    mutating func activer(etat: EtatMachine) {
        switch etat {
        case .indetermine:
            break
        case .tourJoueur:
            break
//            interfaceActive = true
//            couleurFond = Color.white
//            boutonIAVisible = true

        case .tourIA:
//            interfaceActive = false
//            couleurFond = Color.gray
//            boutonIAVisible = false

            // Increment Compteur Ordi
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                self.compteurIA += 1
                damier.ordiCase()
//                if self.compteurIA == 5 || self.compteurJoueur == 5 {
//                    if self.compteurIA == 5  {
//                    self.activerEtat(etat: .finDujeu)
//                } else {
//                    self.activerEtat(etat: .tourJoueur)
//                }
//            }
                
        case .joueurGagnant:
//            interfaceActive = false
//            boutonIAVisible = false
            break
        case .IAGagnant:
//            interfaceActive = false
//            boutonIAVisible = false
            break
        case .reset:
//            interfaceActive = false
//            compteurIA = 0
//            compteurJoueur = 0
            break
        case .pasDeGagnant:
//            interfaceActive = false
            break
        case .finDujeu:
//            interfaceActive = false
            break
        }

        etatCourant = etat
    }
}
