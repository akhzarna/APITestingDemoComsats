//
//  PlayerViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/4/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class PlayerViewController: UIViewController {
    
    var dataArray: [String: AnyObject] = [String: AnyObject]()
    var player:AVAudioPlayer = AVAudioPlayer()
    @IBOutlet weak var DownloadLbl: UITextView!
    @IBOutlet weak var ShareLbl: UITextView!
    @IBOutlet weak var TitleMainLbl: UILabel!

    @IBAction func DownloadBtn(_ sender: Any) {
    }
    @IBAction func ShareBtn(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("received data iss===", dataArray)
        do
        {
            let stringUrl = "http://channelsmedia.net/quranapp/public/"
            let apiUrl = dataArray["video_link"] as! String
            let audioPath = stringUrl + apiUrl
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath) as URL)
        }
        catch
        {
            //ERROR
        }
        
        guard let customFont = UIFont(name: "Gotham Rounded", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        """
            )
        }
        TitleMainLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        TitleMainLbl.adjustsFontForContentSizeCategory = true
        
        DownloadLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        DownloadLbl.adjustsFontForContentSizeCategory = true
        
        ShareLbl.font = UIFontMetrics.default.scaledFont(for: customFont)
        ShareLbl.adjustsFontForContentSizeCategory = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        //player.play()
        
        
        
        let video = (dataArray as AnyObject)["audio_link"] as? String
        
        var newURL = "http://channelsmedia.net/quranapp/public/" + video!
        
        let videoURL = NSURL(string: newURL)
        let player = AVPlayer(url: videoURL! as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }

//                if var videoURL = video
//                {
//
//                    videoURL = "http://channelsmedia.net/quranapp/public/" + videoURL
//                    let player = AVPlayer(url: URL(fileURLWithPath: "http://channelsmedia.net/quranapp/public/" + videoURL ) )
//                    print(videoURL)
//                    let vc = AVPlayerViewController()
//                    vc.player = player
//
//                    present(vc, animated: true) {
//                        vc.player?.play()
//                    }
//                }
        
        
        
//        if let videoURL = Bundle.main.path(forResource: "America", ofType: "mp4")
//        {
//        let player = AVPlayer(url: URL(fileURLWithPath: videoURL) )
//        let vc = AVPlayerViewController()
//        vc.player = player
//
//        present(vc, animated: true) {
//            vc.player?.play()
//        }
//        }
    }
    
    @IBAction func btnPause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func btnReplay(_ sender: Any) {
        player.currentTime = 0
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
