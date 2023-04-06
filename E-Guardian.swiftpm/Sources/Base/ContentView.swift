import SwiftUI





struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack{
            Image("BG")
                .resizable()
            
            if viewModel.page == .talk1 {
                ConversationView(isVillain: true,desription: Conversation.villain1,page: $viewModel.page)
            }
            
            else if viewModel.page == .talk2 {
                ConversationView(isVillain: false,desription: Conversation.villain1,page: $viewModel.page)
            }
            
            
           
           
            
            
        }
        .ignoresSafeArea()
        
    }
}


struct ConversationView: View {
    
    var isVillain:Bool
    var desription:String
    @Binding var page:Page
    
    
    var body: some View {
        
        VStack(spacing: 20){
            
            
            Text("E-Guardian")
                .font(.system(.largeTitle))
                .bold()
                .padding(.top,20)
                

            Text(desription)
                .font(.title2)
                .lineSpacing(10)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            
            
            
            
            if isVillain {
                ZStack {
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
                            .padding(25)
                            .background(.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.green, lineWidth: 3)
                            )
                    }
                    
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
                
            
            }
            
            else {
                ZStack {
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
                            .padding(25)
                            .background(.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.green, lineWidth: 3)
                            )
                    }
                    
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
                    
                }            }
            
            
            

            
            
        }
        .frame(width: UIScreen.width - 200, height:UIScreen.height / 2)
        .padding(20)
        .border(.white,width: 3)
        .background(Color.villonTextBgColor)        
        .cornerRadius(15)
        
        
        
        
    }
    
}

//                .onAppear{
//                    for family in UIFont.familyNames {
//                        print(family)
//
//                        for names in UIFont.fontNames(forFamilyName: family) {
//
//                            print("== \(names)")
//
//                        }
//                    }
//                }
