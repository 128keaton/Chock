//
//  DataViewController.swift
//  Chock
//
//  Created by Keaton Burleson on 10/20/16.
//  Copyright © 2016 Keaton Burleson. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

	@IBOutlet weak var dataLabel: UILabel!
	var dataObject: String = ""


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.dataLabel!.text = dataObject
	}


}

