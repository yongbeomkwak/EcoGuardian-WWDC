//
//  File.swift
//  
//
//  Created by yongbeomkwak on 2023/04/12.
//

import Foundation
import SwiftUI

struct HowToPlayView: View {
    
    
    var desriptions:[Item]
    @Binding var page:Page
    @State var goGame:Bool = false
    
    var body: some View {
        
        VStack(spacing: 0){
            
            
            VStack(spacing: 20) {
                Text("How To Play")
                    .font(.custom(CustomFont.mine, size: FontSize.mine + 10))
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
                NavigationLink(destination:GameView(page: $page),isActive: $goGame)
                {
                    EmptyView()
                }
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            .overlay(alignment:.bottomTrailing,content: {
                Button {
                    
                    goGame = true
                    
                } label: {
                    
                    
                    
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width:UIScreen.height/6,height: UIScreen.height/6)
                    
                }
                .padding(.trailing,20)
            })
            
            
            
            .padding(.vertical,30)
            .ignoresSafeArea()
            
            
            
        }
    }
    
    
    struct ItemDescriptionView: View {
        
        
        
        
        var image:String
        var content:[String]
        var height = UIScreen.height/4
        var width = UIScreen.width/2.5
        
        var body: some View {
            
            
            VStack{
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100,height: 100)
                
                VStack{
                    ForEach(content,id: \.self){ str in
                        
                        Text(str)
                            .font(.custom(CustomFont.bold, size: FontSize.gameDescription))
                            .foregroundColor(.white)
                        
                    }
                }
                
                
                
                
            }
            .frame(width:width,height:height)
            .padding(.horizontal)
            .background(.white.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            
        }
    }
    
}
