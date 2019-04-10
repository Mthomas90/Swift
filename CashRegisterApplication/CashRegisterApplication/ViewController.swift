//
//  ViewController.swift
//  CashRegisterApplication
//  Copyright © 2019 007. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemLabel: UITextField!
    @IBOutlet weak var quantityLabel: UITextField!{ didSet { quantityLabel.addDoneCancelToolbar()}}
    @IBOutlet weak var priceLabel: UITextField!{ didSet { priceLabel.addDoneCancelToolbar()}}
    @IBOutlet weak var stateCodeLabel: UITextField!
    @IBOutlet weak var orderButton: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemLabel.delegate = self
        quantityLabel.delegate = self
        priceLabel.delegate = self
        stateCodeLabel.delegate = self
        orderButton.layer.cornerRadius = 10
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: BUTTON ACTION METHODS
    @IBAction func orderButton(_ sender: UIButton) {
       
        if itemLabel.text != nil && quantityLabel.text != nil && priceLabel.text != nil && stateCodeLabel != nil {
            let register = Register(itemLabel: itemLabel.text!, quantity: Int(quantityLabel.text!) ?? 1, price: Double(priceLabel.text!) ?? 1, state: stateCodeLabel.text!)
            if register.receiptArray.count > 1 {
                let popUpReceipt = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "receipt") as! ReceiptViewController
                popUpReceipt.receiptArray = register.receiptArray
                self.addChild(popUpReceipt)
                popUpReceipt.view.frame = self.view.frame
                self.view.addSubview(popUpReceipt.view)
                popUpReceipt.willMove(toParent: self)
            }
        } else {
            print("Labels can not be empty!!")
        }
    }
}

//Extension to add done and cancel options to the numberpad
extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func doneButtonTapped() {self.resignFirstResponder()}
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}
