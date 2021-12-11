//
//  LoginViewController.swift
//  RegistrationApp
//
//  Created by Arda Gürpınar on 5.12.2021.
//
import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Invalid email address or password.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let user = UserInfo(firstName: "", lastName: "", email: emailText.text, password: passwordText.text)
        
        if let email = user.email, let password = user.password {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print(e)
                    print("Invalid email address or password")
                    self!.showAlert()
                } else {
                    user.getUser(email: email)
                    self?.performSegue(withIdentifier: "LogInToFinal", sender: self)
                }
            }
        }
        
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        
    }
    
}
