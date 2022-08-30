//
//  ViewController.swift
//  QRCodeApp
//
//  Created by Alexey Manokhin on 29.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonTwo.isEnabled = false
    }
    @IBAction func button (_sender: Any) {
        
        if let myString = myTextField.text {
            let data = myString.data (using: .utf8, allowLossyConversion: false)
            let filter = CIFilter (name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "InputMessage")
            
            let ciImage = filter?.outputImage
            let transform = CGAffineTransform (scaleX: 10, y: 10)
            let transformImage = ciImage?.transformed(by: transform)
            
            let image = UIImage (ciImage: transformImage!)
            myImageView.image = image
            buttonTwo.isEnabled = true
    }
    }
    @IBAction func buttonScreenShot (_sender: Any) {
        
        func screenShotMethod() {
            
            let layer = UIApplication.shared.keyWindow!.layer
            let scale = UIScreen.main.scale
            UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
            layer.render(in: UIGraphicsGetCurrentContext()!)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        }
    }
    func screenShotMethod () {
    }
}

