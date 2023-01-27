//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Muhammed Ali SOYLU on 9.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("berlin")
        landmarkNames.append("hongkong")
        landmarkNames.append("istanbul")
        landmarkNames.append("roma")
        landmarkNames.append("toronto")

        landmarkImages.append(UIImage(named: "berlin.jpg")!)
        landmarkImages.append(UIImage(named: "hongkong.jpg")!)
        landmarkImages.append(UIImage(named: "istanbul.jpg")!)
        landmarkImages.append(UIImage(named: "roma.jpg")!)
        landmarkImages.append(UIImage(named: "toronto.jpg")!)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        //content.secondaryText = "SecondaryTest"
        //content.image = UIImage(named: "Bob")
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    

}

