//
//   WelcomePageViewController.swift
//  ShopGo
//
//  Created by Blall Ahmad on 10/1/22.
//
import UIKit

class WelcomePageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var pageControl = UIPageControl()
    lazy var swipeVC: [UIViewController] = {
        return [self.accessVC(WelcomeViewController: "firstVC"),
                self.accessVC(WelcomeViewController: "secondVC")]
    } ()
    func accessVC(WelcomeViewController: String) -> UIViewController {
        return UIStoryboard(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: WelcomeViewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore WelcomeViewController: UIViewController) -> UIViewController? {
        guard let WelcomeViewControllerIndex = swipeVC.firstIndex(of: WelcomeViewController) else {return nil}
        let previousIndex = WelcomeViewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard swipeVC.count > previousIndex else {
            return nil
        }
        return swipeVC[previousIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter WelcomeViewController: UIViewController) -> UIViewController? {
        guard let WelcomeViewControllerIndex = swipeVC.firstIndex(of: WelcomeViewController) else {return nil}
        let nextIndex = WelcomeViewControllerIndex + 1
        guard swipeVC.count != nextIndex else {
            return nil
        }
        guard swipeVC.count > nextIndex else {
            return nil
        }
        return swipeVC[nextIndex]
    }
    func configurePageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 250, width: UIScreen.main.bounds.width, height: 1))
        pageControl.numberOfPages = swipeVC.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.blue
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.systemIndigo
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
        self.view.addSubview(pageControl)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContenctVC = pageViewController.viewControllers![0]
        self.pageControl.currentPage = swipeVC.firstIndex(of: pageContenctVC)!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        configurePageControl()
        if let firstViewController = swipeVC.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

