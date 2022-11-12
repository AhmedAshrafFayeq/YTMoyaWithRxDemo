//
//  ViewModel.swift
//  YTMoyaWithRxDemo
//
//  Created by Ahmed Fayek on 18/04/1444 AH.
//

import Foundation
import Moya
import RxSwift

class ViewModel {
    
    private let service: MoyaProvider<MoyaService>?
    private var bag = DisposeBag()
    var userResponse = PublishSubject<UserResponse>()
    
    init(service: MoyaProvider<MoyaService> = MoyaProvider<MoyaService>()) {
        self.service = service
    }
    
    func fetchUser(id: String) {
        service?.rx.request(.getUser(userId: id)).subscribe { [weak self] event in
            switch event {
            case let .success(response) :
                do {
                    let filterResponse = try response.filterSuccessfulStatusCodes()
                    let userResponse = try filterResponse.map(UserResponse.self, using: JSONDecoder())
                    self?.userResponse.onNext(userResponse)
                } catch let error {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }.disposed(by: bag)
    }
    
    func fetchAllUsers() {
        service?.rx.request(.getAllUsers(page: "1")).subscribe { [weak self] event in
            switch event {
            case let .success(response):
                do{
                    //let filterresponse = response.filterSuccessfulStatusCodes()
                    print(try response.mapJSON())
                }catch let error {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }.disposed(by: bag)
    }
}
