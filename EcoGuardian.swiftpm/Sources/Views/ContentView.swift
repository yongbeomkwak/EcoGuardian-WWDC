import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        let imageSize = UIScreen.height / 2.5
        
        
        NavigationView {
            ZStack{
            
                Image("BG")
                    .resizable()
                    .ignoresSafeArea()
                
                Color.black.opacity(0.5)
              
                Group{
                    if viewModel.page == .talk1 {
                        
                        
                        VStack(){
                            
                            VStack{
                                
                                Text("The Keeling Curve")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                
                                Image("graph")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: imageSize,height: imageSize)
                                   
                                
                                Text("World Resources Institute, Carbon Brief, WWF, The New Climate Economy")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }.padding(.top,20)
                            
                            
                            ConversationView(desriptions: Conversation.villain1,who: .villian,page:$viewModel.page)
                        }
                        
                    }
                    
                    else if viewModel.page == .talk2 {
                        
                        VStack{
                           
                            
                            ConversationView(desriptions: Conversation.you1,who: .you,page:$viewModel.page)
                        }
                        
                    }
                    
                    else if viewModel.page == .talk3 {
                        
                        VStack(spacing:10){
                            
                            VStack{
                                HStack{
                                    Spacer()
                                    DataView(image: "effect1", description: "Rising Sea Level")
                                    
                                    Spacer()
                                    
                                    DataView(image: "effect2", description: "Dying Coral")
                                    
                                    Spacer()
                                }
                                
                                
                                DataView(image: "effect3", description: "The vanishing garden")
                            }
                            
                           
                            
                            Text("World Resources Institute, Carbon Brief, WWF, The New Climate Economy")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.bottom,20)
                            
                            ConversationView(desriptions: Conversation.hero1,who: .hero,page:$viewModel.page)
                        }
                        
                        
                                     
                    }
                    
                    else if viewModel.page == .talk4 {
                        ConversationView(desriptions: Conversation.you2,who: .you,page:$viewModel.page)
                                     
                    }
                    
            
                    else if viewModel.page == .talk5 {
                        ConversationView(desriptions: Conversation.hero2,who: .hero,page:$viewModel.page)
                    }
                    
                    
                    else if viewModel.page == .howToPlay {
                        HowToPlayView(desriptions: Conversation.howtoPlay, page: $viewModel.page)
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
                .frame(width: UIScreen.width/10,height: UIScreen.width/10)
                .padding(.all,5)
                .background(who == .villian ? Color(hex: 0xD9D9D9) : who == .hero ? Color(hex: 0x65E05B) : .orange)
                .clipShape(Circle())
            Text(who.name)
                .font(.custom(CustomFont.bold, size: 20))
                .foregroundColor(.white)
                .padding()
                .background(Color.bubbleColor)
                .clipShape(ChatBubble())
        }
    
        
        
        
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
            
            VStack(spacing: 10) {
                ForEach(desriptions,id: \.content){ description in
                    
                        Text(description.content)
                        .font(.custom(description.isBold ? CustomFont.bold : CustomFont.regular, size: FontSize.conversation))
                            .foregroundColor(description.textColor)
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .padding(.leading,40)

                    
                    
                }
            }
            
            
            
        }
        .overlay(alignment:.topLeading,content: {
            ProfileImage(who: who)
                .offset(x:30,y:-UIScreen.width/10)
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
                    .frame(width:UIScreen.height/7,height: UIScreen.height/7)
                      
                    
                
                
                    
                
            }
            .padding(.trailing,20)
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        .padding(.bottom,50)
        
    }
}



struct DataView: View {
    
    var image:String
    var description:String
    
    var body: some View {
        let height = UIScreen.height / 4
        let width = UIScreen.height / 3
        
        VStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: width,height: height)
        }
        .padding(.top,30)
    }
}
