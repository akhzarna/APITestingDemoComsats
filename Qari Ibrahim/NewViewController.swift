//
//  NewViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/2/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class NewViewController: BaseViewController  {
    open var hidesNavigationBarWhenPushed = false
    
    @IBAction func LanguageSelectionBtn(_ sender: Any) {
        if((sender as AnyObject).tag == 1){
            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "CategoryHomeViewControllerID") as! CategoryHomeViewController
            self.navigationController?.pushViewController(CategoryPageView, animated: true)
        }
        
        if((sender as AnyObject).tag == 2){
//            let CategoryPageView = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewControllerID") as! PlayerViewController
//            self.navigationController?.pushViewController(CategoryPageView, animated: true)
            
            let pdfViewController = self.storyboard?.instantiateViewController(withIdentifier: "PdfReaderViewControllerID") as! PdfReaderViewController
            self.navigationController?.pushViewController(pdfViewController, animated: true)
                    
                    
//                    PdfReaderViewController()
//               // pdfViewController.pdfURL = self.pdfURL
//                present(pdfViewController, animated: false, completion: nil)
            
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(hidesNavigationBarWhenPushed, animated: animated)
        
//        let urlwith = URL.init(string: "http://channelsmedia.net/quranapp/api/quraan/1")
//        let request = URLRequest(url: urlwith!)
//        print("request response", request)
        //self.webView.loadRequest(request)
        
        var url : String = "http://channelsmedia.net/quranapp/api/quraan/1"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = URL(string: url)
        request.httpMethod = "GET"
        
//        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue(), completionHandler:{ (response:URLResponse!, data: NSData!, error: NSError!) -> Void in
//            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
//            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
//
//            if (jsonResult != nil) {
//                // process jsonResult
//            } else {
//                // couldn't load JSON, look at error
//            }
//
//
//        })
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
       // addSlideMenuButton()

        
        self.navigationItem.title = "Language"
        if let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                   .userDomainMask,
                                                                   true).first {
            debugPrint("documentsPath = \(documentsPath)")
        }
        
         //  let headerTitleColor = UIColor.white;
           self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "CCSignLanguageW00-Regular", size: 22)!]
        
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
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
