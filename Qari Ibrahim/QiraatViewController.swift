//
//  QiraatViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/2/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class QiraatViewController: BaseViewController {

    @IBOutlet weak var PublicationLbl: UITextView!
    @IBOutlet weak var LearnQiraatLbl: UITextView!
    @IBOutlet weak var TakmeelLbl: UITextView!
    @IBOutlet weak var ClassesLbl: UITextView!
    @IBOutlet weak var RecitationLbl: UITextView!
    @IBOutlet weak var TitleLbl: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Qari Ibrahim"
        navigationController?.navigationBar.topItem?.title = ""
        
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        TitleLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TitleLbl.adjustsFontForContentSizeCategory = true
        
        RecitationLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        RecitationLbl.adjustsFontForContentSizeCategory = true
        
        ClassesLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        ClassesLbl.adjustsFontForContentSizeCategory = true
        
        TakmeelLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TakmeelLbl.adjustsFontForContentSizeCategory = true
        
        LearnQiraatLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        LearnQiraatLbl.adjustsFontForContentSizeCategory = true
        
        PublicationLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        PublicationLbl.adjustsFontForContentSizeCategory = true
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
