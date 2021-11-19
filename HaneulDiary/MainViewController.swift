//
//  ViewController.swift
//  HaneulDiary
//
//  Created by 도영훈 on 2021/11/19.
//

import UIKit



class MainViewController: UIViewController {
    
    var pageViewController : MainPageViewController!
    var currentIndex : Int = 0 {
            didSet{
                print(currentIndex)
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MainPageViewControllerSegue" {
            print("Connected")
            guard let vc = segue.destination as? MainPageViewController else {return}
            print(vc)
            pageViewController = vc
            print(vc)
            pageViewController.completeHandler = { (result) in
                self.currentIndex = result
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            print(index)
            self.setViewControllers([viewLists[index]], direction: .forward, animated: true, completion: nil)
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


