//
//  NewListingScrollViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/19/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class NewListingScrollViewController: UIViewController {
    
    
    var pages = [UIViewController]()
    var jobPost = [String : AnyObject]()
    
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var pageControllerOutlet: UIPageControl!
    
    
    @IBAction func pageControllerAction(_ sender: UIPageControl) {
        
        turnPageController(page: sender.currentPage)
        
        
    }
    
    
    //add turn page function
    
    func turnPageController(page: Int) {
        
        let currentPage = page
        let pageWidth = scrollView.bounds.width
        let targetContentOffsetX = CGFloat(currentPage) * pageWidth
        
        
        UIView.animate(withDuration: 0.33) {
            
            self.scrollView.contentOffset.x = targetContentOffsetX
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       scrollView.isPagingEnabled = true
        
        guard let view1 = createStepController(storyBoardID: "project_size") as? ProjectSizeViewController else {return}
        guard let view2 = createStepController(storyBoardID: "additional_questions") as? TeamAndRegionViewController else {return}
        guard let view3 = createStepController(storyBoardID: "additional_info") as? JobDescriptionViewController else {return}
        
       guard let view4 = createStepController(storyBoardID: "name_listing") as? NameListingViewController else {return}
        
        //delegates to self
        view1.delegate = self
        view2.delegate = self
        view3.delegate = self
        
        //delegates for appending 
        view1.addProjectDelegate = self
        view2.addProjectDelegate = self
        view3.addProjectDelegate = self
        view4.addProjectDelegate = self
        
        //delegate for saving project
        view4.saveProjectDelegate = self
        
        pages = [view1, view2, view3, view4]
        
        pageControllerOutlet.numberOfPages = pages.count
        
        let views = ["view" : view, "page1" : view1.view, "page2" : view2.view, "page3" : view3.view, "page4" : view4.view]
        
        let metrics = ["edgeMargin" : 10, "betweenMargin" : 20]
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|", options: .init(rawValue: 0), metrics: nil, views: views)
        NSLayoutConstraint.activate(verticalConstraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeMargin-[page1(==view)]-betweenMargin-[page2(==view)]-betweenMargin-[page3(==view)]-betweenMargin-[page4(==view)]-betweenMargin-|", options: [.alignAllTop, .alignAllBottom], metrics: metrics, views: views)
        
        NSLayoutConstraint.activate(horizontalConstraints)
        
        

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func createStepController(storyBoardID: String) -> UIViewController {
        
        
        let stepController = storyboard?.instantiateViewController(withIdentifier: storyBoardID)
        
        stepController?.view.translatesAutoresizingMaskIntoConstraints = false
       
        scrollView.addSubview((stepController?.view)!)
        
        addChildViewController(stepController!)
        stepController?.didMove(toParentViewController: self)
        
        return stepController!
        
        
        
    }
    

  

}


extension NewListingScrollViewController: UIScrollViewDelegate, nextButtonDelegate, NewProjectDictionaryDelegate, SaveNewProjectDelegate {
    
    //save the job to firebase
    internal func postJob() {
        if jobPost.count > 0 {
          postAJob(values: jobPost)
        }
        
    }

    //add to dictionary for job to be saved
    internal func appendToProject(key: String, value: String) {
        jobPost.updateValue(value as AnyObject, forKey: key)
        
    }

    internal func buttonPressed(page: Int) {
        turnPageController(page: page)
    }


    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        pageControllerOutlet.currentPage = Int(round(pageFraction))
    }
    
    
}


//MARK: delegates

//add delegates for saving

protocol nextButtonDelegate {
    func buttonPressed(page: Int)
}

protocol NewProjectDictionaryDelegate{
    
    func appendToProject(key: String, value: String)
}

protocol SaveNewProjectDelegate {
    func postJob()
}









