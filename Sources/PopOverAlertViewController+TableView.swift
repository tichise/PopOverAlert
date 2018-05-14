//
//  PopOverAlertViewController
//

import Foundation

extension PopOverAlertViewController {
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell")!
                cell.textLabel?.text = messege
                cell.textLabel?.font = messageFont
                return cell
            }
        } else if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell")!
                cell.textLabel?.text = buttonText
                cell.textLabel?.font = buttonTextFont
                return cell
            }
        }
        
        return UITableViewCell()
    }


    override open func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                self.dismiss(animated: true, completion: {
                    if self.completionHandler != nil {
                        let selectRow:Int = indexPath.row
                        self.completionHandler!(selectRow)
                    }
                })
            }
        }
    }
}
