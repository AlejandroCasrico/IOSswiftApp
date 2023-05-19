//
//  WebViewViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 23/03/23.
//

import UIKit
import WebKit
class WebViewViewController: UIViewController {

    @IBOutlet weak var otherWebView: WKWebView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       guard let url =
            URL(string:"https://www.youtube.com/watch?v=DntjVRYotfk")
        else{return}
        webView
            .load(URLRequest(url:url))
        guard let url =
             URL(string:"https://www.youtube.com/watch?v=TnlGuB1FiYg")
         else{return}
         otherWebView
             .load(URLRequest(url:url))
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
