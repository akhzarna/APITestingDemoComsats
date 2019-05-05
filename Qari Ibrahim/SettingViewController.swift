//
//  SettingViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/8/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit


class SettingViewController: BaseViewController {

    @IBOutlet weak var tblSetting: UITableView!
    @IBOutlet weak var TitleLbl: UILabel!
    
    @IBOutlet weak var firstInputView: UIView!
    @IBOutlet weak var secondInputView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        TitleLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TitleLbl.adjustsFontForContentSizeCategory = true
        
        
        firstInputView.layer.borderWidth = 2
        firstInputView.layer.cornerRadius = 28
        firstInputView.layer.borderColor = UIColor.white.cgColor
        
        secondInputView.layer.borderWidth = 2
        secondInputView.layer.cornerRadius = 28
        secondInputView.layer.borderColor = UIColor.white.cgColor
        
        thirdView.layer.borderWidth = 2
        thirdView.layer.cornerRadius = 28
        thirdView.layer.borderColor = UIColor.white.cgColor
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
