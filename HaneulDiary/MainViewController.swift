//
//  ViewController.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/19.
//

import UIKit



class MainViewController: UIViewController {
    
    @IBOutlet weak var calendarBtn: UIButton!
    @IBOutlet weak var feedBtn: UIButton!
    var pageViewController : MainPageViewController!
    var currentIndex : Int = 0 {
            didSet{
                if currentIndex == 0{
                    //여기가 백그라운드 색과 버튼 글자 색 바꾸는 코드
                    calendarBtn.backgroundColor = .white
                    calendarBtn.titleLabel?.tintColor = .blue
                    feedBtn.backgroundColor = .lightGray
                    feedBtn.titleLabel?.tintColor = .white
                }
                else{
                    //여기도 마찬가지
                    feedBtn.backgroundColor = .white
                    feedBtn.titleLabel?.tintColor = .blue
                    calendarBtn.backgroundColor = .lightGray
                    calendarBtn.titleLabel?.tintColor = .white
                }
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MainPageViewControllerSegue" {
            print("Connected")
            guard let vc = segue.destination as? MainPageViewController else {return}
            pageViewController = vc
            pageViewController.completeHandler = { (result) in
                self.currentIndex = result
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeaderView()
    }
    
    private func setHeaderView(){
        calendarBtn.backgroundColor = .white
        feedBtn.backgroundColor = .lightGray
        feedBtn.titleLabel?.tintColor = .white
    }
    
    @IBAction func calendarBtn(_ sender: Any) {
        pageViewController.setViewcontrollersFromIndex(index: 0)
        
    }
    
    @IBAction func feedBtn(_ sender: Any) {
        pageViewController.setViewcontrollersFromIndex(index: 1)
        
    }
    
}


class MainPageViewController : UIPageViewController {
   
    var completeHandler : ((Int)->())?
    
    let viewLists : [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = storyBoard.instantiateViewController(withIdentifier: "CalenderViewController")
        let vc2 = storyBoard.instantiateViewController(withIdentifier: "FeedViewController")
        return[vc1,vc2]
    }()
    
    var currentIndex : Int {
        guard let vc = viewControllers?.first else {return 0}
        return viewLists.firstIndex(of: vc) ?? 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        if let firstVC = viewLists.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    func setViewcontrollersFromIndex(index : Int){
        if index < 0 && index >= viewLists.count {return }
        if currentIndex > index{
            self.setViewControllers([viewLists[index]], direction: .reverse, animated: true, completion: nil)
        }
        else{
            self.setViewControllers([viewLists[index]], direction: .forward, animated: true, completion: nil)
        }
        completeHandler?(currentIndex)
    }
    
}
extension MainPageViewController:UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed {
                
                completeHandler?(currentIndex)
            }
        }
    
}

extension MainPageViewController:UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            guard let index = viewLists.firstIndex(of: viewController) else {return nil}
            
            let previousIndex = index - 1
            
            if previousIndex < 0 { return nil}
            
            return viewLists[previousIndex]
            
            
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            
            guard let index = viewLists.firstIndex(of: viewController) else {return nil}
                  
            let nextIndex = index + 1
                  
            if nextIndex == viewLists.count { return nil}
                  
            return viewLists[nextIndex]
                  
            
        }
    }


