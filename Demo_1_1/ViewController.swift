//
//  ViewController.swift
//  Demo_1_1
//
//  Created by Admin on 13/12/2018.
//  Copyright © 2018 Cecile M. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myText: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextView: UITextView!
    
    var textViewText: String = ""
    let saveUserNoteKey: String = "mes_notes" // save in UserDefaults
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myText.delegate = self
        
        // Load UserDefaults
        if let UDsaveUserNoteKey = UserDefaults.standard.string(forKey: saveUserNoteKey) {
            textViewText = UDsaveUserNoteKey
            myTextView.text = UDsaveUserNoteKey
        }
        
    }

    @IBAction func textChanged(_ sender: UITextField) {
        myLabel.text = sender.text
    }
    
    
    @IBAction func buttonTouched() {
        
        if let addText = myText.text, addText.count > 0 {
            textViewText = textViewText + addText + "\n"
            myTextView.text = textViewText
            
            // Save in UserDefaults
            UserDefaults.standard.set(textViewText, forKey: saveUserNoteKey)
        }
        
        myText.text = ""
    }
    
    
    @IBAction func eraseButtonTouched() {
        
        // Reset TextView text and its backup in UserDefaults
        textViewText = ""
        myTextView.text = ""
        UserDefaults.standard.set("", forKey: saveUserNoteKey)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonTouched()
        myText.resignFirstResponder()  // retirer le focus
        return false
    }

}
