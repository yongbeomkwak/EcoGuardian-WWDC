//
//  File.swift
//  
//
//  Created by yongbeomkwak on 2023/04/12.
//

import Foundation
import SwiftUI

struct HowToPlayView2: View {
    
    
    var desriptions:[Item]
    @Binding var page:Page
    
    var body: some View {
        
        VStack(spacing: 0){
            
            
            VStack {
                Text("How To Play")
                    .font(.custom(CustomFont.mine, size: 50))
                    .foregroundColor(.white)
                
                
                HStack(alignment: .top, spacing: 20){
                    
                    ItemDescriptionView(image: desriptions[0].item, content: desriptions[0].content)
                    
                    ItemDescriptionView(image: desriptions[1].item, content: desriptions[1].content)
                    
                }
                .frame(maxWidth: .infinity)
                
                HStack(alignment: .top, spacing: 20){
                    
                    ItemDescriptionView(image: desriptions[2].item, content: desriptions[2].content)
                    
                    ItemDescriptionView(image: desriptions[3].item, content: desriptions[3].content)
                    
                }
                .frame(maxWidth: .infinity)
                
                HStack(alignment: .top, spacing: 20){
                    
                    ItemDescriptionView(image: desriptions[4].item, content: desriptions[4].content)
                    
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
            }
            
            .overlay(alignment:.bottomTrailing,content: {
                Button {
                    
                    switch page {
                        
                        
                    case .talk1:
                        page = .talk2
                    case .talk2:
                        page = .talk3
                    case .talk3:
                        page = .talk4
                    case .talk4:
                        page = .talk5
                    case .talk5:
                        page = .talk6
                    case .talk6:
                        page = .talk7
                    case .talk7:
                        page = .talk8
                    case .talk8:
                        page = .howToPlay
                    case .howToPlay:
                        page = .game
                    case .game:
                        page = .game
                    }
                    
                } label: {
                    
                    
                    
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width:130,height: 130)
                    
                }
                .padding(.bottom,50)
                .padding(.trailing,20)
            })
            
            
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            .padding(.vertical)
            .ignoresSafeArea()
            
            
            
        }
    }
    
    
    struct ItemDescriptionView: View {
        
        var image:String
        var content:[String]
        
        var body: some View {
            
            
            VStack{
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100,height: 100)
                
                VStack{
                    ForEach(content,id: \.self){ str in
                        
                        Text(str)
                            .font(.custom(CustomFont.regular, size: 30))
                            .foregroundColor(.black)
                        
                    }
                }
                
                
                
                
                
                
                
                
            }
            .frame(width:UIScreen.width/2.5,height: UIScreen.width/5)
            .padding(.horizontal)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            
        }
    }
    
}
