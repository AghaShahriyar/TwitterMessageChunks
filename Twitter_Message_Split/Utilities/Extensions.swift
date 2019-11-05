//
//  Extensions.swift
//  Twitter_Message_Split
//
//  Created by Agha Shahriyar Khan on 04/11/2019.
//  Copyright © 2019 Agha Shahriyar Khan. All rights reserved.
//
import Foundation
import UIKit


extension UIViewController {
    func presentAlertView(withTitle title: String, message : String) {
        let alert  = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .destructive, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
}
