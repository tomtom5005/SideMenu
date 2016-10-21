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

    @IBAction func pancakeButtonTapped(sender: UIButton) {
        if let del = delegate{
            del.didTapPancakeButton(sender)
        }
    }

    
   
}
