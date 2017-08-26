//
//  ViewController.swift
//  PageControl
//
//  Created by 박태준 on 2017. 8. 27..
//  Copyright © 2017년 Tae Jun Park. All rights reserved.
//

import UIKit

var images = ["image01.jpeg","image02.jpeg","image03.jpeg","image04.jpeg","image05.jpeg",]

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 2
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imgView.image = UIImage(named: images[2])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }

}

