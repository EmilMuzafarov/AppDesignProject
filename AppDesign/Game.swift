//
//  Game.swift
//  AppDesign
//
//  Created by Student on 4/11/25.
//

import SwiftUI

struct Game: View {
    var body: some View {
        ZStack {
            //if !tasks.isEmpty {
                
        
            Image("mountain")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            /*VStack {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width:100, height: 100)
                    .offset(x: 100, y: 80)
                Spacer()
                Triangle(point: CGPoint(x: 1.25, y: 12.5), length: 50)
                Rectangle()
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height * 0.2)
            }
             */
        }
            
    }
}
#Preview {
    Game()
        .modelContainer(SampleData.shared.modelContainer)
}
