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
    
    let images : [String] = ["https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbAnJsd%2FbtrlDcNP2Tl%2FNPo0IiDaJyHI8LBWotXpZK%2Fimg.png","https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbugqAb%2FbtrlGIYumYF%2FeB6bhXKdIAmK0DKZ2KzPJk%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbwm6zJ%2FbtrlDWKt8f4%2FyghVqGsLxof4dN95yj7Pe1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZLEWj%2FbtrlDcAfgsk%2FzL3P6ZK2ZNuZELHi5kz7Nk%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdtK8T6%2FbtrlDdTtvnT%2FzGs4L0L7gifzTWtM2ykCU0%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbrLsa2%2FbtrlGIKXWPS%2FkYM4WHm2tK5mHPFis8rGM0%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbjPqNr%2FbtrlFbNExsB%2FwxdWpcGZchqHzoGin3RHlk%2Fimg.png", /* 구름 시작 */  "https://images.pexels.com/photos/907485/pexels-photo-907485.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://mblogthumb-phinf.pstatic.net/MjAxNzAyMDJfMjg5/MDAxNDg1OTk2ODc2Njc0.YLls08aCtZPAMR8GBJ4ktIadCtUzpPeS1jdzBTkt6nUg.W-p_93_51zJ9YvoxTevbSB0WO3YV1F0Qr91XpepRrg0g.JPEG.pho6400/1.jpg?type=w800", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://file.mk.co.kr/meet/neds/2020/09/image_readtop_2020_1003131_16013054424374071.jpg", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "", "", "", "https://cdn.hkbs.co.kr/news/photo/201805/468704_235713_3854.jpg", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendarCollectionView.dataSource = self
        self.calendarCollectionView.delegate = self
    }
}

extension CalendarViewController: UICollectionViewDelegate {

}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }

        // 옆 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }

        // cell 사이즈( 옆 라인을 고려하여 설정 )
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let width = collectionView.frame.width / 7
//            print("collectionView width=\(collectionView.frame.width)")
//            print("cell하나당 width=\(width)")
//            print("root view width = \(self.view.frame.width)")

            let size = CGSize(width: width, height: width)
            return size
        }
}

extension CalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
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
        self.skyImage.sd_setImage(with: image, completed: nil)
    }
}
