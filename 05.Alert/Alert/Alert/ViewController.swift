//
//  ViewController.swift
//  Alert
//
//  Created by 박태준 on 2017. 8. 24..
//  Copyright © 2017년 Tae Jun Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn: UIImage = UIImage(named: "image.png")!
    let imgOff: UIImage = UIImage(named: "image_off.png")!
    let imgRemove: UIImage = UIImage(named: "Image_remove.png")!
    
    var isLampOn = true
    
    @IBOutlet weak var imgLamp: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgLamp.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            let alertLampOn = UIAlertController(title: "경고",message:"현재 On 상태입니다",preferredStyle:UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.",style:UIAlertActionStyle.default,handler: nil)
            alertLampOn.addAction(onAction)
            present(alertLampOn, animated: true, completion: nil)
        }else{
            imgLamp.image = imgOn
            isLampOn = true
        }
    }

    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            let alertLampOff = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertActionStyle.default, handler: {
                ACTION in self.imgLamp.image = self.imgOff
                self.isLampOn=false})
            let cancleAction = UIAlertAction(title: "아니오", style: UIAlertActionStyle.default, handler: nil)
            alertLampOff.addAction(offAction)
            alertLampOff.addAction(cancleAction)
            
            present(alertLampOff, animated: true, completion: nil)
        }

    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let alertLampRemove = UIAlertController(title: "램프제거", message: "램드플 제거하시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertActionStyle.default, handler: {
            ACTION in self.imgLamp.image = self.imgOff
            self.isLampOn=false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertActionStyle.default, handler: {
            ACTION in self.imgLamp.image = self.imgOn
            self.isLampOn=true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertActionStyle.default, handler: {
            ACTION in self.imgLamp.image = self.imgRemove
            self.isLampOn=false
        })
        
        alertLampRemove.addAction(offAction)
        alertLampRemove.addAction(onAction)
        alertLampRemove.addAction(removeAction)

        present(alertLampRemove, animated: true, completion: nil)
    }
    
}

