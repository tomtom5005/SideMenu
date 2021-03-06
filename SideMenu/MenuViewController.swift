//
//  MenuViewController.swift
//  SideMenu
//
//  Created by Thomas Thompson on 10/19/16.
//  Copyright © 2016 Thomas Thompson. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DashboardViewControllerDelegateProtocol{

    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet var  leadingConstraint: NSLayoutConstraint!
    var dashboardVC: DashboardViewController?
    
    let menuItems = ["Campaigns", "Contacts"]
    
    let menuWidth:CGFloat = 300.0
    let animationDuration:NSTimeInterval = 0.4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    //MARK: - DashboardViewControllerDelegateProtocol method
    func didTapPancakeButton(sender: UIButton) {
        self.leadingConstraint?.constant = self.leadingConstraint?.constant > 0.0 ? 0.0 : menuWidth
        UIView.animateWithDuration(animationDuration) {
            self.view.layoutIfNeeded()
        }
    }

     // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EmbedSegue_MenuVC_ContentVC"
        {
            dashboardVC = segue.destinationViewController as? DashboardViewController
            dashboardVC!.delegate = self
        }
    }
    
    //MARK: - TableView Data Source Method
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1;
    }

    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:UITableViewCell = menuTableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = menuItems[indexPath.row];
        return cell
    }
    
    //MARK: - TableView Delegate Method
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        leadingConstraint.constant = 0.0
        dashboardVC?.label.text = menuItems[indexPath.row]
        UIView.animateWithDuration(animationDuration) {
            self.view.layoutIfNeeded()
        }
    }

}

