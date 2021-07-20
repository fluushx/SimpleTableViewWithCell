//
//  ViewController.swift
//  SimpleTableViewWithCell
//
//  Created by Felipe Ignacio Zapata Riffo on 12-07-21.
//

import UIKit

 
class AnimalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataAnimals:Results?
  
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        readJson()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "AnimalsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AnimalsTableViewCell")
        self.title = "Animals Example"
        tableView.rowHeight = 200
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAnimals?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "AnimalsTableViewCell", for: indexPath) as! AnimalsTableViewCell
        let image = dataAnimals?.data[indexPath.row].image
        let type = dataAnimals?.data[indexPath.row].type
        cell.animalLabel.text = type
        cell.animalImageView.image = UIImage(named: image!)
        cell.animalImageView.layer.cornerRadius =  10
        cell.animalImageView.clipsToBounds = true
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:3, height:3)
        cell.layer.shadowOpacity = 3
        cell.layer.shadowRadius = 3
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataAnimals?.data[indexPath.row]
        let vc = DetailAnimalsViewController(data: data!)
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func readJson(){
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            dataAnimals = try JSONDecoder().decode(Results.self, from: jsonData)
            if let dataAnimals = dataAnimals {
                print(dataAnimals)
           
            } else {
                print ("failed to parsed json")
            }
        }
        catch{
            print("error")
        }
    }

}

