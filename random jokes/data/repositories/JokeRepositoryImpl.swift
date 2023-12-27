//
//  JokeRepositoryImpl.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import RxSwift

class JokeRepositoryImpl : JokeRepository {
    let api : JokeApi
    
    init (api : JokeApi) {
        self.api = api
    }
    
    func getJoke() -> Observable<Joke>{
        return api.getJoke().map({
            response in Joke(displaySetup: response.setup ?? "", displayPunchline: response.punchline ?? "")
        })
    }
}
