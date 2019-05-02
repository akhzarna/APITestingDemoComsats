//
//  PdfReaderViewController.swift
//  Qari Ibrahim
//
//  Created by Muhammad Amir on 4/23/19.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit
import PDFKit

class PdfReaderViewController: UIViewController {

    var pdfView = PDFView()
    var pdfURL:String = ""
    
    
    @IBOutlet weak var viewOfPdf: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewOfPdf.addSubview(pdfView)
        var finalUrl = "https://www.tutorialspoint.com/swift/swift_tutorial.pdf"
            //"http://channelsmedia.net/quranapp/api/quraan/" + pdfURL
        let urll = NSURL(string: finalUrl)
        print("url of pDF==", urll)
        if let document = PDFDocument(url: urll as! URL) {
            pdfView.document = document
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    

    override func viewDidLayoutSubviews() {
        pdfView.frame = viewOfPdf.frame
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func downloadButtonPressed(_ sender: Any) {
        guard let url = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf") else { return }
        
        let urlSession = URLSession(configuration: .default, delegate: self as? URLSessionDelegate, delegateQueue: OperationQueue())
        
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
}


//extension ViewController:  URLSessionDownloadDelegate {
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//        print("downloadLocation:", location)
//    }
//}


extension ViewController:  URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("downloadLocation:", location)
        var pdfURLTest: URL!
        // create destination URL with the original pdf name
        guard let url = downloadTask.originalRequest?.url else { return }
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
        // delete original copy
        try? FileManager.default.removeItem(at: destinationURL)
        // copy from temp to Document
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
            pdfURLTest = destinationURL
        } catch let error {
            print("Copy Error: \(error.localizedDescription)")
        }
    }
}
