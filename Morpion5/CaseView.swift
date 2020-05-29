//
//  CaseView.swift
//  Morpion4
//
//  Created by Michel Garlandat on 26/05/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct CaseView: View {
    var description: DescriptionCase
    
    var body: some View {
        Rectangle()
        .foregroundColor(description.couleur)
        .frame(width: 80, height: 80)
    }
}

//struct CaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaseView(description: DescriptionCase(couleur: Color.gray, index: IndexCase(ligne: 0, colonne: 0)))
//    }
//}
