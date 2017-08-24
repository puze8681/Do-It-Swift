//
//  ViewController.swift
//  PickerView
//
//  Created by 박태준 on 2017. 8. 24..
//  Copyright © 2017년 Tae Jun Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["image01.jpeg","image02.jpeg","image03.jpeg","image04.jpeg","image05.jpeg","image06.jpeg","image07.jpeg","image08.jpeg","image09.jpeg","image10.jpeg"]
    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0..<MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView!)->Int{
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView!, numberOfRowsInComponent component: Int)->Int {
        return imageFileName.count
    }
    
//  method : declare titleText for each row
//  func pickerView(_ pickerView: UIPickerView, titleForRow row : Int, forComponent component: Int)->String? {
//      return imageFileName[row]
//  }
    
    //method : declare titleView for each row
    func pickerView(_ pickerView: UIPickerView, viewForRow row : Int, forComponent componet:Int, reusing view: UIView?)->UIView{
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x:0, y:0, width:100, height:150)
        return imageView
    }
    
    //method : do something after pick
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
    //method : returns height of row for each component
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int)->CGFloat{
        return PICKER_VIEW_HEIGHT
    }

}

