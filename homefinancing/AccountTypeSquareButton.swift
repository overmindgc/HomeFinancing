//
//  AccountTypeSquareButton.swift
//  homefinancing
//
//  Created by 辰 宫 on 5/7/16.
//  Copyright © 2016 wph. All rights reserved.
//

class AccountTypeSquareButton: UIButton {
    
    private var accountType:AccountType = AccountType.pay
    private var buttonTitle:String?
    
    lazy var selectImageView: UIImageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }
    
    init(frame: CGRect,type: AccountType,title: String) {
        super.init(frame: frame)
        accountType = type
        buttonTitle = title
        self.initViews()
    }
    
    func initViews() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.cornerRadius = 2
        self.setTitle(buttonTitle, forState: UIControlState.Normal)
        self.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        let imgWidth:CGFloat = 16
        let imgHeight:CGFloat = 15
        selectImageView.frame = CGRectMake(self.frame.size.width - 10, self.frame.size.height - 10, imgWidth, imgHeight)
    }
    
    var selectedSquare:Bool = false {
        willSet {
            if selectedSquare == true {
                if accountType == AccountType.pay {
                    self.layer.borderColor = appPayColor.CGColor
                    selectImageView.hidden = false
                    selectImageView.image = UIImage(named: "star_blue")
                } else {
                    self.layer.borderColor = appIncomeColor.CGColor
                    selectImageView.hidden = false
                    selectImageView.image = UIImage(named: "star_yellow")
                }
            } else {
                self.layer.borderColor = UIColor.lightGrayColor().CGColor
                selectImageView.hidden = true
            }
        }
    }
    
}
