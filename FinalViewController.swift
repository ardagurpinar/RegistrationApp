//
//  FinalViewController.swift
//  RegistrationApp
//
//  Created by Arda Gürpınar on 5.12.2021.
//

import UIKit

class FinalViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    
    var welcomeText = "Hello"
    
    override func viewWillAppear(_ animated: Bool) {
        helloLabel.text = welcomeText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
