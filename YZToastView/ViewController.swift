//
//  ViewController.swift
//  YZToastView
//
//  Created by Yudiz Solutions Ltd on 08/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnShowToastTapped(_ sender: UIButton) {
        YZToastView.shared.show(withMessage: "This is a toast message",inView: view,bgColor: .red, textColor: .white)
    }
}

