import SwiftUI
public struct FontManager {
    
    public static func registerFonts() {
        registerFont(bundle: Bundle.main, fontName: "Pretendard-Bold", fontExtension: ".ttf")
        
        registerFont(bundle: Bundle.main, fontName: "Pretendard-Light", fontExtension: ".ttf")
        
        registerFont(bundle: Bundle.main, fontName: "Pretendard-Regular", fontExtension: ".ttf")
        
        
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        print(Bundle.main)
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
