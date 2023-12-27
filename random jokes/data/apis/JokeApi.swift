//
//  JokeApi.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import Foundation
import Alamofire
import RxSwift

class JokeApi {
    func getJoke() -> Observable<JokeDto> {
        return Observable<JokeDto>.create({observer in
            AF.request("https://official-joke-api.appspot.com/random_joke").response {
                response in
                switch response.result {
                case .success(let data):
                    let joke = JokeDto(JSONString: String(data: data!, encoding: .utf8)!)
                    observer.onNext(joke!)
                    observer.onCompleted()
                case .failure(let e):
                    observer.onError(e)
                }
            }
            return Disposables.create()
        })
    }
}
