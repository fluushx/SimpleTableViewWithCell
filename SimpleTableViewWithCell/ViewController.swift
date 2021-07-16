//
//  ViewController.swift
//  SimpleTableViewWithCell
//
//  Created by Felipe Ignacio Zapata Riffo on 12-07-21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let data = ["perro","gato","caballo"]
    let image = ["perro","gato","caballo"]
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "AnimalsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AnimalsTableViewCell")
        self.title = "Animals Example"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "AnimalsTableViewCell", for: indexPath) as! AnimalsTableViewCell
        let image = image[indexPath.row]
        cell.animalLabel.text = data[indexPath.row]
        cell.animalImageView.image = UIImage(named: image)
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
        let data = data[indexPath.row]
        let vc = DetailAnimalsViewController(data: data)
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("tapped \(data)")
        
    }

}

