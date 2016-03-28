//
//  InputTextTableCell.swift
//  TaskRoulette
//
//  Created by 山崎ひかり on 2016/03/28.
//  Copyright © 2016年 hikariyamasaki. All rights reserved.
//

import UIKit

// 追加
protocol InputTextTableCellDelegate {
    func textFieldDidEndEditing(cell: InputTextTableCell, value: NSString) -> ()
}


class InputTextTableCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var taskTextField: UITextField!
    
    
    var delegate: InputTextTableCellDelegate! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        taskTextField.delegate = self
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func height() -> CGFloat {
        return 75.0
    }
    
    // 追加
    internal func textFieldDidEndEditing(textField: UITextField) {
        self.delegate.textFieldDidEndEditing(self, value: textField.text!)
    }
    
    // MARK: - UITextFieldDelegate
    internal func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
