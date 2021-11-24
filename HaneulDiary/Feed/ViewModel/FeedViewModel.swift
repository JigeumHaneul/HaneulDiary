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
    private var images:[UIImage?] = [UIImage(named: "image1"),UIImage(named: "image2"),UIImage(named: "image3"),UIImage(named: "image4"),UIImage(named: "image5")]
    private var diaryContexts:[String] = ["수고했어~ 오늘도!!","오늘 하늘 예쁘다! 왕왕 행복하다","날이 좋아서… 날이 좋지 않아서...","내일도 하늘 예뻤으면 좋겠다","날씨가 맑아서 기분이 좋았다"]
    private var dates:[String] = ["2021.11.20 05:00pm","2021.11.20 10:30am","2021.11.19 12:00pm","2021.11.17 02:30pm","2021.11.17 03:00pm"]
    

    func setData(){
        for i in 0..<dates.count{
            diaryDatas.diaryData.append(FeedDataModel(image: images[i], diaryContext: diaryContexts[i], date: dates[i]))
        }
    }
    
    func getData(image : UIImage?,diaryContext : String,date : String){
        diaryDatas.diaryData.append(FeedDataModel(image: image, diaryContext: diaryContext, date: date))
        
    }
}
