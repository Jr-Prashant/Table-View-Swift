//
//  ViewController.swift
//  TableViewApp
//
//  Created by MacBook Pro on 28/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var person: Person?
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        if let persons = person{
            idLabel.text = persons.id
            numberLabel.text = persons.mobile
            emailLabel.text = persons.email
            addressLabel.text = persons.address
            nameLabel.text = persons.name
        }
    }
    
}

