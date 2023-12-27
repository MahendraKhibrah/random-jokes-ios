//
//  GetJoke.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import RxSwift

class GetJoke{
    var repository : JokeRepository
    
    init(repository: JokeRepository) {
        self.repository = repository
    }
    
    func run() -> Observable<Joke>{
        return repository.getJoke()
    }
}
