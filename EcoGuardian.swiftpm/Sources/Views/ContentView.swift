import SwiftUI





struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        
        NavigationView {
            ZStack{
                
                Image("BG")
                    .resizable()
                
              
                Group{
                    if viewModel.page == .talk1 {
                        ConversationView(desriptions: Conversation.villain1,who: .villian,page:$viewModel.page)
                    }
                    
                    else if viewModel.page == .talk2 {
                        ConversationView(desriptions: Conversation.you1,who: .you,page:$viewModel.page)
                    }
                    
                    else if viewModel.page == .talk3 {
                        ConversationView(desriptions: Conversation.hero1,who: .hero,page:$viewModel.page)
                                     
                    }
                    
                    else if viewModel.page == .talk4 {
                        ConversationView(desriptions: Conversation.you2,who: .you,page:$viewModel.page)
                                     
                    }
                    
            
                    else if viewModel.page == .talk5 {
                        ConversationView(desriptions: Conversation.villain2,who: .villian,page:$viewModel.page)
                    }
                    
                    else if viewModel.page == .talk6 {
                        ConversationView(desriptions: Conversation.you3,who: .you,page:$viewModel.page)
                                     
                    }
                    
                    else if viewModel.page == .talk7 {
                        ConversationView(desriptions: Conversation.hero2,who: .hero,page:$viewModel.page)
                    }
                    
                    else if viewModel.page == .talk8 {
                        ConversationView(desriptions: Conversation.you4,who: .you,page:$viewModel.page)
                                     
                    }
                    
                    else if viewModel.page == .howToPlay {
                        HowToPlayView(desriptions: Conversation.howtoPlay, page:$viewModel.page)
                    }
                    else if viewModel.page == .game {
                       
                        NavigationLink(destination: GameView(page: $viewModel.page)) {
                            Text("지구를 구하러가자!")
                                .font(.custom(CustomFont.regular, size: 20))
                                .foregroundColor(Color.white)
                                .padding()
                                .background(Color.bubbleColor.cornerRadius(10).shadow(radius: 10))
                        }
                    }
                    
                    
                }
                .transition(.opacity.animation(.easeIn))
                .animation(.easeIn,value:viewModel.page)

                
                
               
                
                
            }
            .ignoresSafeArea()
        }
        .statusBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}


struct ChatBubble: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 20, y: height))
        
        path.addLine(to: CGPoint(x: width - 15, y: height))
        
        path.addCurve(to: CGPoint(x: width, y: height - 15), controlPoint1: CGPoint(x: width - 8, y: height), controlPoint2: CGPoint(x: width, y: height - 8))
        
        path.addLine(to: CGPoint(x: width, y: 15))
        
        path.addCurve(to: CGPoint(x: width - 15, y: 0), controlPoint1: CGPoint(x: width, y: 8), controlPoint2: CGPoint(x: width - 8, y: 0))
        
        path.addLine(to: CGPoint(x: 20, y: 0 ))
        
        path.addCurve(to: CGPoint(x: 5, y: 15), controlPoint1: CGPoint(x: 12, y: 0), controlPoint2: CGPoint(x: 5, y: 8))
        
        path.addLine(to: CGPoint(x: 5, y: height - 10 ))
        
        path.addCurve(to: CGPoint(x: 0, y: height), controlPoint1: CGPoint(x: 5, y: height - 1), controlPoint2: CGPoint(x: 0, y: height))
        
        path.addLine(to: CGPoint(x: -1, y: height ))
        
        path.addCurve(to: CGPoint(x: 12, y: height - 4), controlPoint1: CGPoint(x: 4, y: height + 1), controlPoint2: CGPoint(x: 8, y: height - 1))
        
        path.addCurve(to: CGPoint(x: 20, y: height), controlPoint1: CGPoint(x: 15, y: height), controlPoint2: CGPoint(x: 20, y: height ))
        
        return Path(path.cgPath)
    }
    

   

}



struct ProfileImage : View {
    
    var who:Characteres
    
    var body: some View {
        
        
        
        
        HStack(spacing: 20){
            Image(who == .villian ? "villain" :  who == .hero ? "speakBird" : "you")
                .resizable()
                .scaledToFit()
                .frame(width: 150,height: 150)
                .padding(.all,5)
                .background(who == .villian ? Color(hex: 0xD9D9D9) : who == .hero ? Color(hex: 0x65E05B) : .orange)
                .clipShape(Circle())
            Text(who.name)
                .foregroundColor(.white)
                .padding()
                .background(Color.bubbleColor)
                .clipShape(ChatBubble())
        }
           // .overlay(Circle().stroke(Color.bubbleColor,lineWidth: 4))
        
        
        
    }
    
    
    
    
    
}



              
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

struct ConversationView: View {
    
    var desriptions:[Message]
    var who:Characteres
    @Binding var page:Page
    
    var body: some View {
        VStack(spacing: 20){
            
            Divider()
                .frame(maxWidth: .infinity,maxHeight: 1,alignment: .top)
                .background(.white)
                .padding(.horizontal)
            
            
            ForEach(desriptions,id: \.content){ description in
                
                if description.isImage {
                    Image(description.content)
                        .resizable()
                        .scaledToFit()
                        .frame(width:300,height: 300)
                }
                
                else {
                    Text(description.content)
                        .font(.custom(CustomFont.regular, size: 30))
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .padding(.leading,40)
                }
                
                
            }
            
        }
        .overlay(alignment:.topLeading,content: {
            ProfileImage(who: who)
                .offset(x:30,y:-170)
        })
        .overlay(alignment:.bottomTrailing, content: {
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
            .padding(.trailing,20)
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        .padding(.bottom,50)
        .background(.black.opacity(0.5))
    }
}

struct HowToPlayView: View {
    
    var desriptions:[Message]
    @Binding var page:Page
    
    var body: some View {
        VStack(spacing: 10){
            
            Divider()
                .frame(maxWidth: .infinity,maxHeight: 1,alignment: .top)
                .background(.white)
                .padding(.horizontal)
            
            Text(desriptions[0].content)
                .font(.custom(CustomFont.regular, size: 30))
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,40)
            
            Text(desriptions[1].content)
                .font(.custom(CustomFont.regular, size: 30))
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,40)
            
            Image(desriptions[2].content)
                .resizable()
                .scaledToFit()
                .frame(width:100,height: 100)
            
            Text(desriptions[3].content)
                .font(.custom(CustomFont.regular, size: 30))
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,40)
            
            Text(desriptions[4].content)
                .font(.custom(CustomFont.regular, size: 30))
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,40)
            
            HStack {
                Image(desriptions[5].content)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100,height: 100)
                Image(desriptions[6].content)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100,height: 100)
            }
            
            Text(desriptions[7].content)
                .font(.custom(CustomFont.regular, size: 30))
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,40)
            
            Image(desriptions[8].content)
                .resizable()
                .scaledToFit()
                .frame(width:100,height: 100)
            
            Text(desriptions[9].content)
                .font(.custom(CustomFont.regular, size: 30))
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,40)
            
            
            
        
            
            
        }
        .overlay(alignment:.topLeading,content: {
            ProfileImage(who: .hero)
                .offset(x:30,y:-170)
        })
        .overlay(alignment:.bottomTrailing, content: {
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
            .padding(.trailing,20)
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        .padding(.bottom,50)
        .background(.black.opacity(0.5))
    }
}
