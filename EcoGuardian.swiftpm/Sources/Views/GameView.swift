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
    @State var restart:Bool = false
    
    
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
                        .foregroundColor(.green)
                       
                    
                    HStack {
                        Image("tree")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                        
                        Text("X \(gamescene.nTree) = \(Int(gamescene.nTree * 48))")
                            .font(.custom(CustomFont.mine, size: 40))
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                        Image("bulb")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                        
                        Text("X \(gamescene.nBulb) = \(Int(gamescene.nBulb * 48 * 4))")
                            .font(.custom(CustomFont.mine, size: 40))
                            .foregroundColor(.white)
    
                    }
                    
                    Text("youa adfadfadfadsfs \(Int(gamescene.nTree * 48) + Int(gamescene.nBulb * 48 * 4)) pounds )")
                        .font(.custom(CustomFont.mine, size: 40))
                        .foregroundColor(.white)
                    
                    Text("saafadsfsdkf;lsadf;aklsdflsd;kfa;sdlkfsda;klfdskf;dsa;flk")
                        .font(.custom(CustomFont.mine, size: 40))
                        .foregroundColor(.white)
                    
                    NavigationLink(destination:ContentView(),isActive:$restart)
                    {
                        Button {
                            restart = true
                        } label: {
                            Image("restart")
                                .resizable()
                                .scaledToFit()
                                .frame(width:UIScreen.height/6,height: UIScreen.height/6)
                        }

                    }
                 
                    
                }
                .padding()
                .frame(maxHeight: .infinity)
                
                
                
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


