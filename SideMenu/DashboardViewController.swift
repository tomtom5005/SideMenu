//
//  DashboardViewController.swift
//  SideMenu
//
//  Created by Thomas Thompson on 10/19/16.
//  Copyright © 2016 Thomas Thompson. All rights reserved.
//

import UIKit

protocol DashboardViewControllerDelegateProtocol {
    func didTapPancakeButton(sender:UIButton) ->Void
}

class DashboardViewController: UIViewController {

    @IBOutlet weak var pancakeButton: UIButton!
    @IBOutlet weak var label: UILabel!
    var delegate: DashboardViewControllerDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pancakeButtonTapped(sender: UIButton) {
//        label.text = ""
        if let del = delegate{
            del.didTapPancakeButton(sender)
        }
    }

    
   
}
