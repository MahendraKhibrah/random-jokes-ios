//
//  FeatureJokeAssembly.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import Swinject

class FeatureJokeAssembly : Assembly {
    func assemble(container: Container) {
        container.register(JokesViewModel.self, factory: {resolver -> JokesViewModel in
            let usecase = resolver.resolve(GetJoke.self)
            return JokesViewModel(usecase: usecase!)
            
        })
    }
    
    
}
