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
    
    init(service: MoyaProvider<MoyaService> = MoyaProvider<MoyaService>()) {
        self.service = service
    }
    
    func fetchUser(id: String) {
        service?.rx.request(.getUser(userId: id)).subscribe({ [weak self] event in
            switch event {
            case let .success(response) :
                do {
                    print(response.request?.url)
                    let filterResponse = try response.filterSuccessfulStatusCodes()
                    print(try response.mapJSON())
                } catch let error {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        })
    }
}
