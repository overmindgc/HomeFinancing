//
//  CreateAccountViewController.swift
//  homefinancing
//
//  Created by 辰 宫 on 5/7/16.
//  Copyright © 2016 wph. All rights reserved.
//

class CreateAccountViewController: HFBaseViewController {

    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var menberButton: UIButton!
    @IBOutlet weak var remarkButton: UIButton!
    
    @IBOutlet weak var payTipLabel: UILabel!
    @IBOutlet weak var incomeTipLabel: UILabel!
    @IBOutlet weak var separateLine: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        dateButton.layer.borderWidth = 1
        dateButton.layer.borderColor = UIColor.whiteColor().CGColor
        dateButton.layer.cornerRadius = 5
        
        menberButton.layer.borderWidth = 1
        menberButton.layer.borderColor = UIColor.whiteColor().CGColor
        menberButton.layer.cornerRadius = 5
        menberButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        let sqButton:AccountTypeSquareButton = AccountTypeSquareButton(frame: CGRectMake(15, 50, 60, 30),type: AccountType.pay,title: "生活费")
        scrollView.addSubview(sqButton)
    }
    
    override func viewDidLayoutSubviews() {
        let tipLabelRect:CGRect = payTipLabel.frame
        payTipLabel.frame = CGRect(x:SCREEN_WIDTH/4*3/2 - tipLabelRect.size.width/2, y:tipLabelRect.origin.y, width:tipLabelRect.size.width, height:tipLabelRect.size.height)
        payTipLabel.setNeedsDisplay()
        incomeTipLabel.frame = CGRect(x:SCREEN_WIDTH/4*3 + SCREEN_WIDTH/4/2 - tipLabelRect.size.width/2, y:tipLabelRect.origin.y, width:tipLabelRect.size.width, height:tipLabelRect.size.height)
        separateLine.frame = CGRect(x:SCREEN_WIDTH/4*3 - 5, y:64, width:1, height:29)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    // MARK: - Actions
    @IBAction func closeAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
