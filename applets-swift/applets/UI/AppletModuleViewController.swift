//
//  AppletModuleViewController.swift
//  applets-swift
//
//  Created by Mars Scala on 2020/11/10.
//

import UIKit
import WebKit

class AppletModuleViewController: UIViewController {
//    var applets: Applets
//    var applet: Applet
    let loader: Applets.Loader
    let entry: AppletEntry
    
    
    let webView : AppletModuleWebView = {
        let config = WKWebViewConfiguration()
        let web = AppletModuleWebView(frame: .zero, manager: AppletsWidgetManager.widgetManager)
        return web
    }()
    
    init(loader: Applets.Loader, entry: AppletEntry) {
        self.loader = loader
        self.entry = entry
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = view.bounds
        view.addSubview(webView)
        webView.loadHTMLString(loader.url(entry: self.entry), baseURL: nil)
        // Do any additional setup after loading the view.
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
