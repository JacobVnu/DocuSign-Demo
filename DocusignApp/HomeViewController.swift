//
//  HomeViewController.swift
//  DocusignApp
//
//  Created by JacobVinu on 02/09/22.
//

import UIKit
import DocuSignSDK

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func callLogin(_ sender: Any) {
        let host = "https://demo.docusign.net/restapi"
        guard let hostURL = URL(string: host) else { return }
        DSMManager.login(withAccessToken: "accessToken", accountId: "accountId", userId: "userId", userName: "userName", email: "email", host: hostURL, integratorKey: "integratorKey") { [weak self] accountInfo, error in
            if let error = error {
                print("Error logging in: \(error)")
            } else {
                print("User authenticated")
            }
        }
    }
    
    @IBAction func pushClicked(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    @IBAction func presentClicked(_ sender: Any) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
