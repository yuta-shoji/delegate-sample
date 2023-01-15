import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var fruitsTableView: UITableView!
    
    let fruits = ["🍎Apple", "🍊Orange", "🍈Melon", "🍌Banana", "🍍Poneapple", "🥝Kiwi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitsTableView.dataSource = self
        fruitsTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: indexPath)
        
        cell.textLabel!.text = fruits[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let indexPath = fruitsTableView.indexPathForSelectedRow {
                guard let destination = segue.destination as? DetailViewController else {
                    fatalError("Failed to prepare DetailViewController.")
                }
                
                destination.name = fruits[indexPath.row]
            }
        }
    }
    
}
