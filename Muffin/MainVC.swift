//
//  MainVC.swift
//  Muffin
//
//  Created by Daniel Singh on 10/8/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var Oven_button: UIButton!
    class Collection_access: UICollectionViewController{
        @IBOutlet weak var Collection: UICollectionView!
        @IBOutlet weak var Item: UICollectionView!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
