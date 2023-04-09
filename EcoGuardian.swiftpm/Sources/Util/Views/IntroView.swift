//
//  File.swift
//  
//
//  Created by yongbeomkwak on 2023/04/08.
//

import Foundation
import SwiftUI
import SpriteKit

struct IntroView: View {
    
    var scene =  IntroScene()
 
    var body: some View {
     
        NavigationView {
            ZStack {
                
                SpriteView(scene: scene)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .ignoresSafeArea()
                
                
//                LinearGradient(colors: [Color(hex: 0x545353),Color(hex: 0x7C7171)], startPoint: .top, endPoint: .bottom)
                    
                
                VStack{
                    Image("earth")
                        .resizable()
                        .frame(width: 500,height: 500)
                        .scaledToFit()
                        .padding(.bottom,safeArea.bottom)

                    NavigationLink(destination: GameView()) {
                        SaveButton()
                    }
                }
                
                
                
                
                
            
                
            }
            
            .ignoresSafeArea()
        }
        .statusBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
       
        
    }
    
}

struct SaveButton: View {
    var body: some View {
    
        
        ZStack{
            Image("button1")
            Text("Save the Earth")
                .font(.custom(CustomFont.bold, size: 20))
                .foregroundColor(.white)
        }
        
        
    }
}


struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}


