//
//  ViewController.swift
//  PoormansInstagram
//
//  Created by Kash Karimi on 31/08/2015.
//  Copyright © 2015 Kash Karimi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var scFilterSelecter: UISegmentedControl!
    @IBOutlet weak var btnFilterImage: UIButton!

    var filterType : String = "CIPhotoEffectNoir"

    var filterImage : CIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLoadImageAction(sender: UIButton) {
        loadImage()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        if let pickedImage = image as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            filterImage = CIImage(image: pickedImage)
            imageView.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loadImage() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func btnFilterImageAction(sender: UIButton) {
        switch (scFilterSelecter.selectedSegmentIndex) {
            case 0:
                setProcessFilter()
            case 1:
                setNoirFilter()
            case 2:
                caseChromeFilter()
            default:
                print("nothing selected")
        }

    }
    
    func setProcessFilter() {
        //var originalImage = CIImage(image: imageView.image!)
        if filterImage !== nil {
            let filter = CIFilter(name: "CIPhotoEffectProcess")
            filter?.setDefaults()
            filter?.setValue(filterImage, forKey: kCIInputImageKey)
            let imageOutput = filter!.outputImage
            let newImage = UIImage(CIImage: imageOutput!)
            imageView.image = newImage
        } else {
            print("problem!")
        }
    }
    
    func setNoirFilter() {
        if filterImage !== nil {
            let filter = CIFilter(name: "CIPhotoEffectNoir")
            filter?.setDefaults()
            filter?.setValue(filterImage, forKey: kCIInputImageKey)
            let imageOutput = filter!.outputImage
            let newImage = UIImage(CIImage: imageOutput!)
            imageView.image = newImage
        } else {
            print("problem!")
        }

    }
    
    func caseChromeFilter() {
        if filterImage !== nil {
            let filter = CIFilter(name: "CIPhotoEffectChrome")
            filter?.setDefaults()
            filter?.setValue(filterImage, forKey: kCIInputImageKey)
            let imageOutput = filter!.outputImage
            let newImage = UIImage(CIImage: imageOutput!)
            imageView.image = newImage
        } else {
            print("problem!")
        }

    }
    
}

