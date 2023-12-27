//
//  Assembler.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import Swinject

extension Assembler {
    static let sharedAssembler : Assembler = {
        let container = Container()
        let assembler = Assembler([
            DataAssembly(),
            DomainAssembly(),
            FeatureJokeAssembly(),
        ], container: container)
        
        return assembler
    }()
}
