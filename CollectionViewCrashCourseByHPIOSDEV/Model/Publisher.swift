//
//  Publisher.swift
//  CollectionViewCrashCourseByHPIOSDEV
//
//  Created by hp ios on 1/19/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
import UIKit
class Publisher
{
    var title: String
    var url: String
    var image: UIImage
    var section: String
    
    init(title: String, url: String, image: UIImage, section: String)
    {
        self.title = title
        self.url = url
        self.image = image
        self.section = section
    }
    
    convenience init(copies publisher: Publisher)
    {
        self.init(title: publisher.title, url: publisher.url, image: publisher.image, section: publisher.section)
    }
}
