//
//  JokesViewController.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 20/12/23.
//

import UIKit
import Swinject
import RxSwift

class JokesViewController: UIViewController {
    
    var jokeViewModel = assembler.resolve(JokesViewModel.self)
    
    var setupLabel = makeLabel(withText: "setup", size: 20)
    var punchlineLabel = makeLabel(withText: "puncline", size: 20)
    var getJokesButton = makeButton(withText: "Get jokes")
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    deinit {
        disposeBag = DisposeBag()
    }
    
    private func style(){
        view.backgroundColor = .white
        
        setupLabel.translatesAutoresizingMaskIntoConstraints = false
        punchlineLabel.translatesAutoresizingMaskIntoConstraints = false
        getJokesButton.translatesAutoresizingMaskIntoConstraints = false
        
        getJokesButton.setTitle(getJokesButton.isEnabled ? "Get Joke" : "loading..", for: .normal)
        getJokesButton.addTarget(self, action: #selector(getJokes), for: .primaryActionTriggered)
        
        jokeViewModel?.joke
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] joke in
                self?.setupLabel.text = joke.displaySetup
                self?.punchlineLabel.text = joke.displayPunchline
            })
            .disposed(by: disposeBag)
        
        
        jokeViewModel?.getJokeLoading
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                self?.getJokesButton.isEnabled = !isLoading
                self?.getJokesButton.setTitle(isLoading ? "Loading..." : "Get Joke", for: .normal)
            })
            .disposed(by: disposeBag)
    }
    
    
    private func layout(){
        view.addSubview(setupLabel)
        view.addSubview(punchlineLabel)
        view.addSubview(getJokesButton)
        
        NSLayoutConstraint.activate([
            setupLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            setupLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            punchlineLabel.topAnchor.constraint(equalTo: setupLabel.bottomAnchor, constant: 5),
            punchlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            getJokesButton.topAnchor.constraint(equalTo: punchlineLabel.bottomAnchor, constant: 60),
            getJokesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

extension JokesViewController {
    @objc func getJokes(){
        jokeViewModel?.getJoke()
    }
}
