//
//  QuraanTehqeeqAudioVideoViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/3/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class QuraanTehqeeqAudioVideoViewController: BaseViewController {

    
    @IBOutlet weak var TitleMainLbl: UILabel!
    @IBOutlet weak var SubTitleLbl: UILabel!
    @IBOutlet weak var ListTitleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
        
        //fontFamily
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font. CCSignLanguageW00-Regular
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }

        ListTitleLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        ListTitleLbl.adjustsFontForContentSizeCategory = true
        
        SubTitleLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        SubTitleLbl.adjustsFontForContentSizeCategory = true
        
        TitleMainLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TitleMainLbl.adjustsFontForContentSizeCategory = true
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
