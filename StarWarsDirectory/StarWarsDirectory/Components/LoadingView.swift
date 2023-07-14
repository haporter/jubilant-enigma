//
//  LoadingView.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/12/23.
//

import SwiftUI
import Combine

struct LoadingView: View {
    
    private let imageResources: [ImageResource] = [.Icons.bb8,
                                                   .Icons.c3Po,
                                                   .Icons.lightsaber,
                                                   .Icons.cazaX,
                                                   .Icons.darthVader,
                                                   .Icons.deathStar,
                                                   .Icons.kyloRen,
                                                   .Icons.mandalorian,
                                                   .Icons.millenniumFalcon,
                                                   .Icons.stormtrooper,
                                                   .Icons.tieFighter,
                                                   .Icons.nounDeathStar]
    @State private var counter = 0
    @State private var currentImageResource: ImageResource = .Icons.bb8
    @State private var rotation: Double = 0
    
    var body: some View {
        Image(currentImageResource)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                startTimer()
            }
            .onChange(of: counter) { _, newValue in
                currentImageResource = imageResources[newValue % imageResources.count]
                withAnimation(.easeInOut(duration: 0.3)) {
                    rotation += 360
                }
            }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
            DispatchQueue.main.async {
                counter += 1
            }
        }
    }
}
