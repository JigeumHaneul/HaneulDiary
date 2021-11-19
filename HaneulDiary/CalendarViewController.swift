//
//  CalenderViewController.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/19.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarCollectionView: UICollectionView!
    let images : [String] = ["https://images.pexels.com/photos/907485/pexels-photo-907485.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://mblogthumb-phinf.pstatic.net/MjAxNzAyMDJfMjg5/MDAxNDg1OTk2ODc2Njc0.YLls08aCtZPAMR8GBJ4ktIadCtUzpPeS1jdzBTkt6nUg.W-p_93_51zJ9YvoxTevbSB0WO3YV1F0Qr91XpepRrg0g.JPEG.pho6400/1.jpg?type=w800"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("here cal!!!!")
        calendarCollectionView.dataSource = self
        calendarCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CalendarViewController: UICollectionViewDelegate {

}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    
}

extension CalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as? CalendarCell else { return CalendarCell()}
        cell.configure(image: URL(string: images[indexPath.item]))
        return cell
    }
    
}
