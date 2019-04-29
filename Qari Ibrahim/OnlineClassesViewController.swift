//
//  OnlineClassesViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/4/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class OnlineClassesViewController: BaseViewController {

    @IBOutlet weak var TitleMainLbl: UILabel!
    @IBOutlet weak var DescriptionLbl: UILabel!
    @IBAction func BtnRequestOnlineClass(_ sender: Any) {
        let requestOnlineClass = UIStoryboard.init(name: "Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "RequestClassViewControllerID") as? RequestClassViewController
       
        self.navigationController?.pushViewController(requestOnlineClass!, animated: true)
    }
    @IBOutlet weak var LblOfButton: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        TitleMainLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TitleMainLbl.adjustsFontForContentSizeCategory = true
        
        DescriptionLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        DescriptionLbl.adjustsFontForContentSizeCategory = true
        
        LblOfButton.font = UIFontMetrics.default.scaledFont(for: customFont)
        LblOfButton.adjustsFontForContentSizeCategory = true
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
