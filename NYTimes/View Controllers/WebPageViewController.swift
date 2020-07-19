//
//  WebPageViewController.swift
//  NYTimes
//
//  Created by Загребельский Валентин on 19.07.2020.
//  Copyright © 2020 Загребельский Валентин. All rights reserved.
//

import UIKit
import WebKit

class WebPageViewController: UIViewController {

    var currentArticle: Article!
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString(currentArticle.htmlData!, baseURL: nil)
    }
}

extension WebPageViewController: UIWebViewDelegate {
}
