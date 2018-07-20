### PopOverAlert

PopOverAlert is a PopOver style alert view.
Please use it when you want to display confirmation screen without screen transition.

### Image
#### iPhone
<img src="https://user-images.githubusercontent.com/43707/39987592-2be647f6-57a0-11e8-9fd7-2f728836df64.png" width="400px">

### Examples
```
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
        popOverAlertViewController.setButtonTextColor(UIColor.black)

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
```

#### Swift


### Installation (CocoaPods)
`pod PopOverAlert`

### CocoaPods URL
- [PopOverAlert on CocoaPods.org](https://cocoapods.org/pods/PopOverAlert)

### License
PopOverAlert is available under the MIT license. See the LICENSE file for more info.
