//
//  CategoryHomeViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/2/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import Alamofire

class CategoryHomeViewController: BaseViewController {
    @IBOutlet weak var QuraanLbl1: UITextView!
    
    @IBOutlet weak var OnlineclassLbl7: UITextView!
    @IBOutlet weak var LiveclassLbl6: UITextView!
    @IBOutlet weak var TasbeehLbl5: UITextView!
    @IBOutlet weak var PublicationsLbl4: UITextView!
    @IBOutlet weak var TajweedLbl2: UITextView!
    @IBOutlet weak var QiraatLbl2: UITextView!
    open var hidesNavigationBarWhenPushed = false
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(hidesNavigationBarWhenPushed, animated: animated)
    }
    
     @IBAction func CategorySelectionBtn(_ sender: Any) {
        if((sender as AnyObject).tag == 1){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "QuraanViewControllerID") as! QuraanViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        
        if((sender as AnyObject).tag == 2){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "QiraatViewControllerID") as! QiraatViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        if((sender as AnyObject).tag == 3){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "TajweedViewControllerID") as! TajweedViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        
        if((sender as AnyObject).tag == 4){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "PublicationsViewControllerID") as! PublicationsViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        
        if((sender as AnyObject).tag == 5){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "TasbeehViewControllerID") as! TasbeehViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        
        if((sender as AnyObject).tag == 6){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "LiveClassViewControllerID") as! LiveClassViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        
        if((sender as AnyObject).tag == 7){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "OnlineClassesViewControllerID") as! OnlineClassesViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSlideMenuButton()
        
//        let todoEndpoint: String = "http://channelsmedia.net/quranapp/api/quraan/1"
//        Alamofire.request(todoEndpoint)
//            .responseJSON { response in
//                print("response==", response.result.value)
//                guard let json = response.result.value as? [String: Any] else {
//                    print("didn't get todo object as JSON from API")
//                    print("Error: \(response.result.error)")
//                    return
//                }
//                print("here is the jsonn",json)
//        }
        
        self.navigationItem.title = NSLocalizedString("AppName", comment: "")
        navigationController?.navigationBar.topItem?.title = ""
        
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font. CCSignLanguageW00-Regular
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        QuraanLbl1.font = UIFontMetrics.default.scaledFont(for: customFont)
        QuraanLbl1.adjustsFontForContentSizeCategory = true
       // QuraanLbl1.textColor = UIColor.init()
        
        TajweedLbl2.font = UIFontMetrics.default.scaledFont(for: customFont)
        TajweedLbl2.adjustsFontForContentSizeCategory = true
        
        QiraatLbl2.font = UIFontMetrics.default.scaledFont(for: customFont)
        QiraatLbl2.adjustsFontForContentSizeCategory = true
        
        PublicationsLbl4.font = UIFontMetrics.default.scaledFont(for: customFont)
        PublicationsLbl4.adjustsFontForContentSizeCategory = true
        
        TasbeehLbl5.font = UIFontMetrics.default.scaledFont(for: customFont)
        TasbeehLbl5.adjustsFontForContentSizeCategory = true
        
        LiveclassLbl6.font = UIFontMetrics.default.scaledFont(for: customFont)
        LiveclassLbl6.adjustsFontForContentSizeCategory = true
        
        OnlineclassLbl7.font = UIFontMetrics.default.scaledFont(for: customFont)
        OnlineclassLbl7.adjustsFontForContentSizeCategory = true
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
