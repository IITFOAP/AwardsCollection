//
//  SceneryView.swift
//  AwardsCollectionApp
//
//  Created by Рома Баранов on 26.06.2023.
//

import SwiftUI

struct SceneryView: View {
    @State private var start = false
    @State private var startCloud = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let minimumSize = min(width, height)
            let nearLine = minimumSize * 0.1
            let waveEnd = minimumSize * 0.7
            let downWave = minimumSize / 1.5
            let upWave = downWave + 5
            let iteration = Int(minimumSize / 5)
            var nextDownWave = nearLine
            var nextUpWave = nearLine
            
            Image(systemName: "cloud.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: minimumSize / 5, height: minimumSize / 7)
                .offset(x: startCloud ? nearLine : waveEnd - 10, y: minimumSize / 3)
                .animation(
                    .easeInOut(duration: 20)
                    .repeatForever(autoreverses: true),
                    value: startCloud
                )
                .onAppear {
                    startCloud.toggle()
                }

            SunView()
                .frame(width: minimumSize * 0.2, height: minimumSize * 0.03)
                .offset(x: nearLine, y: nearLine + 10)

                
            Image(systemName: "sailboat.fill")
                .resizable()
                .foregroundColor(.brown)
                .frame(width: minimumSize / 7, height: minimumSize / 7)
                .offset(x: start ? waveEnd : nearLine , y: minimumSize / 1.78 )
                .animation(
                    .easeInOut(duration: 6)
                    .repeatForever(autoreverses: true),
                    value: start
                )
                .onAppear {
                    start.toggle()
                }
            
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: nearLine, y: downWave + 5))
                    
                    for _ in 0..<iteration {
                        nextDownWave += 10
                        if nextDownWave > width - nearLine {
                            break
                        }
                        
                        path.addQuadCurve(
                            to: CGPoint(x: nextUpWave, y: upWave),
                            control: CGPoint(x: nextDownWave, y: downWave)
                        )
                        nextUpWave = nextDownWave
                    }
                    
                    path.addLine(to: CGPoint(x: width - nearLine - 10, y: height - nearLine))
                    path.addLine(to: CGPoint(x: nearLine, y: height - nearLine))
                    path.closeSubpath()
                }
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.cyan, .blue, .cyan, .blue]),
                        startPoint: UnitPoint(x: width, y: height),
                        endPoint: UnitPoint(x: width, y: height)
                    )
                )
            }
        }
    }
}


struct SceneryView_Previews: PreviewProvider {
    static var previews: some View {
        SceneryView()
            .frame(width: 300, height: 300)
    }
}

