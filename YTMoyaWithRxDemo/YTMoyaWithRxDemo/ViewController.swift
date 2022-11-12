//
//  ViewController.swift
//  YTMoyaWithRxDemo
//
//  Created by Ahmed Fayek on 17/04/1444 AH.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUser(id: "2")
        // Do any additional setup after loading the view.
    }


}

