//
//  WelcomeScreenViewController.swift
//  TimeTracker
//
//  Created by Michael Metzger  on 2/18/17.
//  Copyright © 2017 CreativeWorx. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    var pages = [WelcomScreenStepController]()
    
    @IBOutlet var pageControllerOutlet: UIPageControl!
    
    
    
    @IBAction func pageControllerAction(_ sender: UIPageControl) {
        
        let currentPage = sender.currentPage
        let pageWidth = scrollView.bounds.width
        let targetContentOffsetX = CGFloat(currentPage) * pageWidth
        
        
        UIView.animate(withDuration: 0.33) {
            
            self.scrollView.contentOffset.x = targetContentOffsetX
        }
        
        
    }
    
    
    
    @IBOutlet var nextButtonOutlet: UIButton!
    
    @IBAction func nextButton(_ sender: Any) {
        self.performSegue(withIdentifier: "login", sender: self)
        
    }
    
    
    
    @IBOutlet var scrollView: UIScrollView!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButtonOutlet.layer.cornerRadius = 5
        
        scrollView.isPagingEnabled = true
        
        let page1 = createStepController(image: "camera", mainTitle: "DotCode", mainText: "Welcometo the app.  This app helps you find devs that have the exact skills that fit what you need.")
        let page2 = createStepController(image: "camera", mainTitle: "DotCode", mainText: "Choose which attributes you need and find your dev. Easy!")
        
        let page3 = createStepController(image: "camera", mainTitle: "DotCode", mainText: "Are you a dev? Create a profile and get jobs!  You can also find other devs to collaborate with.")
        let page4 = createStepController(image: "camera", mainTitle: "DotCode", mainText: "More features coming soon.  Be sure to keep your app up to date!")
        
        
        pages = [page1, page2, page3, page4]
        
        pageControllerOutlet.numberOfPages = pages.count
        
        let views = ["view" : view, "page1" : page1.view, "page2" : page2.view, "page3" : page3.view, "page4" : page4.view]
        
        let metrics = ["edgeMargin" : 10, "betweenMargin" : 20]
        
         let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|", options: .init(rawValue: 0), metrics: nil, views: views)
        NSLayoutConstraint.activate(verticalConstraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeMargin-[page1(==view)]-betweenMargin-[page2(==view)]-betweenMargin-[page3(==view)]-betweenMargin-[page4(==view)]-betweenMargin-|", options: [.alignAllTop, .alignAllBottom], metrics: metrics, views: views)
        
        NSLayoutConstraint.activate(horizontalConstraints)
        
        
        
        
        

    }
    
    
    
    
    func createStepController(image: String, mainTitle: String, mainText: String) -> WelcomScreenStepController {
        
        
        let stepController = storyboard?.instantiateViewController(withIdentifier: "WelcomScreenStepController") as! WelcomScreenStepController
        
        stepController.view.translatesAutoresizingMaskIntoConstraints = false
        stepController.mainImage = UIImage(named: image)
        stepController.headerTitle = mainTitle
        stepController.mainMessage = mainText
        
        scrollView.addSubview(stepController.view)
        addChildViewController(stepController)
        stepController.didMove(toParentViewController: self)
        
        return stepController
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



extension WelcomeScreenViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        pageControllerOutlet.currentPage = Int(round(pageFraction))
    }
    
    
}




