import SwiftUI





struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        
        NavigationView {
            ZStack{
                
                Image("BG")
                    .resizable()
                
                HStack {
                    
                    
                    
                    Image("graph")
                        .resizable()
                        .frame(width:200,height: 200)
                        .scaledToFit()
                        //.padding()
                        //.foregroundColor(.white)
                        //.font(.custom(CustomFont.regular, size: 30))
                        //.background(Color.bubbleColor)
                        .clipShape(ChatBubble())
                    Spacer()
                }
                
                
                    
                
//                if viewModel.page == .talk1 {
//                    ConversationView(isVillain: true,desriptions: Conversation.villain1,page: $viewModel.page)
//                }
//
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
//                    NavigationLink(destination: GameView(page: $viewModel.page)) {
//                        Text("Start")
//                    }
//                }
                
                
               
               
                
                
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



struct ConversationView: View {
    
    var isVillain:Bool
    var desriptions:[String]
    @Binding var page:Page
    
    
    var body: some View {
        
        VStack(spacing: 10){

            
            ForEach(desriptions,id:\.self){ desription in
                
                Text(desription)
                    .font(.system(.title))
                    .fontWeight(.medium)
                    .padding(.top,10)

            }
//            .onAppear{
//                for family in UIFont.familyNames {
//                    print(family)
//
//                    for names in UIFont.fontNames(forFamilyName: family) {
//
//                        print("== \(names)")
//
//                    }
//                }
//            }
            

            
            
            
            if page == .talk1 {
                Image("graph")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.height/4)
            
            }
    
            
            
            
            ZStack{
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
                        print("Hello")
                    }
                    
                    
                } label: {
                    
                    Text("Next")
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                        .padding(.horizontal,30)
                        .padding(.vertical,20)
                        .background(.white)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.green, lineWidth: 3)
                        )
                }
                
                if isVillain {
                    VStack{
                        
                        Text(Character.villainName)
                            .font(.title3)
                            .bold()
                            .foregroundColor(.villonColor)
                            .frame(alignment: .leading)
                        
                        Image("villain")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100,height: 100)
                        
                        
                            
                    }
                    .padding(.trailing,20)
                    .frame(maxWidth: .infinity,alignment: .trailing)
                }
                else {
                    
                    VStack{
                        
                        Text(Character.heroName)
                            .font(.title3)
                            .bold()
                            .foregroundColor(.villonColor)
                            .frame(alignment: .leading)
                        
                        Image("speakBear")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100,height: 100)
                            
                    }
                    .padding(.leading,20)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                }
            }
            .frame(maxHeight: .infinity,alignment: .bottom)
        
           
        
        }
        .frame(width: UIScreen.width - 200, height:UIScreen.height / 1.5)
        .padding(.bottom,50)
        .border(.white,width: 3)
        //.background(Color.villonTextBgColor)
        .cornerRadius(15)
        
        
        
        
    }
    
}

              
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
