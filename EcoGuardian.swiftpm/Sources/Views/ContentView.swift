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
                        ConversationView(desriptions: Conversation.villain1,isVillain: true)           
                    }
                    
                    else if viewModel.page == .talk2 {
                        ConversationView(desriptions: Conversation.hero1,isVillain: false)
                            
                    }
                    
                    else if viewModel.page == .talk3 {
                        ConversationView(desriptions: Conversation.villain2,isVillain: true)
                    }
                    
                    else if viewModel.page == .talk4 {
                        ConversationView(desriptions: Conversation.hero2,isVillain: false)
                    }
                    else if viewModel.page == .howToPlay {
                        ConversationView(desriptions: Conversation.howtoPlay, isVillain: false)
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
                
                
                            
               

//                else if viewModel.page == .talk2 {
//                    ConversationView(isVillain: false,desriptions: Conversation.hero1,page: $viewModel.page)
//                }
//
//                else if viewModel.page == .talk3 {
//                    ConversationView(isVillain: true, desriptions: Conversation.villain2, page: $viewModel.page)
//                }
//                else if viewModel.page == .talk4 {
//                    ConversationView(isVillain: false, desriptions: Conversation.hero2, page: $viewModel.page)
//                }
//
//                else if viewModel.page == .howToPlay {
//
//                }
                
                
                if viewModel.page != .game {
                    Button {
                        switch viewModel.page {
                                                
                            case .talk1:
                            viewModel.page = .talk2
                            case .talk2:
                            viewModel.page = .talk3
                            case .talk3:
                            viewModel.page = .talk4
                            case .talk4:
                            viewModel.page = .howToPlay
                            case .howToPlay:
                            viewModel.page = .game
                            
                            default:
                                print("Hello")
                            
                            }
                    } label: {
                        
                        HStack {
                            Text(viewModel.page.buttonTitle)
                                .font(.custom(CustomFont.regular, size: 20))
                              
                            
                            Image(systemName: "play.fill")
                              
                            
                        }
                        
//                        .foregroundColor(Color.white)
//                        .padding()
//                        .background(Color.bubbleColor.cornerRadius(10).shadow(radius: 10))
                            
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    .frame(maxHeight:.infinity,alignment:.bottom)
                    .padding(.bottom,70)
                }
                
            
                

               
                
                
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
    
    var isVillain:Bool
    
    var body: some View {
        
        
        
        
        Image(isVillain ? "villain" : "speakBird")
            .resizable()
            .scaledToFit()
            .frame(width: 35,height: 35)
            .padding(.all,5)
            .background(isVillain ? Color(hex: 0xD9D9D9) : Color(hex: 0x65E05B))
            .clipShape(Circle())
           // .overlay(Circle().stroke(Color.bubbleColor,lineWidth: 4))
        
        
        
    }
    
    
    
    
    
}

struct ConversationView: View {
    

    var desriptions:[Message]
    
    let offset:CGFloat = -50
    
    var isVillain:Bool
    
    
    var body: some View {
        
        VStack(spacing:30){
         
            ForEach(desriptions,id:\.content) { desription in
                
                
                
                HStack{
                    ProfileImage(isVillain: isVillain)
                        .padding(.leading,30)
                        .offset(x:0,y: desription.content == "graph" ? -offset + 50 : 0)
                    
                    
                    
                    
                    if desription.isImage {
                        
                        if(desription.content == "graph")
                        {
                            Image(desription.content)
                                .resizable()
                                .frame(width:300,height: 300)
                                .scaledToFit()
                                .clipShape(ChatBubble())
                                .offset(x:0,y: offset)
                        }
                        
                        else {
                            Image(desription.content)
                                .resizable()
                                .frame(width:50,height: 50)
                                .scaledToFit()
                                .padding()
                                .background(Color.bubbleColor)
                                .clipShape(ChatBubble())
                                .offset(x:0,y: offset)
                        }
                        
                      
                    }
                    
                    else {
                        Text(desription.content)
                            .padding()
                            .font(.custom(CustomFont.regular, size: 20))
                            .foregroundColor(Color.white)
                            .background(Color.bubbleColor)
                            .clipShape(ChatBubble())
                            .offset(x:0,y: offset)
                    }
                    
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
                    
            }
        }
       
        
        
       
        
        
    }
    
}

              
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
