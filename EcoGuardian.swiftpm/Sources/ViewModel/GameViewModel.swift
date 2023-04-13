//
//  File.swift
//  
//
//  Created by yongbeomkwak on 2023/04/13.
//

import Foundation


import Foundation

final class GameViewModel: ObservableObject {
    
    @Published var nTree:Int
    @Published var nBulb:Int

    init(){
        self.nTree = 0
        self.nBulb = 0
    }
    
    
}


