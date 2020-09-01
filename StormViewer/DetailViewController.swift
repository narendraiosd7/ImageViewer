//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Vadde Narendra on 9/1/20.
//  Copyright © 2020 Narendra Vadde. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        //Assigning selected image string to image
        if let imageToLoad = selectedImage {
            image.image = UIImage(named: imageToLoad)
        }
    }
    
    // To hide top nav bar while tap on screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // To show top nav bar while tap on screen
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
}
