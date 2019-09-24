//
//  ViewController.swift
//  List3
//
//  Created by yuri on 2019/09/22.
//  Copyright © 2019 yuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContents = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! CustomCell
        cellContents.cellControllView(number: indexPath)
        return cellContents
    }
    

    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
        
        myTable.register (UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "reuseCell")
        
    }

    @IBOutlet weak var myTable: UITableView!
    
}

