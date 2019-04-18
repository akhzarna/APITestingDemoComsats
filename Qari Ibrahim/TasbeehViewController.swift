//
//  TasbeehViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/4/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class TasbeehViewController: BaseViewController {

   
    @IBOutlet weak var NextplayLbl: UILabel!
    @IBOutlet weak var PlayLbl: UILabel!
    @IBOutlet weak var ReferrenceLbl: UITextView!
    @IBOutlet weak var NarationLbl: UILabel!
    @IBOutlet weak var TasbeehWordLbl: UILabel!
    
    
    @IBAction func NextPlayBtn(_ sender: Any) {
    }
    @IBAction func PlayBtn(_ sender: Any) {
    }
    @IBAction func VolumeDecrement(_ sender: Any) {
    }
    @IBAction func VolumeIncrement(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        
        guard let customFont2 = UIFont(name: "SF Compact Display", size: UIFont.labelFontSize) else { fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )        }
        TasbeehWordLbl.font = UIFontMetrics.default.scaledFont(for: customFont2)
        TasbeehWordLbl.adjustsFontForContentSizeCategory = true
        
        NarationLbl.font = UIFontMetrics.default.scaledFont(for: customFont2)
        NarationLbl.adjustsFontForContentSizeCategory = true
        
        ReferrenceLbl.font = UIFontMetrics.default.scaledFont(for: customFont2)
        ReferrenceLbl.adjustsFontForContentSizeCategory = true
        
        PlayLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        PlayLbl.adjustsFontForContentSizeCategory = true
        
        NextplayLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        NextplayLbl.adjustsFontForContentSizeCategory = true
    }
    

    /*
    // MARK: - Navigation SF Compact Display

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
