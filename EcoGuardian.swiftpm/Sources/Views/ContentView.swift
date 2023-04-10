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
                        ConversationView(desriptions: Conversation.villain1,isVillain: true,page:$viewModel.page)
                    }
                    
                    else if viewModel.page == .talk2 {
                        ConversationView(desriptions: Conversation.hero1,isVillain: false,page:$viewModel.page)
                            
                    }
                    
                    else if viewModel.page == .talk3 {
                        ConversationView(desriptions: Conversation.villain2,isVillain: true,page:$viewModel.page)
                    }
                    
                    else if viewModel.page == .talk4 {
                        ConversationView(desriptions: Conversation.hero2,isVillain: false,page:$viewModel.page)
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
    
    var isVillain:Bool
    
    var body: some View {
        
        
        
        
        Image(isVillain ? "villain" : "speakBird")
            .resizable()
            .scaledToFit()
            .frame(width: 150,height: 150)
            .padding(.all,5)
            .background(isVillain ? Color(hex: 0xD9D9D9) : Color(hex: 0x65E05B))
            .clipShape(Circle())
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
    var isVillain:Bool
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
            ProfileImage(isVillain: isVillain)
                .offset(x:30,y:-170)
        })
        .overlay(alignment:.topTrailing, content: {
            Button {
               
                switch page {
                                   
               case .talk1:
               page = .talk2
               case .talk2:
               page = .talk3
               case .talk3:
               page = .talk4
               case .talk4:
                page = .howToPlay
               case .howToPlay:
                    page = .game
               
               default:
                   print("Hello")
               
               }
                
            } label: {
                
                HStack {
                    Text(page.buttonTitle)
                        .font(.custom(CustomFont.regular, size: 20))
                      
                    
                    Image(systemName: "play.fill")
                      
                    
                }
                
                    
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            .foregroundColor(.white)
            .offset(x:-20,y:-100)
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
            ProfileImage(isVillain: false)
                .offset(x:30,y:-170)
        })
        .overlay(alignment:.topTrailing, content: {
            Button {
               
                switch page {
                                   
               case .talk1:
               page = .talk2
               case .talk2:
               page = .talk3
               case .talk3:
               page = .talk4
               case .talk4:
                page = .howToPlay
               case .howToPlay:
                    page = .game
               
               default:
                   print("Hello")
               
               }
                
            } label: {
                
                HStack {
                    Text(page.buttonTitle)
                        .font(.custom(CustomFont.regular, size: 20))
                      
                    
                    Image(systemName: "play.fill")
                      
                    
                }
                
                    
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            .foregroundColor(.white)
            .offset(x:-20,y:-100)
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        .padding(.bottom,50)
        .background(.black.opacity(0.5))
    }
}
