//
//  HomeViewController.swift
//  DemoSlideMenu
//
//  Created by gia huy on 1/22/19.
//  Copyright © 2019 gia huy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var menuViewLeading: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var coverButton: UIButton!
    
    var menuIsShow: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.35) {
            self.menuViewLeading.constant = self.menuIsShow ? 0 : -self.menuView.bounds.width
                self.coverButton.alpha = self.menuIsShow ? 1 : 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuIsShow = false
        NotificationCenter.default.addObserver(self, selector: #selector(thutRaThutVao), name: Notification.Name("raVao"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("raVao"), object: nil)
    }
    
    @objc
    func thutRaThutVao() {
       menuIsShow = !menuIsShow
    }
    
    @IBAction func coverButtonTap(_ sender: Any) {
            menuIsShow = !menuIsShow
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    

}
