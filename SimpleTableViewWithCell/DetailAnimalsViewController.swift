//
//  DetailAnimalsViewController.swift
//  SimpleTableViewWithCell
//
//  Created by Felipe Ignacio Zapata Riffo on 16-07-21.
//

import UIKit

class DetailAnimalsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let data:Animals
   // private let descriptionAnimal:[Description]
//    init(data:Animals descriptionAnimal:[Description]){
    init(data:Animals){
        self.data = data
//        self.descriptionAnimal = descriptionAnimal
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "DetailAnimalsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DetailAnimalsTableViewCell")
        print(data)
        tableView.rowHeight = 300
 
    }
 

}

extension DetailAnimalsViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return descriptionAnimal.count
        return data.description.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAnimalsTableViewCell", for: indexPath) as! DetailAnimalsTableViewCell
       
        let desc = data.description[indexPath.row]
        let img = data.image
        cell.descriptionLabel.text = desc
        cell.animalImageView.image = UIImage(named: img)
        cell.animalImageView.layer.cornerRadius = 10
        cell.animalImageView.clipsToBounds = true
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
     
}
