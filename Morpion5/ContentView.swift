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
    @ObservedObject var damier = Damier(nbLignes: 3, nbColonnes: 3)
    
    @State var etatJeu = EtatJeu.indetermine
    @State var interfaceActive = true
    @State var compteurJoueur = 0
    @State var compteurIA = 0
    @State var couleurFond = Color.white
    @State var boutonIAVisible = true
    @State var quiDemarre = false
    
    var body: some View {
        VStack {
            
            Text(etatJeu.rawValue)
                .font(.system(size: 20))
                .bold()
            
            Spacer()
            
            HStack {
                Text("IA: \(compteurIA)")
                Text("Joueur: \(compteurJoueur)")
            }
            
            GrilleView(actif: $interfaceActive, liste: damier.listeCases, damier: damier,
                       action: {
                            self.compteurJoueur += 1
                        if self.compteurJoueur == 5 {
                            self.activerEtat(etat: .finDujeu)
                        } else {
                            self.activerEtat(etat: .tourIA)
                        }
            })
            
            Spacer()
            
            HStack {
                Button(action:{
                    self.damier.nouvelleGrille(nbLignes: 3, nbColonnes: 3)
                    self.activerEtat(etat: .tourJoueur)
                    self.compteurIA = 0
                    self.compteurJoueur = 0
                    
                }) {
                    Text("Joueur Commence")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.green)
                .cornerRadius(10)
                .padding()
                
                Button(action:{
                    self.damier.nouvelleGrille(nbLignes: 3, nbColonnes: 3)
                    self.activerEtat(etat: .tourIA)
                    self.compteurIA = 0
                    self.compteurJoueur = 0
                }) {
                    Text("IA Commence")
                        .font(.caption)
                        
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.red)
                .cornerRadius(10)
                .padding()
            }
        }
    }
    
    func activerEtat(etat: EtatJeu) {
        switch etat {
        case .indetermine:
            break
        case .tourJoueur:
            interfaceActive = true
            couleurFond = Color.white
            boutonIAVisible = true
            
        case .tourIA:
            interfaceActive = false
            couleurFond = Color.gray
            boutonIAVisible = false
            
            // Increment Compteur Ordi
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.compteurIA += 1
                self.damier.ordiCase()
//                if self.compteurIA == 5 || self.compteurJoueur == 5 {
                    if self.compteurIA == 5  {
                    self.activerEtat(etat: .finDujeu)
                } else {
                    self.activerEtat(etat: .tourJoueur)
                }
            }
        case .joueurGagnant:
            interfaceActive = false
            boutonIAVisible = false
        case .IAGagnant:
            interfaceActive = false
            boutonIAVisible = false
        case .reset:
            interfaceActive = false
            compteurIA = 0
            compteurJoueur = 0
        case .pasDeGagnant:
            interfaceActive = false
        case .finDujeu:
            interfaceActive = false
        }
        
        etatJeu = etat
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
