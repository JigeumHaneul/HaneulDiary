//
//  NewFeedViewModel.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/20.
//

import Foundation
import UIKit

class DiaryData : NSObject {
    @objc dynamic var diaryData : [FeedDataModel] = []
}

class FeedViewModel: NSObject{
    
    var diaryDatas = DiaryData()
    var diaryDataCount  :Int {
        return diaryDatas.diaryData.count
    }
    private var images:[UIImage?] = [UIImage(named: "image1"),UIImage(named: "image2")]
    private var diaryContexts:[String] = ["수고했어~ 오늘도!!","오늘 하늘 예쁘다! 왕왕 행복하다"]
    private var dates:[String] = ["2021.11.21 05:00pm","2021.11.20 10:30am"]
    

    func setData(){
        for i in 0..<2{
            diaryDatas.diaryData.append(FeedDataModel(image: images[i], diaryContext: diaryContexts[i], date: dates[i]))
        }
    }
    
    func getData(image : UIImage?,diaryContext : String,date : String){
        diaryDatas.diaryData.append(FeedDataModel(image: image, diaryContext: diaryContext, date: date))
        
    }
}
