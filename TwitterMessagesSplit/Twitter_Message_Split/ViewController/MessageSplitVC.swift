//
//  MessageSplitVC.swift
//  Twitter_Message_Split
//
//  Created by Agha Shahriyar Khan on 04/11/2019.
//  Copyright © 2019 Agha Shahriyar Khan. All rights reserved.
//

import UIKit

class MessageSplitVC: UIViewController {

    // MARK: - Properties

    var resultMessageSplit : String!
    @IBOutlet weak var resultView: UITextView!
    @IBOutlet weak var splitSize: UITextField!
    @IBOutlet weak var inputMessageView: UITextView!
    
    // MARK: - LifeCycle - ViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
    }

    // MARK: - Button Action

    
    @IBAction func splitMessageAction(_ sender: UIButton) {
        self.splitSize.resignFirstResponder()
        if self.inputMessageView.text.isEmpty && self.inputMessageView.text.count < 10 {
            self.presentAlertView(withTitle: TwitterMessageKey.alert, message: TwitterMessageKey.inputMessageAlert)
            return
        } else if (Int(self.splitSize.text!)!) < 8 {
            self.presentAlertView(withTitle: TwitterMessageKey.alert, message: TwitterMessageKey.splitSizeAlert)
            return
        }
        let messageSize : Int = Int(self.splitSize.text!)! - 4
        self.messageSplit(message: self.inputMessageView.text!, splitSize: messageSize)
    }
    
    func messageSplit(message:String,splitSize:Int) {
        let splitModel = MessageSplitModel.init()
        let data = splitModel.splitBy(message: message, length: splitSize)
        self.resultMessageSplit = ""
        if data.count == 1 && data.first!.chunk.isEmpty {
            self.presentAlertView(withTitle: TwitterMessageKey.alert, message: TwitterMessageKey.splitErrorMessage)
        } else {
            for element in 0..<data.count {
                resultMessageSplit = resultMessageSplit + " \n" + data[element].chunk
            }
            self.resultView.text = resultMessageSplit
        }
    }
    
}





