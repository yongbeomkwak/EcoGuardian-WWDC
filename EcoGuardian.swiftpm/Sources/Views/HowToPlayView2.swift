//
//  File.swift
//  
//
//  Created by yongbeomkwak on 2023/04/12.
//

import Foundation
import SwiftUI

struct HowToPlayView2: View {
    
    
    var desriptions:[Message]
    @Binding var page:Page
    
    
    var body: some View {
        
        VStack{
            Text("How To Play")
                .font(.custom(CustomFont.mine, size: 40))
        }
        
    }
}


struct HowToPlayView2_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView2(desriptions: Conversation.howtoPlay, page: .constant(.howToPlay))
    }
}
