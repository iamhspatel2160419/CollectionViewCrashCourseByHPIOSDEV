//
//  WebViewController.swift
//  CollectionViewCrashCourseByHPIOSDEV
//
//  Created by hp ios on 1/20/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//
import UIKit

class WebViewController: UIViewController, UIWebViewDelegate
{
    var publisher: Publisher!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet private weak var webView: UIWebView!
    
    private var hasFinishLoading = false
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = publisher.title
        webView.delegate = self
        webView.stopLoading()
        let pageURL = NSURL(string: publisher.url)!
        let request = NSURLRequest(url: pageURL as URL)
        webView.loadRequest(request as URLRequest)
        //        navigationController?.hidesBarsOnSwipe = true
    }
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        hasFinishLoading = false
        updateProgress()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
       
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            [weak self] in
            if let _self = self {
                _self.hasFinishLoading = true
            }
        }


       
    }
    
    deinit {
        webView.stopLoading()
        webView.delegate = nil
    }
    
    func updateProgress() {
        if progressView.progress >= 1 {
            progressView.isHidden = true
        } else {
            
            if hasFinishLoading {
                progressView.progress += 0.002
            } else {
                if progressView.progress <= 0.3 {
                    progressView.progress += 0.004
                } else if progressView.progress <= 0.6 {
                    progressView.progress += 0.002
                } else if progressView.progress <= 0.9 {
                    progressView.progress += 0.001
                } else if progressView.progress <= 0.94 {
                    progressView.progress += 0.0001
                } else {
                    progressView.progress = 0.9401
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100))
            {
                [weak self] in
                if let _self = self {
                    _self.hasFinishLoading = true
                }
            }
        }
    }
    
    
}


