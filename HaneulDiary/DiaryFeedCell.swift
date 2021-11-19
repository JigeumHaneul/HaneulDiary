//
//  DiaryFeedCell.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/19.
//

import UIKit
import SDWebImage

class DiaryFeedCell: UITableViewCell {
    @IBOutlet weak var skyImage: UIImageView!
    @IBOutlet weak var diaryContext: UILabel!
    @IBOutlet weak var diaryDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
        skyImage.layer.cornerRadius = 10
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func setStyle(){
        skyImage.layer.masksToBounds = true
        skyImage.layer.shadowRadius = 10
//        skyImage.layer.shadowOffset = .zero
//        skyImage.layer.shadowOpacity = 0.5
//        skyImage.layer.shadowColor = UIColor.black.cgColor
    }
    
    func configure(image : URL?,context : String, date : String){
        skyImage.sd_setImage(with: image, completed: nil)
        diaryContext.text = context
        diaryDate.text = date
    }
    
}
