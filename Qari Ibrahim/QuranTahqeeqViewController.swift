///Users/muhammadamir/Desktop/IOS Projects/Kuwait Apps Data/Git Codes/qariibrahimkuwaitclient/Qari Ibrahim/QuranVideoTableViewCell.swift
//  QuranTahqeeqViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/3/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import Alamofire
import AVKit
import AVFoundation

class QuranTahqeeqViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var viewOfAudio: UIView!
    @IBOutlet weak var viewOfVideo: UIView!
    @IBOutlet weak var tblQuranVideo: UITableView!
    @IBOutlet weak var tblQuranAudio: UITableView!
    var optionSelected = 0
    var controlerSelected = 0  // 1 for quran 2 for qirat
    var myApiArray = [QuranTehqeeqAudioVideo]()
    var objArray = [AnyObject]()
    @IBOutlet weak var SubTitleLbl: UILabel!
    @IBOutlet weak var TitleMainLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var todoEndpoint : String = ""
        //API calling
       
        
        let asString = String(optionSelected)
        if (controlerSelected == 1) {
            todoEndpoint = "http://channelsmedia.net/quranapp/api/quraan/"+asString
        }
        if (controlerSelected == 2) {
            todoEndpoint = "http://channelsmedia.net/quranapp/api/qiraat/"+asString
            if (optionSelected == 1){
                tblQuranAudio.isHidden = false
                tblQuranVideo.isHidden = false
            }else{
                tblQuranAudio.isHidden = false
                tblQuranVideo.isHidden = true
                viewOfVideo.isHidden = true
            }
        }
        

        
        
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                let arrAccess = response.result.value as! [AnyObject]
                print("response", arrAccess)
                self.myApiArray = QuranTehqeeqAudioVideo.PopulateArray(array: arrAccess as! [[String : Any]])
                print("response", self.myApiArray)
                //reloading table after getting data
                self.tblQuranAudio.reloadData()
                self.tblQuranVideo.reloadData()
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                
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
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let Nurows = self.myApiArray.count
        return Nurows
    }
    
   
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblQuranAudio
        {
            let identifier="QuranAudioTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QuranAudioTableViewCell
            let quranList = self.myApiArray[indexPath.row]
            cell.lblTitle.text = quranList.title
            return cell
        }
            
        else if tableView == tblQuranVideo
        {
            let identifier="QuranVideoTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QuranVideoTableViewCell
            let quranList = self.myApiArray[indexPath.row]
            cell.VideoCellLbl.text = quranList.title
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // tag=1 for audio & tag=2 for video
        var tag = 0
        if(tableView.tag == 1){
        tag = 1
        }
        if(tableView.tag == 2){
         tag = 2
        }
        let vc = UIStoryboard.init(name: "Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "PlayerViewControllerID") as? PlayerViewController
        let indexObject = self.myApiArray[indexPath.row]
        vc?.myApiArray = indexObject
        vc?.tag = tag
        self.navigationController?.pushViewController(vc!, animated: true)
        
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
