//
//  BoatUIView.swift
//  AwardsCollectionApp
//
//  Created by Рома Баранов on 26.06.2023.
//

import SwiftUI

struct BoatUIView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                Image(systemName: "sailboat.fill")
                    .resizable()
                    .foregroundColor(.brown)
            }
        }

    }
}

struct BoatUIView_Previews: PreviewProvider {
    static var previews: some View {
        BoatUIView()
            
    }
}
