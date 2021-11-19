//
//  CalendarViewCell.swift
//  HaneulDiary
//
//  Created by Yeni Hwang on 2021/11/20.
//

import UIKit
import SDWebImage

class CalendarCell: UICollectionViewCell {
    @IBOutlet weak var skyImage: UIImageView!

    func configure(image : URL?){
        skyImage.sd_setImage(with: image, completed: nil)
    }

}
