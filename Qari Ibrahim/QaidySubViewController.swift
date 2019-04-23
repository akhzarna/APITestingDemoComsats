//
//  QaidySubViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/11/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import Alamofire

class QaidySubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TblQaidyPublication: UITableView!
    @IBOutlet weak var TblQaidyVideo: UITableView!
    @IBOutlet weak var TblQaidyAudio: UITableView!
    @IBOutlet weak var TitleMainLbl: UILabel!
    var optionSelected = 0
    var myApiArray = [Any]()
    var objArray = [AnyObject]()
    @IBOutlet weak var publicationtextLbl: UILabel!
    
    @IBOutlet weak var audioViewContainer: UIView!
    @IBOutlet weak var videoViewContainer: UIView!
    @IBOutlet weak var publicationViewContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var todoEndpoint : String = ""
        //API calling
        if(optionSelected == 1){
            todoEndpoint = "http://channelsmedia.net/quranapp/api/tajweed/1"
        }
        if(optionSelected == 2){
            todoEndpoint = "http://channelsmedia.net/quranapp/api/tajweed/2"
        }
        if(optionSelected == 3){
            todoEndpoint = "http://channelsmedia.net/quranapp/api/tajweed/3"
        }
        
        
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                
                self.myApiArray = response.result.value as! [AnyObject]
                print("response", self.myApiArray)
                
                //reloading table after getting data
                self.TblQaidyAudio.reloadData()
                self.TblQaidyVideo.reloadData()
                self.TblQaidyPublication.reloadData()
                
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
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let Nurows = self.myApiArray.count
        return Nurows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == TblQaidyAudio
        {
            let identifier="QaidyAudioTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QaidyAudioTableViewCell
            
            
            cell.audioTitleLbl.text = (self.myApiArray[indexPath.row] as AnyObject)["title"] as? String;
            
            return cell
        }
        else if tableView == TblQaidyVideo
        {
            let identifier="QaidyVideoTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QaidyVideoTableViewCell
            
            
            cell.videoTitleLbl.text = (self.myApiArray[indexPath.row] as AnyObject)["title"] as? String;
            
            return cell
        }
        else if tableView == TblQaidyPublication
        {
            let identifier="QaidyPublicationTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! QaidyPublicationTableViewCell
            
            
            cell.publicationTitleLbl.text = (self.myApiArray[indexPath.row] as AnyObject)["title"] as? String;
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
        
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
