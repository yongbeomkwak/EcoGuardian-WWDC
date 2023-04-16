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
                
                VStack(spacing: 30){
                    
                    VStack{
                        Text("You saved a Earth!!")
                            .font(.custom(CustomFont.mine, size: 40))
                            .foregroundColor(.green)
                            .padding()
                           
                        
                        HStack {
                            Image("tree")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                            
                            Text("X \(gamescene.nTree) = \(gamescene.nTree * 48)")
                                .font(.custom(CustomFont.mine, size: 40))
                                .foregroundColor(.white)
                        }
                        .frame(width:UIScreen.width/4,alignment: .leading)
                        
                        HStack{
                            Image("bulb")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                            
                            Text("X \(gamescene.nBulb) = \(gamescene.nBulb * 48 * 4)")
                                .font(.custom(CustomFont.mine, size: 40))
                                .foregroundColor(.white)
        
                        }
                        .frame(width:UIScreen.width/4,alignment: .leading)
                    }
                    
                    
                    
                    VStack(spacing: 15){
                        
                        Text("Wow you get absorbed \(gamescene.nTree * 48 + (gamescene.nBulb * 48 * 4)) pounds")
                            .font(.custom(CustomFont.mine, size: 30))
                            .foregroundColor(.green)
                        
                        
                        
                        Text("We can't blindfold ourselves in front of the environment issue anymore.")
                            .font(.custom(CustomFont.regular, size: 30))
                            .foregroundColor(.white)
                        
                        Text("Each and every one of us has to make a change.")
                            .font(.custom(CustomFont.regular, size: 30))
                            .foregroundColor(.white)
                        Text("The changes we make in our daily lives can stop things from getting worse.")
                            .font(.custom(CustomFont.regular, size: 30))
                            .foregroundColor(.white)
                        
                        Text("It's the homework for all of us living in this earth as long as we're living in here.")
                            .font(.custom(CustomFont.regular, size: 30))
                            .foregroundColor(.white)
                        
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical)
                    
                    
                   
                   
                    
                    NavigationLink(destination:ContentView(),isActive:$restart)
                    {
                        Button {
                            restart = true
                        } label: {
                            
                            VStack(spacing:20){
                                Text("Press to resatrt.")
                                    .font(.custom(CustomFont.mine, size: 30))
                                    .foregroundColor(.green)
                                Image("restart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:UIScreen.height/7,height: UIScreen.height/7)
                            }
                           
                        }

                    }.padding(.top,30)
                 
                    Text("BGM : Hexacube - Red Heart Comes To You")
                        .font(.custom(CustomFont.light, size: 20))
                        .foregroundColor(.white)
                    
                    Text("GameFont : MineCrafter")
                        .font(.custom(CustomFont.light, size: 20))
                        .foregroundColor(.white)
                    
                }
                .padding(.horizontal,20)
                .padding(.vertical,10)
                .background(.black.opacity(0.5))
                
                
                
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


