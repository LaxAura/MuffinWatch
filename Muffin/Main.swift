//
//  MainVC.swift
//  Muffin
//
//  Created by Daniel Singh on 10/8/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit
var pastries = [Pastry]()
var special = -1//index of daily special
var pastryindex = -1
//var Special = pastries[0]//placeholder
class Main: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    //private let reuseIdentifier = "PastryCVCell"

    
    @IBOutlet weak var SpecialImage: UIImageView!
    
    @IBOutlet weak var Pastries: UICollectionView!
    //Oven should force the user to either click a collection item to headstart the oven or click the oven to cancel.
    
    
    @IBAction func SpecialBtnTap(_ sender: Any) {
        if (pastries.count>special){
            pastryindex=special
            self.performSegue(withIdentifier: "edit", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (pastries.isEmpty){loadDefaults()}//load defaults if it's completely empty. otherwise doesn't
        //!!Delete after add, edit and oven are done.
        //Pastries.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PastryCVCell")

        Pastries.delegate=self
        Pastries.dataSource=self
    }
    override func viewWillAppear(_ animated: Bool) {
        print("VIEW WILL APPEAR CALLED")
        if (pastries.count > special && special>=0){
            SpecialImage.image=pastries[special].Item_pic
        }
        self.Pastries.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1//essentially the amount of collections
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pastries.count//amount of cells
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Pastries.dequeueReusableCell(withReuseIdentifier:"PastryCVCell",for: indexPath) as! PastryCVCell
        let pastry=pastries[indexPath.item]
        cell.Pastry_Image.image=pastry.Item_pic
        //cell.timer=
        cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: 300, height: 300)
        return cell
    }/*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)->CGSize{
        return CGSize(width:CGFloat(10000), height:CGFloat(10000))
    }*/
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pastryindex = indexPath.row//tells which pastry is being selected
        self.performSegue(withIdentifier: "edit", sender: self)
    }
    
    @IBAction func Acc(_ sender: Any) {
        accounttype="Store Owner"
        self.performSegue(withIdentifier: "Acc", sender: self)
    }
    
    
    /*
    func collectionView(_ Pastries: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = Pastries.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PastryCVCell else{fatalError("The dequeued cell is not an instance of PastryCVCell.")}
        let pastry=pastries[indexPath.item]
        cell.Pastry_Image.image=pastry.Item_pic
        // Configure the cell
    
        return cell
    }*/
    
    
    private func loadDefaults(){
        let photo1=UIImage(named:"img_Blueberry_Muffin")
        let photo2=UIImage(named:"img_Scone")
        let photo3=UIImage(named:"img_Brownie")
    
    
        guard let pastry1 = Pastry(Item_name: "Blueberry Muffin", Item_quantity: 3, Item_description: "A muffin with blueberries", Item_pic: photo1, Bake_time: 1500, Price:5.99, oven:false, fresh: false)
        else {fatalError("unable to create pastry")}
        guard let pastry2 = Pastry(Item_name: "Scone", Item_quantity: 7, Item_description: "Basically an english muffin?", Item_pic: photo2, Bake_time: 1200, Price: 3.50, oven:true, fresh:false)
        else {fatalError("unable to create pastry")}
        guard let pastry3 = Pastry(Item_name: "Brownie", Item_quantity: 12, Item_description: "Bruh, you know what a brownie is.", Item_pic: photo3, Bake_time: 2000, Price:2.99, oven:false, fresh:false)
        else {fatalError("unable to create pastry")}
        pastries+=[pastry1,pastry2,pastry3]
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
