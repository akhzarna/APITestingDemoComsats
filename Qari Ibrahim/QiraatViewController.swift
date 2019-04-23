//
//  QiraatViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/2/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import Alamofire

class QiraatViewController: BaseViewController {
    var optionSelected = 0
    var myApiArray = [Any]()
    @IBOutlet weak var PublicationLbl: UITextView!
    @IBOutlet weak var LearnQiraatLbl: UITextView!
    @IBOutlet weak var TakmeelLbl: UITextView!
    @IBOutlet weak var ClassesLbl: UITextView!
    @IBOutlet weak var RecitationLbl: UITextView!
    @IBOutlet weak var TitleLbl: UITextView!
    
    @IBAction func QiratSelectionBtn(_ sender: Any) {
        if((sender as AnyObject).tag == 1){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "PublicationsViewControllerID") as! PublicationsViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        
        if((sender as AnyObject).tag == 2){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "QiraatViewControllerID") as! QiraatViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        
//        if((sender as AnyObject).tag == 3){
//            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "TajweedViewControllerID") as! TajweedViewController
//            self.navigationController?.pushViewController(CategoryPageView, animated: true)
//        }
//
//        if((sender as AnyObject).tag == 4){
//            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "PublicationsViewControllerID") as! PublicationsViewController
//            self.navigationController?.pushViewController(CategoryPageView, animated: true)
//        }
//        if((sender as AnyObject).tag == 5){
//            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "TasbeehViewControllerID") as! TasbeehViewController
//            self.navigationController?.pushViewController(CategoryPageView, animated: true)
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var todoEndpoint : String = ""
        //API calling
        if(optionSelected == 0){
            todoEndpoint = "http://channelsmedia.net/quranapp/api/qiraat/1"
        }
        if(optionSelected == 2){
            todoEndpoint = "http://channelsmedia.net/quranapp/api/qiraat/2"
        }
        if(optionSelected == 3){
            todoEndpoint = "http://channelsmedia.net/quranapp/api/qiraat/3"
        }
        if(optionSelected == 4){
            todoEndpoint = "http://channelsmedia.net/quranapp/api/qiraat/4"
        }
        if(optionSelected == 5){
            todoEndpoint = "http://channelsmedia.net/quranapp/api/qiraat/5"
        }
        
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                self.myApiArray = response.result.value as! [AnyObject]
                print("response", self.myApiArray)
                //self.tblQuranAudio.reloadData()
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                //                guard let json = response.result.value as? [String: Any] else {
                //                    print("didn't get todo object as JSON from API")
                //                    print("Error: \(response.result.error)")
                //                    return
                //                }
                
                //print(json)
        }
        
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
