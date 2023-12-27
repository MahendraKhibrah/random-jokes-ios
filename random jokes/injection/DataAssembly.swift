//
//  DataAsembly.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import Swinject

class DataAssembly : Assembly {
    func assemble(container: Container) {
        container.register(JokeApi.self, factory: {resolver in JokeApi()}
        )
        container.register(JokeRepository.self, factory: {resolver -> JokeRepository in
            let api = resolver.resolve(JokeApi.self)
            return JokeRepositoryImpl(api: api!)
        })
    }
    
}
