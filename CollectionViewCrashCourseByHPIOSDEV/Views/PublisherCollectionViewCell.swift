//
//  PublisherCollectionViewCell.swift
//  CollectionViewCrashCourseByHPIOSDEV
//
//  Created by hp ios on 1/20/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit

class PublisherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var publisherImageView: UIImageView!
    
    @IBOutlet weak var publisherTitleLabel: UILabel!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var publisher : Publisher?
    {
       didSet
       {
            updateUI()
        
        
       }
        
    }
    func updateUI()
    {
        publisherImageView.image = publisher?.image
        
    }
    
    
}
