//
//  TajweedViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/2/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class TajweedViewController: BaseViewController {
    
    @IBOutlet weak var CoursesLbl: UITextView!
    @IBOutlet weak var WorkshopsLbl: UITextView!
    @IBOutlet weak var QaidyLbl: UITextView!
    @IBOutlet weak var TitleLbl: UITextView!
    
    @IBAction func BtnCourses(_ sender: Any) {
        let QaidyPageView = self.storyboard?.instantiateViewController(withIdentifier: "QaidySubViewControllerID") as! QaidySubViewController
        QaidyPageView.optionSelected = 2
        self.navigationController?.pushViewController(QaidyPageView, animated: true)
    }
    
    @IBAction func BtnWorkshops(_ sender: Any) {
        let QaidyPageView = self.storyboard?.instantiateViewController(withIdentifier: "QaidySubViewControllerID") as! QaidySubViewController
        QaidyPageView.optionSelected = 3
        self.navigationController?.pushViewController(QaidyPageView, animated: true)
    }
    
    @IBAction func BtnQaidy(_ sender: Any) {
        let QaidyPageView = self.storyboard?.instantiateViewController(withIdentifier: "QaidySubViewControllerID") as! QaidySubViewController
        QaidyPageView.optionSelected = 1
        self.navigationController?.pushViewController(QaidyPageView, animated: true)
    }
    
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
        QaidyLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        QaidyLbl.adjustsFontForContentSizeCategory = true
        WorkshopsLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        WorkshopsLbl.adjustsFontForContentSizeCategory = true
        CoursesLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        CoursesLbl.adjustsFontForContentSizeCategory = true
        
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
