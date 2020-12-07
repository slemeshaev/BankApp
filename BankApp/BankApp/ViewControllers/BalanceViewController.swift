//
//  BalanceViewController.swift
//  BankApp
//
//  Created by Станислав Лемешаев on 03.12.2020.
//

import UIKit

class BalanceViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var balanceLabel: UILabel!
    
    // MARK: - Properties
    var balance = 0 {
        didSet {
            balanceLabel.text = "\(balance) ₽"
        }
    }
    
    // MARK: - Methods
    override func viewWillAppear(_ animated: Bool) {
        updateBalance()
    }
    
    func updateBalance() {
        balance = Int.random(in: 0...1_000_000)
    }

}

