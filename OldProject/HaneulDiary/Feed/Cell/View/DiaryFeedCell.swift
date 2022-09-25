//
//  DiaryFeedCell.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/19.
//

import UIKit
import Combine

class DiaryFeedCell: UITableViewCell {
    @IBOutlet weak var skyImage: UIImageView!
    @IBOutlet weak var diaryContext: UILabel!
    @IBOutlet weak var diaryDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
        
        
        // Initialization code
    }

    
    
    
    func setStyle(){
        skyImage.layer.masksToBounds = true
        skyImage.layer.cornerRadius = 10
    }
    
    func configure(image : UIImage?,context : String, date : String){
        skyImage.image = image
        diaryContext.text = context
        diaryDate.text = date
    }
    
}
