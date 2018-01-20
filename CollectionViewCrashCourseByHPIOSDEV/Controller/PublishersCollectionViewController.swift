//
//  PublishersCollectionViewController.swift
//  CollectionViewCrashCourseByHPIOSDEV
//
//  Created by hp ios on 1/19/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
import UIKit
class PublishersCollectionViewController : UICollectionViewController
{
    let publisher = Publishers()
    
    private let leftAndRightPaddings:CGFloat = 32.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heightAdjustment: CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NEWS"
        let width = ((self.collectionView?.bounds.size.width)! - leftAndRightPaddings) /
                     numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width,height: width+heightAdjustment)
        
        
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return publisher.numberOfPublishers
    }
    private struct StoryBoard
    {
        static let CellIdentifier = "PublisherCell"
        static let ShowWebView = "ShowWebview"
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.CellIdentifier,
                                                      for: indexPath) as! PublisherCollectionViewCell
        cell.publisher = publisher.publisherForItemAtIndexPath(indexPath)
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let publisher = self.publisher.publisherForItemAtIndexPath(indexPath)
        self.performSegue(withIdentifier: StoryBoard.ShowWebView , sender: publisher)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == StoryBoard.ShowWebView
        {
           let wvc =  segue.destination as! WebViewController
           let publisher = sender as! Publisher
           wvc.publisher = publisher
        }
        
    }
    
}
