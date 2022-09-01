//
//  SecondViewController.swift
//  MoveAnImage
//
//  Created by Saiman Chen on 2022-08-31.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btnReturn: UIButton!
    
    var receivingName: String?
    var receivingAge: String?
    var receivingEmail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ageage: Int? = Int(receivingAge ?? "oh no")
        checker(name: receivingName, age: ageage, email: receivingEmail)
    }

    @IBAction func onReturn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func checker(name: String?, age: Int?, email: String?) {
        if(name == "" || (age ?? 0) < 18 || email == "") {
                    image.image = UIImage(named: "icon_wrong")
                    label.text = "You have failed the test!"
                }
    }
    
}
