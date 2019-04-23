//
//  QaidyViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/3/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class QaidyViewController: BaseViewController {

    @IBOutlet weak var GhunnaLbl: UITextView!
    @IBOutlet weak var AmliTajweedLbl: UITextView!
    @IBOutlet weak var QariQaida2Lbl: UITextView!
    @IBOutlet weak var QariQaida1Lbl: UITextView!
    @IBOutlet weak var TajweediQaidaLbl: UITextView!
    @IBOutlet weak var TamhidiQaidaLbl: UITextView!
    @IBOutlet weak var TitleLbl: UILabel!
    
    @IBAction func BtnTamhidiQaida(_ sender: Any) {
        let QaidaSubView = self.storyboard?.instantiateViewController(withIdentifier: "PublicationsViewControllerID") as! PublicationsViewController
        //QaidySubViewController
        self.navigationController?.pushViewController(QaidaSubView, animated: true)
    }
    
    @IBAction func BtnTajweediQaida(_ sender: Any) {
        let QaidaSubView = self.storyboard?.instantiateViewController(withIdentifier: "QaidySubViewControllerID") as! QaidySubViewController
        self.navigationController?.pushViewController(QaidaSubView, animated: true)
    }
    
    @IBAction func BtnQariQaida1(_ sender: Any) {
        let QaidaSubView = self.storyboard?.instantiateViewController(withIdentifier: "QaidySubViewControllerID") as! QaidySubViewController
        self.navigationController?.pushViewController(QaidaSubView, animated: true)
    }
    @IBAction func BtnQariQaida2(_ sender: Any) {
        let QaidaSubView = self.storyboard?.instantiateViewController(withIdentifier: "QaidySubViewControllerID") as! QaidySubViewController
        self.navigationController?.pushViewController(QaidaSubView, animated: true)
    }
    
    @IBAction func BtnAmliTajweed(_ sender: Any) {
        let QaidaSubView = self.storyboard?.instantiateViewController(withIdentifier: "QaidySubViewControllerID") as! QaidySubViewController
        self.navigationController?.pushViewController(QaidaSubView, animated: true)
    }
    @IBAction func BtnGhunna(_ sender: Any) {
        let QaidaSubView = self.storyboard?.instantiateViewController(withIdentifier: "QaidySubViewControllerID") as! QaidySubViewController
        self.navigationController?.pushViewController(QaidaSubView, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font. CCSignLanguageW00-Regular
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        TitleLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TitleLbl.adjustsFontForContentSizeCategory = false
        
        TamhidiQaidaLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TamhidiQaidaLbl.adjustsFontForContentSizeCategory = true
        
        TajweediQaidaLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TajweediQaidaLbl.adjustsFontForContentSizeCategory = true
        
        QariQaida1Lbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        QariQaida1Lbl.adjustsFontForContentSizeCategory = true
        
        QariQaida2Lbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        QariQaida2Lbl.adjustsFontForContentSizeCategory = true
        
        AmliTajweedLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        AmliTajweedLbl.adjustsFontForContentSizeCategory = true
        
        GhunnaLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        GhunnaLbl.adjustsFontForContentSizeCategory = true
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
