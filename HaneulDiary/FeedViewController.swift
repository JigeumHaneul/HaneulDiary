//
//  FeedViewController.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/19.
//

import UIKit

class FeedViewController: UIViewController {
    
   
   
    @IBOutlet weak var feedtableView: UITableView!
    let images : [String] = ["https://mblogthumb-phinf.pstatic.net/MjAxNzAyMDJfMjg5/MDAxNDg1OTk2ODc2Njc0.YLls08aCtZPAMR8GBJ4ktIadCtUzpPeS1jdzBTkt6nUg.W-p_93_51zJ9YvoxTevbSB0WO3YV1F0Qr91XpepRrg0g.JPEG.pho6400/1.jpg?type=w800"]
    let contexts : [String] = ["와 날씨 좋다"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("here feed!!!")
        feedtableView.dataSource = self
        feedtableView.delegate = self
        feedtableView.register(UINib(nibName: "DiaryFeedCell", bundle: nil), forCellReuseIdentifier: "DiaryFeedCell")

        
    }
    
    @IBAction func addFeedContext(_ sender: Any) {
        let vc = UIStoryboard(name: "AddFeedView", bundle: nil).instantiateViewController(withIdentifier: "AddFeedView")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    

}

extension FeedViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryFeedCell", for: indexPath) as? DiaryFeedCell else{
            return DiaryFeedCell()
        }
        cell.configure(image: URL(string: images[indexPath.row]), context: contexts[indexPath.row])
        return cell
    }
}

extension FeedViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
