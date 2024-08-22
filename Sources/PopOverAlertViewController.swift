//
//  PopOverAlertViewController
//

import UIKit

open class PopOverAlertViewController: UITableViewController, UIAdaptivePresentationControllerDelegate {
    
    var messege: String?
    var subMessage: String?
    var buttonText:String?
    
    var messageFont = UIFont.systemFont(ofSize: 14)
    var buttonTextFont = UIFont.systemFont(ofSize: 14)
    var subMessageFont = UIFont.systemFont(ofSize: 12)
    var buttonTextColor = UIColor.black

    @objc open var completionHandler: (() -> Void)?
    
    private var separatorStyle: UITableViewCell.SeparatorStyle = UITableViewCell.SeparatorStyle.none
    private var showsVerticalScrollIndicator:Bool = false
        
    @objc public static func instantiate() -> PopOverAlertViewController {
        let storyboardsBundle = getStoryboardsBundle()
        let storyboard:UIStoryboard = UIStoryboard(name: "PopOverAlert", bundle: storyboardsBundle)
        let popOverAlertViewController = storyboard.instantiateViewController(withIdentifier: "PopOverAlertViewController") as! PopOverAlertViewController
        
        popOverAlertViewController.modalPresentationStyle = UIModalPresentationStyle.popover
        popOverAlertViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        
        // arrow color
        popOverAlertViewController.popoverPresentationController?.backgroundColor = UIColor.white
        
        return popOverAlertViewController
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 45
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        tableView.separatorStyle = separatorStyle
        tableView.accessibilityIdentifier = "PopOverAlertTableView"
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let footerView = tableView.tableFooterView {
            let height = footerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            
            if height != footerView.frame.size.height {
                tableView.tableFooterView?.frame.size.height = height
            }
        }
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc open func setMessage(_ message:String) {
        self.messege = message
    }
    
    @objc open func setSubMessage(_ subMessage:String) {
        self.subMessage = subMessage
    }
    
    @objc open func setButtonText(_ buttonText:String) {
        self.buttonText = buttonText
    }
    
    @objc open func setMessageFont(_ messageFont:UIFont) {
        self.messageFont = messageFont
    }
    
    @objc open func setSubMessageFont(_ subMessageFont:UIFont) {
        self.subMessageFont = subMessageFont
    }
    
    @objc open func setButtonTextFont(_ buttonTextFont:UIFont) {
        self.buttonTextFont = buttonTextFont
    }
    
    @objc open func setButtonTextColor(_ buttonTextColor:UIColor) {
        self.buttonTextColor = buttonTextColor
    }
    
    @objc open func setSeparatorStyle(_ separatorStyle:UITableViewCell.SeparatorStyle) {
        self.separatorStyle = separatorStyle
    }
    
    @objc open func setShowsVerticalScrollIndicator(_ showsVerticalScrollIndicator:Bool) {
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
    }

    static func getStoryboardsBundle() -> Bundle? {
        let podBundle = Bundle(for: PopOverAlertViewController.self)

    #if SWIFT_PACKAGE
        let bundleURL = podBundle.url(forResource: "PopOverAlert_PopOverAlert", withExtension: "bundle")
    #else
        let bundleURL = podBundle.url(forResource: "PopOverAlertStoryboards", withExtension: "bundle")
    #endif
        let bundle = Bundle(url: bundleURL!)!
            
        return bundle
    }
}
