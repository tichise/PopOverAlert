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
        popOverAlertViewController.setButtonText("受注メールを送信する")
        popOverAlertViewController.setMessage("注文が入ったら、まずは内容を確認して在庫商品の有無を確認・検品などをおこないましょう。\n\n確認ができた後、受注メールを送信しましょう。")
        // popOverAlertViewController.setFooterMessage("受注メールは、「その他 > ショップ設定 > 受注メール編集」で設定されている内容を送信します。")
        
        popOverAlertViewController.setShowsVerticalScrollIndicator(true)
        popOverAlertViewController.setSeparatorStyle(UITableViewCellSeparatorStyle.singleLine)
        popOverAlertViewController.popoverPresentationController?.barButtonItem = sender
        popOverAlertViewController.preferredContentSize = CGSize(width: 300, height:160)
        popOverAlertViewController.presentationController?.delegate = self
        
        popOverAlertViewController.completionHandler = { selectRow in

        };
        present(popOverAlertViewController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}

