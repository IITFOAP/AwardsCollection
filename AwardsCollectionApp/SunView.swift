//
//  SunView.swift
//  AwardsCollectionApp
//
//  Created by Рома Баранов on 26.06.2023.
//

import SwiftUI

struct SunView: View {
    @State private var start = 0.0


    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let minimumSize = min(width, height)
            
            ZStack {
                ForEach(0..<5) { iteration in
                    Capsule()
                        .fill(
                            RadialGradient(
                                colors: [.orange, .yellow],
                                center: .center,
                                startRadius: minimumSize * 0.1,
                                endRadius: minimumSize * 1.2
                            )
                        )
                        .rotationEffect(.degrees(Double(iteration) * 36))
                        .frame(width: width * 0.7, height: height * 0.7)
                }
            }
            .rotationEffect(.degrees(start), anchor: .center)
            .animation(.linear(duration: 15).repeatForever(autoreverses: false), value: start)
            .onAppear {
                start += 360
            }
        }
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView()
            .frame(width: 200, height: 5)
    }
}
