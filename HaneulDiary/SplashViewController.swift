//
//  ViewController.swift
//  HaneulDiary
//
//  Created by Yeni Hwang on 2021/11/20.
//

import UIKit

class SplashPageViewController:UIPageViewController{
    var completeHandler : ((Int)->())?
    
    let viewLists : [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = storyBoard.instantiateViewController(withIdentifier: "FirstViewController")
        let vc2 = storyBoard.instantiateViewController(withIdentifier: "SecondViewController")
        let v3 = storyBoard.instantiateViewController(withIdentifier: "ThirdViewController")
        return[vc1,vc2,v3]
    }()
    
    var currentIndex : Int {
        guard let vc = viewControllers?.first else {return 0}
        return viewLists.firstIndex(of: vc) ?? 0
    }
    
    
    override func viewDidLoad() {
        print(viewLists)
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        if let firstVC = viewLists.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
}
extension SplashPageViewController:UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed {
                
                completeHandler?(currentIndex)
            }
        }
}

extension SplashPageViewController:UIPageViewControllerDataSource{
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

class SplashViewController: UIViewController {
    
    var sPageViewController : SplashPageViewController!
    
    var currentIndex : Int = 0{
        didSet{
            print("wow")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SplashPageViewcontroller" {
            print("connect??")
            guard let vc = segue.destination as? SplashPageViewController else {return}
            sPageViewController = vc
            print(vc)
            sPageViewController.completeHandler = {
                (result) in self.currentIndex = result
            }
        }
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
