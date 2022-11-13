//
//  ViewController.swift
//  YTMoyaWithRxDemo
//
//  Created by Ahmed Fayek on 17/04/1444 AH.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private var viewModel = ViewModel()
    var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUser(id: "2")
        
        viewModel.userResponse.subscribe { userResponse in
            print(userResponse.element)
        }.disposed(by: bag)
        
        viewModel.fetchAllUsers()
    }
}
