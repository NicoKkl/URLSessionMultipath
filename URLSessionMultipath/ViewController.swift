//
//  ViewController.swift
//  URLSessionMultipath
//
//  Copyright © 2020 NK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {

        @IBOutlet weak var buttonAction: UIButton!
        @IBOutlet weak var label: UILabel!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        @IBAction func buttonPushed(_ sender: Any) {
            //File from a MPTCP enabled website.
            let url = URL(string: "https://multipath-tcp.org/pub/inl.png")!
            let sessionConfiguration = URLSessionConfiguration.ephemeral
            
            if #available(iOS 11.0, *) {
                sessionConfiguration.multipathServiceType = .interactive
            }
            
            let session = URLSession(configuration: sessionConfiguration,
                                          delegate: self,
                                          delegateQueue: OperationQueue.main)
            
            let downloadTask = session.downloadTask(with: url)
            downloadTask.resume()
        }
        
        func urlSession(_ session: URLSession,
                        downloadTask: URLSessionDownloadTask,
                        didFinishDownloadingTo location: URL){
            label.text = "Downloaded"
        }
    }

