//
//  QuraanViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/2/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class QuraanViewController: BaseViewController {
    
    @IBOutlet weak var HadrLbl: UITextView!
    @IBOutlet weak var TadweerLbl: UITextView!
    @IBOutlet weak var TarteelLbl: UITextView!
    @IBOutlet weak var TahqeeqLbl: UITextView!
    @IBOutlet weak var TitleLbl: UITextView!
    
    @IBAction func BtnHadr(_ sender: Any) {
        let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "QuranTahqeeqViewControllerID") as! QuranTahqeeqViewController
        CategoryPageView.optionSelected = 4
        self.navigationController?.pushViewController(CategoryPageView, animated: true)
    }
    
    @IBAction func BtnTadweer(_ sender: Any) {
        let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "QuranTahqeeqViewControllerID") as! QuranTahqeeqViewController
        CategoryPageView.optionSelected = 3
        self.navigationController?.pushViewController(CategoryPageView, animated: true)
    }
    
    @IBAction func BtnTarteel(_ sender: Any) {
        let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "QuranTahqeeqViewControllerID") as! QuranTahqeeqViewController
        CategoryPageView.optionSelected = 2
        self.navigationController?.pushViewController(CategoryPageView, animated: true)
    }
    
    @IBAction func BtnTahqeeq(_ sender: Any) {
        let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "QuranTahqeeqViewControllerID") as! QuranTahqeeqViewController
             CategoryPageView.optionSelected = 1
        self.navigationController?.pushViewController(CategoryPageView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Qari Ibrahim Mir Mohammadi"
            navigationController?.navigationBar.topItem?.title = ""
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        TitleLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TitleLbl.adjustsFontForContentSizeCategory = true
        TahqeeqLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TahqeeqLbl.adjustsFontForContentSizeCategory = true
        TarteelLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TarteelLbl.adjustsFontForContentSizeCategory = true
        TadweerLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TadweerLbl.adjustsFontForContentSizeCategory = true
        HadrLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        HadrLbl.adjustsFontForContentSizeCategory = true
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
