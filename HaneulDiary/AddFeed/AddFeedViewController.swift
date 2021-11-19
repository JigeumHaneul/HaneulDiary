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
    
    var fetchResult = PHFetchResult<PHAsset>()
    
    var canAccessImages: [UIImage] = []
    var thumbnailSize: CGSize {
        let scale = UIScreen.main.scale
        return CGSize(width: (UIScreen.main.bounds.width / 3) * scale, height: 100 * scale)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
