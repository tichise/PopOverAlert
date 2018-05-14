//
//  SampleViewController
//  Sample
//
//  Copyright © 2018年 ichise. All rights reserved.
//

import UIKit
import PopOverAlert

class SampleViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    @IBOutlet weak var baseTextView:UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButtonItem:UIBarButtonItem = UIBarButtonItem(title: "menu", style: .plain, target: self, action: #selector(SampleViewController.openAlert(sender:)))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @objc public func openAlert(sender:UIBarButtonItem) {
         
        let popOverAlertViewController = PopOverAlertViewController.instantiate()
        popOverAlertViewController.setButtonText("OK")
        popOverAlertViewController.setMessage("Do you want to send mail?")
        popOverAlertViewController.setSubMessage("When you press OK, the mail will be sent immediately.")
        
        popOverAlertViewController.setShowsVerticalScrollIndicator(true)
        popOverAlertViewController.setSeparatorStyle(UITableViewCellSeparatorStyle.singleLine)
        popOverAlertViewController.popoverPresentationController?.barButtonItem = sender
        popOverAlertViewController.preferredContentSize = CGSize(width: 300, height:110)
        popOverAlertViewController.presentationController?.delegate = self
        
        popOverAlertViewController.setMessageFont(UIFont.systemFont(ofSize: 16))
        popOverAlertViewController.setSubMessageFont(UIFont.systemFont(ofSize: 12))
        popOverAlertViewController.setButtonTextFont(UIFont.systemFont(ofSize: 14))
        popOverAlertViewController.completionHandler = { () -> Void in

        }
        present(popOverAlertViewController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}

