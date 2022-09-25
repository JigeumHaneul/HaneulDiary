//
//  DiaryFeedCellViewModel.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/24.
//

import Foundation
import UIKit

struct DiaryFeedViewModel{
    var diaryImage : UIImage
    var diaryText : String
    var diaryDate : String
    
    init(image : UIImage,text:String,date : String){
        diaryImage = image
        diaryText = text
        diaryDate = date
    }
    
}
