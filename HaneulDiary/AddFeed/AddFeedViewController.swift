//
//  AddFeedViewController.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/20.
//

import UIKit
import Combine
import Photos
import PhotosUI

class AddFeedViewController: UIViewController,PHPhotoLibraryChangeObserver {
    
    var sendCurrentImage : UIImage?
    var sendDairyContext : String?
    var sendDate : String = ""
    
    weak var delegate : AddFeedViewControllerDelegate?
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var diaryContext: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    var fetchResult = PHFetchResult<PHAsset>()
    var thumbnailSize: CGSize {
        let scale = UIScreen.main.scale
        return CGSize(width: (UIScreen.main.bounds.width / 3) * scale, height: 100 * scale)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
    }
    
    private func setStyle(){
        diaryContext.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: diaryContext.frame.size.height-1, width: diaryContext.frame.size.width, height: 1)
        border.backgroundColor = UIColor.black.cgColor
        diaryContext.layer.addSublayer(border)
//        datePicker.preferredDatePickerStyle = .automatic
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        print(datePicker.date.transYearMonthDayTime())
        

    }
    
    @objc
   private func handleDatePicker(_ sender: UIDatePicker) {
       print(sender.date)
   }
    
    func getImage(){
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true

        let fetchOptions = PHFetchOptions()
        self.fetchResult = PHAsset.fetchAssets(with: fetchOptions)
        self.fetchResult.enumerateObjects { (asset, _, _) in
            PHImageManager().requestImage(for: asset, targetSize: self.thumbnailSize, contentMode: .aspectFill, options: requestOptions) { (image, info) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.backgroundImage.image = image
                    self.sendCurrentImage = image
                }
            }
        }
    }
    
    func requestPHPhotoLibraryAuthorization(completion: @escaping () -> Void) {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { (status) in
            switch status {
            case .limited:
                PHPhotoLibrary.shared().register(self)
                completion()
            default:
                break
            }
        }
    }
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        print("oh chage???")
    }
    
    
    @IBAction func saveData(_ sender: Any) {
        self.sendDairyContext = self.diaryContext.text
        self.sendDate = datePicker.date.transYearMonthDayTime()
        print(delegate)
        self.delegate?.getData(image: sendCurrentImage, diaryContext: sendDairyContext, date: sendDate)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addThePhoto(_ sender: Any) {
        self.requestPHPhotoLibraryAuthorization {
            self.getImage()
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
extension Date{
    func transYearMonthDayTime() -> String{
        let date = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy.MM.dd hh:mma"
        return dateFormat.string(from: date)
    }
}
