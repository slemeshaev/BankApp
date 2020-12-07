//
//  LoanViewController.swift
//  BankApp
//
//  Created by Станислав Лемешаев on 07.12.2020.
//

import UIKit

class LoanViewController: UIViewController {

    // MARK: - Outlets
    // сумма кредита
    @IBOutlet weak var pvTextField: UITextField!
    // срок (месяцев)
    @IBOutlet weak var nperTextField: UITextField!
    // годовой процент
    @IBOutlet weak var rateTextField: UITextField!
    // ежемесячный платеж
    @IBOutlet weak var monthlyPaymentLabel: UILabel!
    
    // MARK: - Inherited Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMonthlyPaymentLabel()
    }
    
    // MARK: - Methods
    func updateMonthlyPaymentLabel() {
        monthlyPaymentLabel.text = nil
        
        guard let pv = Double(pvTextField.text ?? "") else { return }
        guard let nper = Double(nperTextField.text ?? "") else { return }
        guard let rate = Double(rateTextField.text ?? "") else { return }
        
        let monthlyPayment = abs(ExcelFormulas.pmt(rate: rate, nper: nper, pv: pv))
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        guard let monthlyPaymentText = formatter.string(from: NSNumber(value: monthlyPayment)) else { return }
        
        monthlyPaymentLabel.text = "Ежемесячный платеж:\n\(monthlyPaymentText) ₽"
    }
    
    // MARK: - Actions
    @IBAction func fieldEditingChanged(_ sender: UITextField) {
        updateMonthlyPaymentLabel()
    }
    
}
