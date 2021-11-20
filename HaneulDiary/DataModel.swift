//
//  DataModel.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/20.
//

import Foundation
import UIKit

class FeedDataModel : NSObject{
    var image : UIImage?
    var diaryContext : String
    var date : String
    
    init(image : UIImage?, diaryContext : String, date : String) {
        self.image = image
        self.diaryContext = diaryContext
        self.date = date
    }
}
