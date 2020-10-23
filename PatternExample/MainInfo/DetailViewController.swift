//
//  DetailViewController.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var pattern: Pattern?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = pattern?.name
        textView.text = pattern?.description
    }
}
