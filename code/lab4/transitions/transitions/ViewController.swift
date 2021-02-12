//
//  ViewController.swift
//  transitions
//
//  Created by Arias Mora, Juan Pablo on 2/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segueTapped(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)

        guard let greenViewController = mainStoryBoard.instantiateViewController(
            withIdentifier: "GreenViewController") as?
                GreenViewController else{
                print("Couldn't find the view controller")
                return
        }
        
        greenViewController.modalTransitionStyle = .flipHorizontal
        //// This is due to the relation that we declare using Editor-Embeded In-Navigation View Controller
        //// Comment Below line in Step 13
        //navigationController?.pushViewController(greenViewController, animated: true)
        
        //// Uncomment Below line in Step 13
        present(greenViewController, animated: true, completion: nil)
        ////Above line present "similar" funtionality asnavigationController?.pushViewController
        ////But does not have a Navigation Stack therefore we don't have the back button
        
    }
    
}

