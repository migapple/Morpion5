//
//  ContentView.swift
//  Morpion5
//
//  Created by Michel Garlandat on 19/05/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

enum EtatJeu: String {
    case indetermine = "Indeterminé"
    case tourJoueur = "Tour Joueur"
    case tourIA = "Tour IA"
    case joueurGagnant = "Joueur Gagnant"
    case IAGagnant = "Joueur Perdant"
    case pasDeGagnant = "Pas de Gagnant"
    case finDujeu = "Fin du Jeu"
    case reset = "Reset"
}

struct ContentView: View {
    @Binding var machine : MachineEtats
    
//    @ObservedObject var damier = Damier(nbLignes: 3, nbColonnes: 3)
    @Binding var damier: Damier
    @State var etatJeu = EtatJeu.indetermine
    @State var interfaceActive = true
    @State var compteurJoueur = 0
    @State var compteurIA = 0
    @State var couleurFond = Color.white
    @State var boutonIAVisible = true
    @State var quiDemarre = false
    
    var body: some View {
        VStack {
            
            Text(machine.etatCourant.rawValue)
                .font(.system(size: 20))
                .bold()
            
            Spacer()
            
            HStack {
                Text("IA: \(compteurIA)")
                Text("Joueur: \(compteurJoueur)")
            }
            
            GrilleView(actif: $interfaceActive, liste: damier.cases, damier: damier,
                       action: {
                            self.compteurJoueur += 1
                        if self.compteurJoueur == 5 {
                            self.machine.activer(etat: .finDujeu)
                        } else {
                            self.machine.activer(etat: .tourIA)
                        }
            })
            
            Spacer()
            
            HStack {
                Button(action:{
                    self.resetgrilleJeu()
                    self.machine.activer(etat: .tourJoueur)
                    
                }) {
                    
                    BoutonPerso(text: "Joueur Commence", couleur: .green)
                }
                
                Button(action:{
                    self.resetgrilleJeu()
                    self.machine.activer(etat: .tourIA)
                    
                }) {
                    BoutonPerso(text: "IA Commence", couleur: .red)
                }
            }
        }
    }
    
    func resetgrilleJeu() {
        self.damier.nouvelleGrille(nbLignes: 3, nbColonnes: 3)
        self.compteurIA = 0
        self.compteurJoueur = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    @Binding var machine : MachineEtats
    @Binding var damier: Damier
    
    static var previews: some View {
        ContentView(machine: $machine, damier: $damier)
    }
}
