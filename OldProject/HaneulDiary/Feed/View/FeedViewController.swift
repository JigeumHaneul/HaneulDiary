//
//  FeedViewController.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/19.
//

import UIKit

protocol AddFeedViewControllerDelegate: AnyObject{
    func getData(image : UIImage?, diaryContext: String? ,date:String)
}
class FeedViewController: UIViewController {
    
    @IBOutlet weak var addBtn: UIButton!
    
    private var viewModel = FeedViewModel()
    private var observation :NSKeyValueObservation!
   
    @IBOutlet weak var feedTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("here feed!!!")
        feedTableView.separatorStyle = .none
        feedTableView.dataSource = self
        feedTableView.delegate = self
        feedTableView.register(UINib(nibName: "DiaryFeedCell", bundle: nil), forCellReuseIdentifier: "DiaryFeedCell")
        addBtn.tintColor = .gray

        setViewModel()
    }
    
    @IBAction func addFeedContext(_ sender: Any) {
        if let vc = UIStoryboard(name: "CreateDiary", bundle: nil).instantiateViewController(withIdentifier: "CreateDiary") as? CreateDiaryViewController {
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    private func setViewModel(){
        viewModel.setData()
        observation = self.viewModel.diaryDatas.observe(\.diaryData, options: .new){_,_ in
            print("please")
            self.feedTableView.reloadData()
        }
    }
}

extension FeedViewController : AddFeedViewControllerDelegate{
    func getData(image : UIImage?, diaryContext: String? ,date:String) {
        self.viewModel.getData(image: image, diaryContext: diaryContext ?? "", date: date)
        print(viewModel.diaryDataCount)
        print("ssibal")
    }
}

extension FeedViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.diaryDataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let length = viewModel.diaryDataCount
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryFeedCell", for: indexPath) as? DiaryFeedCell else{
            return DiaryFeedCell()
        }
        cell.configure(image: viewModel.diaryDatas.diaryData[length-1-indexPath.row].diaryImage, context: viewModel.diaryDatas.diaryData[length-1-indexPath.row].diaryText, date: viewModel.diaryDatas.diaryData[length-1-indexPath.row].diaryDate)
        return cell
    }
}

extension FeedViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
