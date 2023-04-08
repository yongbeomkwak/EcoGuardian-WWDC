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
            
            SpriteView(scene: gamescene)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                    .ignoresSafeArea()
            
            
            
        }
        
        
    }
    
}


