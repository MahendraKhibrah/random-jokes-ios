//
//  JokesViewModel.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import RxSwift
import RxCocoa

class JokesViewModel {
    var joke : BehaviorRelay<Joke> = BehaviorRelay(value: Joke(displaySetup: "", displayPunchline: ""))
    var getJokeLoading : BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    private let getJokeUsecase : GetJoke
    private var disposeBag = DisposeBag()
    
    init(usecase : GetJoke) {
        self.getJokeUsecase = usecase
    }
    
    @objc func getJoke()  {
        self.getJokeLoading.accept(true)
        getJokeUsecase.run()
            .observe(on: MainScheduler.instance)
            .subscribe{ result in
                self.joke.accept(result)
                self.getJokeLoading.accept(false)
            } onCompleted: {
                self.getJokeLoading.accept(false)
            }
            .disposed(by: disposeBag)
    }

    deinit {
        disposeBag = DisposeBag()
    }
}
