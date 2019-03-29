//
//  ViewController.swift
//  CashRegisterApplication
//
//  Created by 007 on 28/03/2019.
//  Copyright © 2019 007. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemLabelText: UITextField!
    @IBOutlet weak var quantityText: UITextField!{didSet { quantityText.addDoneCancelToolbar()}}
    @IBOutlet weak var priceText: UITextField!{didSet { priceText.addDoneCancelToolbar()}}
    @IBOutlet weak var stateCode: UITextField!
    @IBOutlet weak var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemLabelText.delegate = self
        quantityText.delegate = self
        priceText.delegate = self
        stateCode.delegate = self
        orderButton.layer.cornerRadius = 10
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    //Mark: BUTTON ACTION METHODS
    @IBAction func orderButton(_ sender: UIButton) {
        
        if itemLabelText.text != nil && quantityText.text != nil && priceText.text != nil && stateCode != nil {
            let register = Register(itemLabel: itemLabelText.text!, quantity: Int(quantityText.text!) ?? 1, price: Double(priceText.text!) ?? 1, state: stateCode.text!)
            //print(register.receipt)
            if register.receiptArray.count > 1 {
                let popUpReceipt = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "receipt") as! ReceiptViewController
                popUpReceipt.receiptArray = register.receiptArray
                self.addChild(popUpReceipt)
                popUpReceipt.view.frame = self.view.frame
                self.view.addSubview(popUpReceipt.view)
                popUpReceipt.willMove(toParent: self)
                
            }
        }
    }

    //POPUP FOR THE RECEIPT
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
