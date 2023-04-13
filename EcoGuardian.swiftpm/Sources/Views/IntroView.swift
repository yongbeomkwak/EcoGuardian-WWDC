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
                    .zIndex(1)
                
                    
                
                VStack{
                    Image("dirtyEarth")
                        .resizable()
                        .frame(width: UIScreen.height/2,height: UIScreen.height/2)
                        .scaledToFit()
                        .padding(.bottom,safeArea.bottom)

                    NavigationLink(destination: ContentView()) {
                        SaveButton()
                    }
                }
                .zIndex(2)
                
                
                
                
                
            
                
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
//        .onAppear{
//            for family in UIFont.familyNames {
//                        print(family)
//                        
//                        for names in UIFont.fontNames(forFamilyName: family) {
//                            print("== \(names)")
//                        }
//            }
//        }
        
        
    }
}



