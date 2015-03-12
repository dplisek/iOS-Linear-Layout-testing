//
//  ViewController.swift
//  LinearLayoutTesting
//
//  Created by Dominik Plisek on 11/03/15.
//  Copyright (c) 2015 Dominik Plisek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let llView = view as? LinearLayoutView {
            llView.spacing = 8.0
            llView.margin = 12.0
            let label = UILabel()
            label.text = "This is a test."
            llView.addMember(label)
            let label2 = UILabel()
            label2.text = "This is another test."
            llView.addMember(label2)
            let label3 = UILabel()
            label3.text = "This is an inserted test."
            llView.addMember(label3, position: 1)
        }
    }
    
}

