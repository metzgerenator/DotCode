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
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    

    @IBOutlet var pageControllerOutlet: UIPageControl!
    
    
    @IBAction func pageControllerAction(_ sender: Any) {
        
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       scrollView.isPagingEnabled = true
        
        let view1 = createStepController(storyBoardID: "project_size")
        let view2 = createStepController(storyBoardID: "additional_questions")
        let view3 = createStepController(storyBoardID: "additional_info")
        
        pages = [view1, view2, view3]
        
        pageControllerOutlet.numberOfPages = pages.count
        
        let views = ["view" : view, "page1" : view1.view, "page2" : view2.view, "page3" : view3.view]
        
        let metrics = ["edgeMargin" : 10, "betweenMargin" : 20]
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|", options: .init(rawValue: 0), metrics: nil, views: views)
        NSLayoutConstraint.activate(verticalConstraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeMargin-[page1(==view)]-betweenMargin-[page2(==view)]-betweenMargin-[page3(==view)]-betweenMargin-|", options: [.alignAllTop, .alignAllBottom], metrics: metrics, views: views)
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
