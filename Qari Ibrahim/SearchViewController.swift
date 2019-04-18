//
//  SearchViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/9/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {

    @IBOutlet weak var SearchView: UIView!
    @IBOutlet weak var SearchTextInputfield: UITextField!
    @IBOutlet weak var TitleLbl: UILabel!
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
        
        //subTextLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        //subTextLbl.adjustsFontForContentSizeCategory = true
        
        SearchView.layer.cornerRadius = 27
        SearchView.layer.borderWidth = 2
        SearchView.layer.borderColor = UIColor.blue.cgColor
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
