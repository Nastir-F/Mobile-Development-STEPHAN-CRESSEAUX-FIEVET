//
//  ViewController.swift
//  Mobile Development
//
//  Created by user231747 on 12/27/22.
//

import SwiftUI

class ViewController: UIViewController {

    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Alerte", message: "Les données n'ont pas été récupérées", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print("??????????????????????????????????????????????")
        
    }
}
