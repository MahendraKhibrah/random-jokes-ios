//
//  JokeRepository.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import RxSwift

protocol JokeRepository {
    func getJoke() -> Observable<Joke>
}
