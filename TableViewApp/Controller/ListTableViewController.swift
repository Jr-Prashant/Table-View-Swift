
import UIKit

class ListTableViewController: UITableViewController,MyProtocol
{
    func sendDetail(dataModel: Person)
    {
        people.append(dataModel)
    }
    
    var people: [Person] = []
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (people.count > 0){
            return people.count
        }
        else{
            return 0;
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableViewCell
        
        if(people.count > 0){
            // Configure the cell...
            cell.nameLabel.text = people[indexPath.row].name
            
            cell.title.text =  title(name: people[indexPath.row].name)
        }
        else{
            
        }
        
        return cell
    }
    
    
    
    @IBAction func addPerson(_ sender: UIBarButtonItem)
    {
        let storyboard=UIStoryboard(name: "Main", bundle: nil)
        if let mvc=storyboard.instantiateViewController(withIdentifier: "VC") as? AddDetailViewController
        {
//            mvc.table=self
            mvc.delegate = self
            print(people.count)
            navigationController?.pushViewController(mvc, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }

    func title (name: String)-> String 
    {
        let arr: [String] = name.components(separatedBy: " ")
        let a: String = arr[0].first!.uppercased()
        let b: String = arr[arr.count-1].first!.uppercased()
        if(arr.count == 1){
            return a
        }
        return a+b
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete
        {
        self.people.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectRow = people[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vC = storyboard.instantiateViewController(withIdentifier: "details") as? ViewController{
            vC.navigationItem.title = people[indexPath.row].name
            vC.person = selectRow
            navigationController?.pushViewController(vC, animated: true)
        }
    }
}
