//
//  DetailViewController.swift
//  Project1
//
//  Created by André Arns on 08/03/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var pictures: [String] = ViewController.structPictures.orderedPictures
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        if let imageIndex = pictures.firstIndex(of: selectedImage!) {
            title = "\(imageIndex + 1) of \(pictures.count)"

        }
        
        navigationItem.largeTitleDisplayMode = .never
        
        print(pictures)
        print(pictures.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
