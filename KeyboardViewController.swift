//
//  KeyboardViewController.swift
//  oye
//
//  Created by Rasanjit Singh on 9/21/14.
//  Copyright (c) 2014 Rasanjit Singh. All rights reserved.
//

//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonTitles = [
            ["ੳ", "ਅ", "ੲ", "ਸ", "ਹ", "ਕ", "ਖ", "ਗ", "ਘ", "ਚ"],
            ["ਛ", "ਜ", "ਝ", "ਟ", "ਠ", "ਡ", "ਢ", "ਣ", "ਤ", "ਥ"],
            ["ਦ", "ਧ", "ਨ", "ਪ", "ਫ", "ਬ", "ਭ", "ਮ", "ਯ"],
            ["↑", "ਰ", "ਲ", "ਵ", "ੜ", "ਾ", "ਿ‍", "ੀ", "←"],
            ["੧੨੩", "🌐", "ਖ਼ਾਲੀ", "return"]
            
        ]
        assignKeys(buttonTitles)
        
    }
    
    func createRowOfButtons(buttonTitles: [NSString]) -> UIView {
        
        var buttons = [UIButton]()
        var keyboardRowView = UIView(frame: CGRectMake(0, 0, 320, 50))
        
        for buttonTitle in buttonTitles{
            
            let button = createButtonWithTitle(buttonTitle)
            buttons.append(button)
            keyboardRowView.addSubview(button)
        }
        
        addIndividualButtonConstraints(buttons, mainView: keyboardRowView)
        
        return keyboardRowView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
    }
    
    func createButtonWithTitle(title: String) -> UIButton {
        
        let button = UIButton.buttonWithType(.System) as UIButton
        button.frame = CGRectMake(0, 0, 20, 20)
        button.setTitle(title, forState: .Normal)
        button.sizeToFit()
         UIFont.systemFontOfSize(18)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.backgroundColor = UIColor(white: 0.1, alpha: 0.0)
        button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        
        button.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
        
        return button
    }
    
    func assignKeys(buttonTitleRows: [[String]]) {
        // Remove the previous views from the keyboard.
        for view in self.view.subviews as [UIView] {
            view.removeFromSuperview()
        }
        
        // Add the new buttons.
        for buttonTitles in buttonTitleRows {
            let buttonViews = createRowOfButtons(buttonTitles)
            
            buttonViews.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            view.addSubview(buttonViews)
        }
        
        addConstraintsToInputView(view, rowViews: view.subviews as [UIView])
    }
    
    func didTapButton(button: UIButton) {
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        
        if let title = button.titleForState(.Normal) {
            switch title {
            case "←" :
                proxy.deleteBackward()
            case "return" :
                proxy.insertText("\n")
            case "ਖ਼ਾਲੀ" :
                proxy.insertText(" ")
            case "🌐" :
                self.advanceToNextInputMode()
                
            case "↑":
                let buttonTitles = [
                    ["੧", "੨", "੩", "੪", "੫", "੬", "੭", "੮", "੯", "੦"],
                    ["ਾ", "ੇ", "ੈ", "ੋ", "ੌ", "ੁ", "ੂ", "ਾਂ", "ਂ॥", "ੱ"],
                    ["ਸ਼", "ਖ਼", "ਗ਼", "ਜ਼", "ਫ਼", "ਲ਼", "☬", "ੴ", "☸"],
                    ["↓", "ॐ", "ੰ", "", "", "", "", "", "←"],
                    ["੧੨੩","🌐", "ਖ਼ਾਲੀ", "return"]
                ]
                
                assignKeys(buttonTitles)
                
            case "↓":
                let buttonTitles = [
                    ["ੳ", "ਅ", "ੲ", "ਸ", "ਹ", "ਕ", "ਖ", "ਗ", "ਘ", "ਚ"],
                    ["ਛ", "ਜ", "ਝ", "ਟ", "ਠ", "ਡ", "ਢ", "ਣ", "ਤ", "ਥ"],
                    ["ਦ", "ਧ", "ਨ", "ਪ", "ਫ", "ਬ", "ਭ", "ਮ", "ਯ"],
                    ["↑", "ਰ", "ਲ", "ਵ", "ੜ", "ਾ", "ਿ‍", "ੀ", "←"],
                    ["੧੨੩", "🌐", "ਖ਼ਾਲੀ", "return"]
                ]
                
                assignKeys(buttonTitles)

            case "੧੨੩":
                let buttonTitles = [
                    ["੧", "੨", "੩", "੪", "੫", "੬", "੭", "੮", "੯", "੦"],
                    [" ੁ", " ੋ", " ੱ", " ੰ", " ੈ", " ੂ", " ਿ", " ੀ", " ਾਂ", " ੱ"],
                    ["ਸ਼", "ਖ਼", "ਗ਼", "ਜ਼", "ਫ਼", "ਲ਼", "☬", "ੴ", "☸"],
                    ["↓", "ॐ", "", "", "", "", "", "", "←"],
                    ["੧੨੩","🌐", "ਖ਼ਾਲੀ", "return"]
                ]
                
                assignKeys(buttonTitles)
                
            case "ੳਅੲ":
                let buttonTitles = [
                    ["ੳ", "ਅ", "ੲ", "ਸ", "ਹ", "ਕ", "ਖ", "ਗ", "ਘ", "ਚ"],
                    ["ਛ", "ਜ", "ਝ", "ਟ", "ਠ", "ਡ", "ਢ", "ਣ", "ਤ", "ਥ"],
                    ["ਦ", "ਧ", "ਨ", "ਪ", "ਫ", "ਬ", "ਭ", "ਮ", "ਯ"],
                    ["↑", "ਰ", "ਲ", "ਵ", "ੜ", "ਾ", "ਿ‍", "ੀ", "←"],
                    ["੧੨੩", "🌐", "ਖ਼ਾਲੀ", "return"]
                ]
                
                assignKeys(buttonTitles)
                
            case "#+=":
                let buttonTitles = [
                    
                    ["੧", "੨", "੩", "੪", "੫", "੬", "੭", "੮", "੯", "੦"],
                    
                    ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
                    ["_", "\\", "|", "~", "<", ">", "€", "£", "¥"],
                    ["੧੨੩", ".", ",", "?", "!", "\'", "\"", "","←"],
                    ["ੳਅੲ", "🌐", "ਖ਼ਾਲੀ", "return"]
                ]
                
                assignKeys(buttonTitles)
            default:
                proxy.insertText(title)
            }
        }
    }
    
    func addIndividualButtonConstraints(buttons: [UIButton], mainView: UIView){
        
        for (index, button) in enumerate(buttons) {
            
            var topConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: mainView, attribute: .Top, multiplier: 1.0, constant: 1)
            
            var bottomConstraint = NSLayoutConstraint(item: button, attribute: .Bottom, relatedBy: .Equal, toItem: mainView, attribute: .Bottom, multiplier: 1.0, constant: -1)
            
            var rightConstraint : NSLayoutConstraint!
            
            if index == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: mainView, attribute: .Right, multiplier: 1.0, constant: -1)
                
            }else{
                
                let nextButton = buttons[index+1]
                rightConstraint = NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: nextButton, attribute: .Left, multiplier: 1.0, constant: -1)
            }
            
            
            var leftConstraint: NSLayoutConstraint
            
            if index == 0 {
                
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: mainView, attribute: .Left, multiplier: 1.0, constant: 1)
                
            }
            else {
                let prevtButton = buttons[index-1]
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: prevtButton, attribute: .Right, multiplier: 1.0, constant: 1)
                
                let firstButton = buttons[0]
                var widthConstraint = NSLayoutConstraint(item: firstButton, attribute: .Width, relatedBy: .Equal, toItem: button, attribute: .Width, multiplier: 1.0, constant: 0)
                
                widthConstraint.priority = 800
                mainView.addConstraint(widthConstraint)
            }
            
            mainView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    
    func addConstraintsToInputView(inputView: UIView, rowViews: [UIView]){
        
        for (index, rowView) in enumerate(rowViews) {
            var rightSideConstraint = NSLayoutConstraint(item: rowView, attribute: .Right, relatedBy: .Equal, toItem: inputView, attribute: .Right, multiplier: 1.0, constant: -1)
            
            var leftConstraint = NSLayoutConstraint(item: rowView, attribute: .Left, relatedBy: .Equal, toItem: inputView, attribute: .Left, multiplier: 1.0, constant: 1)
            
            inputView.addConstraints([leftConstraint, rightSideConstraint])
            
            var topConstraint: NSLayoutConstraint
            
            if index == 0 {
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .Top, relatedBy: .Equal, toItem: inputView, attribute: .Top, multiplier: 1.0, constant: 0)
                
            }else{
                
                let prevRow = rowViews[index-1]
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .Top, relatedBy: .Equal, toItem: prevRow, attribute: .Bottom, multiplier: 1.0, constant: 0)
                
                let firstRow = rowViews[0]
                var heightConstraint = NSLayoutConstraint(item: firstRow, attribute: .Height, relatedBy: .Equal, toItem: rowView, attribute: .Height, multiplier: 1.0, constant: 0)
                
                heightConstraint.priority = 800
                inputView.addConstraint(heightConstraint)
            }
            inputView.addConstraint(topConstraint)
            
            var bottomConstraint: NSLayoutConstraint
            
            if index == rowViews.count - 1 {
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .Bottom, relatedBy: .Equal, toItem: inputView, attribute: .Bottom, multiplier: 1.0, constant: 0)
                
            }else{
                
                let nextRow = rowViews[index+1]
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .Bottom, relatedBy: .Equal, toItem: nextRow, attribute: .Top, multiplier: 1.0, constant: 0)
            }
            
            inputView.addConstraint(bottomConstraint)
        }
        
    }
}