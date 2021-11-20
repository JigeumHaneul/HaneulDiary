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
        border.backgroundColor = UIColor.white.cgColor
        diaryContext.layer.addSublayer(border)
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
                    print(info)
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
