import SwiftUI
import SpriteKit


struct ContentView: View {
    
    var scene: SKScene {
            let scene = BeforeStartScence()
            scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            scene.scaleMode = .fill
            return scene
         }
    
    var body: some View {
        GeometryReader { (geometry) in
                    
        SpriteView(scene: self.scene)
                .ignoresSafeArea()
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
        .onAppear{
            
            for family in UIFont.familyNames {
                    print(family)
            
                for names in UIFont.fontNames(forFamilyName: family) {

                    print("== \(names)")

                }
        }
            
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
