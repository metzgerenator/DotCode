//
//  NewListingScrollViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/19/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class NewListingScrollViewController: UIViewController {
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    

    @IBOutlet var pageControllerOutlet: UIPageControl!
    
    
    @IBAction func pageControllerAction(_ sender: Any) {
        
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add other views to scrollview 
        //project_size
        //additional_questions
        //additional_info
        
        let view1 = createStepController(storyBoardID: "project_size")
        let view2 = createStepController(storyBoardID: "additional_questions")
        let view3 = createStepController(storyBoardID: "additional_info")
        

       
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
