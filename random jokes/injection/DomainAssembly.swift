//
//  DomainAssembly.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import Swinject

class DomainAssembly : Assembly {
    func assemble(container: Container) {
        container.register(GetJoke.self, factory: {resolver -> GetJoke in
            let repository = resolver.resolve(JokeRepository.self)
            return GetJoke(repository: repository!)
        })
    }
}
