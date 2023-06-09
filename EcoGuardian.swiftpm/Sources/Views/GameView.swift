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
    
    let restartButtonWidth = UIScreen.width / 4
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
                
                Color.black.opacity(0.5)
                
                VStack(spacing: 20){
                    
                    VStack{
                        Text("You saved a Earth!!")
                            .font(.custom(CustomFont.mine, size: FontSize.mine + 20))
                            .foregroundColor(.green)
                            .padding()
                           
                        
                        HStack {
                            Image("tree")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                            
                            Text("X \(gamescene.nTree) = \(gamescene.nTree * 48)")
                                .font(.custom(CustomFont.mine, size: FontSize.mine))
                                .foregroundColor(.white)
                        }
                        .frame(width:UIScreen.width/4,alignment: .leading)
                        
                        HStack{
                            Image("bulb")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                            
                            Text("X \(gamescene.nBulb) = \(gamescene.nBulb * 48 * 4)")
                                .font(.custom(CustomFont.mine, size: FontSize.mine))
                                .foregroundColor(.white)
        
                        }
                        .frame(width:UIScreen.width/4,alignment: .leading)
                        
                        HStack(alignment:.bottom){
                            
                            Text("Wow, you just absorbed")
                                .font(.custom(CustomFont.mine, size: FontSize.mine))
                                .foregroundColor(.green)
                            
                            Text("\(gamescene.nTree * 48 + (gamescene.nBulb * 48 * 4))")
                                .font(.custom(CustomFont.mine, size: FontSize.mine + 10))
                                .foregroundColor(.white)
                            
                            Text("pounds of carbon")
                                .font(.custom(CustomFont.mine, size: FontSize.mine))
                                .foregroundColor(.green)
                        }
                    }
                    
                    
                    
                    VStack(spacing: 15){
                                     
                        
                        Text("We can't ignore environmental issues any longer.")
                            .font(.custom(CustomFont.regular, size: FontSize.advice))
                            .foregroundColor(.white)
                        
                        Text("Everyone needs to make a change.")
                            .font(.custom(CustomFont.regular, size: FontSize.advice))
                            .foregroundColor(.white)
                        Text("Our daily choices can make a difference.")
                            .font(.custom(CustomFont.regular, size: FontSize.advice))
                            .foregroundColor(.white)
                        
                        Text("It's our collective responsibility to take care of our planet.")
                            .font(.custom(CustomFont.regular, size: FontSize.advice))
                            .foregroundColor(.white)
                        
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical)
                    
                    
                   
                   
                    
                    NavigationLink(destination:ContentView(),isActive:$restart)
                    {
                        Button {
                            restart = true
                        } label: {
                        
                            ZStack{
                                Text("Press to resatrt")
                                    .font(.custom(CustomFont.mine, size: FontSize.mine))
                                    .foregroundColor(.green)
                                    .padding()
                                
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.green, lineWidth: 4)
                            }
                                
                            
                           
                        }
                        .frame(width:restartButtonWidth,height:restartButtonWidth / 5)

                    }.padding(.top,30)
                 
                    VStack(spacing:5){
                        Text("BGM : Hexacube - Red Heart Comes To You")
                            .font(.caption)
                            .foregroundColor(.white)
                        
                        Text("GameFont : MineCrafter")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    
                    
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


