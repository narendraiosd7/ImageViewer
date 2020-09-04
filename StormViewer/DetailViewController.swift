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
        
        //navigationItem share button event handler
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
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
    
    
    //objc func for sharing images
    @objc func shareTapped() {
        guard let image = image.image?.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: [])
        controller.popoverPresentationController?.barButtonItem = navigationItem.backBarButtonItem
        present(controller, animated: true, completion: nil)
    }
    
}
