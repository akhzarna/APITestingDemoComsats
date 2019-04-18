//
//  BioViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/8/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class BioViewController: BaseViewController {

    @IBOutlet weak var BioTitleLbl: UILabel!
    @IBOutlet weak var TextFlieldLbl: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        BioTitleLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        BioTitleLbl.adjustsFontForContentSizeCategory = true
        
        TextFlieldLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TextFlieldLbl.adjustsFontForContentSizeCategory = true
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
