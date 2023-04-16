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
                
                VStack{
                    
                    Text("You saved a Earth!!")
                        .font(.custom(CustomFont.mine, size: 40))
                        .foregroundColor(.green)
                       
                    
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
                    
                    VStack(spacing: 20){
                        
                        Text("Wow you get absorbed \(gamescene.nTree * 48 + (gamescene.nBulb * 48 * 4)) pounds")
                            .font(.custom(CustomFont.mine, size: 40))
                            .foregroundColor(.green)
                        
                        
                        
                        Text("We can't afford to ignore the environment issue anymore.")
                            .font(.custom(CustomFont.mine, size: 30))
                            .foregroundColor(.white)
                        
                        Text("Each of us need to make change")
                            .font(.custom(CustomFont.mine, size: 30))
                            .foregroundColor(.white)
                        Text("from our daily lives to prevent things getting worse.")
                            .font(.custom(CustomFont.mine, size: 30))
                            .foregroundColor(.white)
                        
                        Text("global homework to resovle as long as we live.")
                            .font(.custom(CustomFont.mine, size: 30))
                            .foregroundColor(.white)
                        
                        
                    }
                    .padding(.horizontal,20)
                    
                    
                   
                   
                    
                    NavigationLink(destination:ContentView(),isActive:$restart)
                    {
                        Button {
                            restart = true
                        } label: {
                            
                            VStack(spacing:20){
                                Text("Press to resatrt.")
                                    .font(.custom(CustomFont.mine, size: 30))
                                    .foregroundColor(.white)
                                Image("restart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:UIScreen.height/6,height: UIScreen.height/6)
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


