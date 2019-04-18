//
//  QuranTahqeeqViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/3/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import Alamofire

class QuranTahqeeqViewController: BaseViewController {
    
    var optionSelected = 0
    @IBOutlet weak var VideoLbl: UILabel!
    @IBOutlet weak var AudioLbl: UILabel!
    @IBOutlet weak var SubTitleLbl: UILabel!
    @IBOutlet weak var TitleMainLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var todoEndpoint : String = ""
        //API calling
        if(optionSelected == 1){
             todoEndpoint = "http://channelsmedia.net/quranapp/api/quraan/1"
        }
        if(optionSelected == 2){
             todoEndpoint = "http://channelsmedia.net/quranapp/api/quraan/2"
        }
        if(optionSelected == 3){
             todoEndpoint = "http://channelsmedia.net/quranapp/api/quraan/3"
        }
        if(optionSelected == 4){
             todoEndpoint = "http://channelsmedia.net/quranapp/api/quraan/4"
        }
        
        
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                print("response", response)
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    print("Error: \(response.result.error)")
                    return
                }
                
                print(json)
        }
        
        //FontFamily
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        TitleMainLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TitleMainLbl.adjustsFontForContentSizeCategory = true
        
        SubTitleLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        SubTitleLbl.adjustsFontForContentSizeCategory = true
        
        AudioLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        AudioLbl.adjustsFontForContentSizeCategory = true
        
        VideoLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        VideoLbl.adjustsFontForContentSizeCategory = true
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
