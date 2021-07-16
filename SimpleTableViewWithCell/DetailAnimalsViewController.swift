//
//  DetailAnimalsViewController.swift
//  SimpleTableViewWithCell
//
//  Created by Felipe Ignacio Zapata Riffo on 16-07-21.
//

import UIKit

class DetailAnimalsViewController: UIViewController {
    private let data: String
    
    init(data:String){
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
      
        super.viewDidLoad()
        view.backgroundColor = .red
        print(data)

        // Do any additional setup after loading the view.
    }

}
