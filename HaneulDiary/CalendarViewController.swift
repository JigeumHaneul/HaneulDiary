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
    
    let images : [String] = [/* sun */ "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcMnn9l%2FbtrlDv7twkN%2Fw8KEBAkCgv0Kckgnu4CdP0%2Fimg.png", /* mon */ "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fd9vwCG%2FbtrlDxRMnGe%2FSNaa8FAP5gcol4Xtlm2KMK%2Fimg.png",/* tue */ "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F9sL6P%2FbtrlEIdVNkH%2FjcUEKzXUz7tlpyKoIIR8u0%2Fimg.png", /* wed */ "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FxAHd1%2FbtrlEnOE1Lv%2FiLWaK7HLgOLhXVc0vWLAJk%2Fimg.png", /* thu */ "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbzTSzB%2FbtrlGKa3ha1%2FK6sWeYrIKIQhjczlM08gI1%2Fimg.png", /* fri */ "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbO50wm%2FbtrlFbtrI3j%2F2V1myFEtfoDWtnavX1gvBK%2Fimg.png", /* sat */ "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbjJlol%2FbtrlEm92n1S%2F8Gks6G8KYlqdmOhIkzXSIk%2Fimg.png",  /* 구름 시작 */  "https://images.pexels.com/photos/907485/pexels-photo-907485.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://mblogthumb-phinf.pstatic.net/MjAxNzAyMDJfMjg5/MDAxNDg1OTk2ODc2Njc0.YLls08aCtZPAMR8GBJ4ktIadCtUzpPeS1jdzBTkt6nUg.W-p_93_51zJ9YvoxTevbSB0WO3YV1F0Qr91XpepRrg0g.JPEG.pho6400/1.jpg?type=w800", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://file.mk.co.kr/meet/neds/2020/09/image_readtop_2020_1003131_16013054424374071.jpg", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://cdn.hkbs.co.kr/news/photo/201805/468704_235713_3854.jpg", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdqmU5H%2FbtrlDcmHyz7%2FfxFjaCgE2nakkBYqJufVY1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FddiUzT%2FbtrlDxc9F9r%2FyGZPATVTZTD4cuafeKhu51%2Fimg.jpg",/* today point */ "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUGDlF%2FbtrlD3CCfbn%2FohdtkpouZnKB5KkerUvct1%2Fimg.png",  "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUGDlF%2FbtrlD3CCfbn%2FohdtkpouZnKB5KkerUvct1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUGDlF%2FbtrlD3CCfbn%2FohdtkpouZnKB5KkerUvct1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUGDlF%2FbtrlD3CCfbn%2FohdtkpouZnKB5KkerUvct1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUGDlF%2FbtrlD3CCfbn%2FohdtkpouZnKB5KkerUvct1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUGDlF%2FbtrlD3CCfbn%2FohdtkpouZnKB5KkerUvct1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUGDlF%2FbtrlD3CCfbn%2FohdtkpouZnKB5KkerUvct1%2Fimg.png", "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcUGDlF%2FbtrlD3CCfbn%2FohdtkpouZnKB5KkerUvct1%2Fimg.png"]
    
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
