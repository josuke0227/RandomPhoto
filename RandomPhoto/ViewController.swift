//
//  ViewController.swift
//  RandomPhoto
//
//  Created by 本杉洋介 on 4/3/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange,
        .systemGray
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55
            )
        
    }

    func getRandomPhoto() {
        print("hello")
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)! //Forced Unwrapping
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }

}

/*
 Where to go from here:
 Dive into the syntax of Swift language.
 Create the repository and commit this code.
 Add error handling if the API call failed.
 Add box shadow to the image
 Add the button to the border colour
 Add the button to the border radius
 Show loader while fetching an image
 Make the image swipable to show next image
If you swipe an image to right, mark the image as liked.
    Create an album of the images you liked
    
 */
