//
//  PostMessageViewControllerExtension.swift
//  Breakpoint
//
//  Created by Tiago Santos on 27/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

extension PostMessageViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
