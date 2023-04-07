//
//  File.swift
//
//
//  Created by yongbeomkwak on 2023/04/06.
//



import Foundation

final class ContentViewModel: ObservableObject {
    
    @Published var page:Page
    
    init(){
        self.page = .talk1
    }
    
    
}
