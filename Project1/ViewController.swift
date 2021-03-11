//
//  ViewController.swift
//  Project1
//
//  Created by André Arns on 06/03/21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    struct structPictures {
        static var picturesCount = 0
        static var orderedPictures = [String]()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // This is a picture to load!
                pictures.append(item)
            }
        }
        
        structPictures.picturesCount = pictures.count
        structPictures.orderedPictures = pictures.sorted(by: <)
        
        print(pictures)
        print(structPictures.orderedPictures)
        print(structPictures.picturesCount)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = structPictures.orderedPictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = structPictures.orderedPictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

