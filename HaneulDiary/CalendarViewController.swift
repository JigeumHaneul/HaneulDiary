//
//  CalenderViewController.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/19.
//

import UIKit
import SDWebImage

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    let images : [String] = ["https://images.pexels.com/photos/907485/pexels-photo-907485.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://mblogthumb-phinf.pstatic.net/MjAxNzAyMDJfMjg5/MDAxNDg1OTk2ODc2Njc0.YLls08aCtZPAMR8GBJ4ktIadCtUzpPeS1jdzBTkt6nUg.W-p_93_51zJ9YvoxTevbSB0WO3YV1F0Qr91XpepRrg0g.JPEG.pho6400/1.jpg?type=w800"]
    
    override func viewDidLoad() {
        print("ddddd")
        super.viewDidLoad()
        print("here cal!!!!")
        self.calendarCollectionView.dataSource = self
        self.calendarCollectionView.delegate = self
        self.calendarCollectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
    }
}

extension CalendarViewController: UICollectionViewDelegate {

}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    
}

extension CalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as? CalendarCell else { return CalendarCell()}
//        cell.skyImage.sd_setImage(with: URL(string: images[indexPath.row]), completed: nil)
        cell.configure(image: URL(string: images[indexPath.row]))
        return cell
    }
    
}

class CalendarCell :UICollectionViewCell{
 
   
    @IBOutlet weak var skyImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(image : URL?){
        print(image)
        print(skyImage)
        self.skyImage.sd_setImage(with: image, completed: nil)
    }
}
