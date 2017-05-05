//
//  BossDetailViewController.swift
//  AOS
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class BossDetailViewController: UIViewController
{

    
    @IBOutlet weak var bossDesc: UITextView!
    @IBOutlet weak var bossName: UILabel!
        
        
        func configureView() {
            // Update the user interface for the detail item.
            if let boss = self.detailItem {
                if let label = self.bossName {
                    label.text = boss.name
                }
                if let label = self.bossDesc {
                    label.text = boss.description
                }
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            self.configureView()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        var detailItem: Boss? {
            didSet {
                // Update the view.
                self.configureView()
            
        }
        
        
    }
    


}
