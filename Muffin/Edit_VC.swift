//
//  Edit_VC.swift
//  Muffin
//
//  Created by Daniel Singh on 10/13/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit

class Edit: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //var Interaction = ""
    
    @IBOutlet weak var InteractionLabel: UILabel!
    @IBOutlet weak var ItemName: UITextField!
    @IBOutlet weak var ItemDescription: UITextField!
    @IBOutlet weak var ItemImage: UIImageView!
    @IBOutlet weak var BakeTime: UITextField!
    
    
    //for the image selection:
    let imagePicker=UIImagePickerController()
    @IBAction func ImageBtn(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated:true, completion: nil)
    }//ImageButton
    
    @IBAction func Submit(_ sender: Any) {
        //if (Interaction=="Add"||Interaction==""){
            //InteractionLabel.text = "Add Item"
        var img = UIImage(named: "img_Default")
        let Btime:Int! = Int(BakeTime.text!)
            //do necessary calculations on Btime to make it accurate
            //if it's a minute:second timer, calculate time in seconds here
        guard let name = ItemName.text, !name.isEmpty else {return}
        guard let description = ItemDescription.text, !description.isEmpty else {return}
        if (!(ItemImage.image==nil))
            {img = ItemImage.image}
        guard let pastry = Pastry(Item_name: name, Item_quantity: 0, Item_description: description, Item_pic: img, Bake_time:Btime)
                   else {fatalError("unable to create pastry")}
            pastries.append(pastry)
        //}
        ItemName.text=nil
        ItemDescription.text=nil
        ItemImage.image=nil
        BakeTime=nil
        
            //take reference of the item to be edited
            //set all fields as the current data for the item to be edited
            //edit the item
            //may need to have some built-in reference to find the pastry and overwrite it
            
            //most likely, have a way to select the collection and while the item is selected,
    }//Submit
    @IBOutlet weak var Submit: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate=self
        // Do any additional setup after loading the view.
    }//viewDidLoad
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            ItemImage.contentMode = .scaleAspectFit
            ItemImage.image = pickedImage
        }
     
        dismiss(animated: true, completion: nil)
    }//imagePickerController
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
