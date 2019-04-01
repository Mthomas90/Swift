//
//  ReceiptViewController.swift
//  CashRegisterApplication
//
//  Created by 007 on 28/03/2019.
//  Copyright © 2019 007. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {
    
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var unitPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    @IBOutlet weak var totalWithoutTax: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var discountAmount: UILabel!
    @IBOutlet weak var taxPercentage: UILabel!
    @IBOutlet weak var taxAmount: UILabel!
    
    @IBOutlet weak var totalFinalPrice: UILabel!
    
    
    @IBOutlet weak var closeButton: UIButton!
    var receiptArray = [String: String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.layer.cornerRadius = 10
        popUpView.layer.borderColor = UIColor.black.cgColor
        popUpView.layer.borderWidth = 1
        setUpLabels()
        // Do any additional setup after loading the view.
    }
    
    //Setting up the labels
    private func setUpLabels() {
        if receiptArray.count > 0 {
          itemLabel.text = receiptArray["label"]
          fitLabelText(label: itemLabel)
          quantityLabel.text = receiptArray["quantity"]
          fitLabelText(label: quantityLabel)
          unitPriceLabel.text = receiptArray["price"]
          fitLabelText(label: unitPriceLabel)
          totalPriceLabel.text = receiptArray["total"]
          
          totalWithoutTax.text = receiptArray["totalnotax"]
          fitLabelText(label: totalWithoutTax)
          discountLabel.text = "Discount \(receiptArray["dispercent"]!)%"
          fitLabelText(label: discountLabel)
          discountAmount.text = receiptArray["discount"]
          taxPercentage.text = "Tax \(receiptArray["taxpercent"]!)%"
          fitLabelText(label: taxPercentage)
          taxAmount.text = receiptArray["taxamount"]
          totalFinalPrice.text = receiptArray["total"]
        }
    }
    
    //MARK: Fit all text in label
    private func fitLabelText(label: UILabel) {
        label.sizeToFit()
        label.layoutIfNeeded()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        popUpView.layer.cornerRadius = 10
        popUpView.layer.borderColor = UIColor.blue.cgColor
        
    }
    //Close button action method
    @IBAction func closeButton(_ sender: UIButton) {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
}
