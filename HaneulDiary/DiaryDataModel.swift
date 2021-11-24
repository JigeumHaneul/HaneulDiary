//
//  NewDataModel.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/20.
//

import Foundation
import UIKit

class FeedDataModel : NSObject{
    var diaryImage : UIImage? // -> diaryImage 변경
    var diaryText : String // -> diaryContent 변경 (옵셔널)
    var diaryDate : String // -> diaryDate 변경 (옵셔널)
    
    init(image : UIImage?, diaryContext : String, date : String) {
        self.diaryImage = image
        self.diaryText = diaryContext
        self.diaryDate = date
    }
}
