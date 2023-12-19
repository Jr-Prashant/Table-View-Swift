

import UIKit

class AddDetailViewController: UIViewController 
{
    
    @IBOutlet weak var Id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var email: UITextField!
//    var table:ListTableViewController?
    
    var delegate : MyProtocol?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func saveButton(_ sender: UIButton) {
        
        let person = Person(
            id: "\(Id.text ?? "")",
            name: "\(name.text ?? "")",
            address: "\(address.text ?? "")",
            mobile: "\(mobileNumber.text ?? "")",
            email: "\(email.text ?? "")"
        )
        
        delegate?.sendDetail(dataModel: person)

        navigationController?.popViewController(animated: true)
    }
    
}
