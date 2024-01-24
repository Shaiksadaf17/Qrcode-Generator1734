//
//  ViewController.swift
//  Qrcode Generator
//
//  Created by shaik sadaf patel on 25/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var qrImageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func generateAction(_ sender: Any) {
        if let myName = nameText.text, let qrCodeImage = generateQRCode(urlString: myName) {
                    qrImageView.image = qrCodeImage
                }
            }

            func generateQRCode(urlString: String) -> UIImage? {
                if let url = URL(string: urlString) {
                    if let filter = CIFilter(name: "CIQRCodeGenerator") {
                        let data = url.absoluteString.data(using: .utf8)
                        filter.setValue(data, forKey: "inputMessage")
                        let transform = CGAffineTransform(scaleX: 3, y: 3)
                        
                        if let output = filter.outputImage?.transformed(by: transform) {
                            return UIImage(ciImage: output)
                        }
                    }
                }
                return nil
            }
        }
