//
//  File.swift
//
//
//  Created by yongbeomkwak on 2023/04/06.
//

import Foundation
import SwiftUI
import SpriteKit

struct GameView: View {
    
    
    @Binding var page:Page
    
    
    
    @StateObject private var gamescene = GameScene()
    var body: some View {
     
        ZStack{
            
            if gamescene.isGameClear {
                
                
                
                
                Image("clear")
                    .resizable()
                    .scaledToFill()
    
                Image("cleanEarth")
                    .resizable()
                    .frame(width: UIScreen.height/2,height: UIScreen.height/2)
                    .scaledToFit()
                
                Color.white.opacity(0.4)
                
                VStack{
                    
                    Text("You saved a Earth")
                        .font(.custom(CustomFont.mine, size: 40))
                        .foregroundColor(.white)
                       // .frame(maxHeight: .infinity,alignment: .top)
                    
                    HStack {
                        Image("tree")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                        
                        Text("X \(gamescene.nTree)")
                            .font(.custom(CustomFont.mine, size: 40))
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                        Image("bulb")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                        
                        Text("X \(gamescene.nBulb)")
                            .font(.custom(CustomFont.mine, size: 40))
                            .foregroundColor(.white)
    
                    }
                    
                    
                    
                    
                    
                    
                    
                }
                .padding()
                .frame(maxHeight: .infinity)
                //.background(.white.opacity(0.4))
                
                
                NavigationLink(destination: ContentView()) {
                    Text("\(gamescene.nBulb)")
                }
            }
          
            
            else {
                
                SpriteView(scene: gamescene)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .ignoresSafeArea()
                
            }
        
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
        
        
        
    }
    
}


