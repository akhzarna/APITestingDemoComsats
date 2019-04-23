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
    
    @IBOutlet weak var tblQuranVideo: UITableView!
    @IBOutlet weak var tblQuranAudio: UITableView!
    var optionSelected = 0
    var myApiArray = [Any]()
    var objArray = [AnyObject]()
    @IBOutlet weak var SubTitleLbl: UILabel!
    @IBOutlet weak var TitleMainLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var todoEndpoint : String = ""
        //API calling
       
        
        var asString = String(optionSelected)
        todoEndpoint = "http://channelsmedia.net/quranapp/api/quraan/"+asString

        
        
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                
                self.myApiArray = response.result.value as! [AnyObject]
                //print("response", self.myApiArray)
                
                //reloading table after getting data
                self.tblQuranAudio.reloadData()
                self.tblQuranVideo.reloadData()
                
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
    
    //cell for audio tableviewCell
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let identifier="QuranAudioTableViewCell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QuranAudioTableViewCell
//
//
//        print(myApiArray)
//
//        print( myApiArray[indexPath.row])
//
//        cell.lblTitle.text = (self.myApiArray[indexPath.row] as AnyObject)["title"] as? String;
//
//        return cell
//    }
    
    //cell for Video tableviewCell
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblQuranAudio
        {
            let identifier="QuranAudioTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QuranAudioTableViewCell
            
            
            cell.lblTitle.text = (self.myApiArray[indexPath.row] as AnyObject)["title"] as? String;
            
            return cell
        }
        else if tableView == tblQuranVideo
        {
            let identifier="QuranVideoTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QuranVideoTableViewCell
            
            
            cell.VideoCellLbl.text = (self.myApiArray[indexPath.row] as AnyObject)["title"] as? String;
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           // print("data -====", (self.myApiArray[indexPath.row] as AnyObject)["video_link"] as? String)
//        let video = (self.myApiArray[indexPath.row] as AnyObject)["video_link"] as? String
//
//
//        if var videoURL = video
//        {
//
//            videoURL = "http://channelsmedia.net/quranapp/public/" + videoURL
//            let player = AVPlayer(url: URL(fileURLWithPath: "http://channelsmedia.net/quranapp/public/" + videoURL ) )
//            print(videoURL)
//            let vc = AVPlayerViewController()
//            vc.player = player
//
//            present(vc, animated: true) {
//                vc.player?.play()
//            }
//        }

                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PlayerViewControllerID") as? PlayerViewController
        vc?.dataArray = (self.myApiArray[indexPath.row] as! [String : AnyObject]) as [String : AnyObject];
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
