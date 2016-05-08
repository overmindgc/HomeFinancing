//
//  AccountNumberPad.swift
//  homefinancing
//
//  Created by 辰 宫 on 5/8/16.
//  Copyright © 2016 wph. All rights reserved.
//

class AccountNumberPad: UIView {
    static let topBarHeight:CGFloat = 50
    static let separateLineWidth:CGFloat = 1
    static let numberSqWidth:CGFloat = (SCREEN_WIDTH * 0.7 - separateLineWidth * 3) / 3
    static let numberSqHeight:CGFloat = numberSqWidth * 0.75
    static let operatorSqWidth:CGFloat = SCREEN_WIDTH * 0.3
    static let padHeight = topBarHeight + numberSqHeight * 4 + separateLineWidth * 4
    
    var topBarView:UIView?
    var topBarLabel:UILabel?
    var resultLabel:UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    func initViews() {
        self.backgroundColor = UIColor.lightGrayColor()
        
        topBarView = UIView(frame: CGRectMake(0,0,SCREEN_WIDTH,AccountNumberPad.topBarHeight))
        topBarView?.backgroundColor = appDarkBackgroundColor_lite
        self.addSubview(topBarView!)
        
        initLeftNumButtons()
        initRightOperateButtons()
    }
    
    func initLeftNumButtons() {
        let startSqY:CGFloat = AccountNumberPad.topBarHeight + AccountNumberPad.separateLineWidth
        for index in 1 ..< 13 {
            var numLine:Int = index / 3 + 1
            var numLineNum:Int = index % 3
            if numLineNum == 0 {
                numLineNum = 3
                numLine = numLine - 1
            }
            
            let numSqX:CGFloat = (AccountNumberPad.numberSqWidth + AccountNumberPad.separateLineWidth) * (CGFloat(numLineNum) - 1)
            let numSqY:CGFloat = startSqY + (AccountNumberPad.numberSqHeight + AccountNumberPad.separateLineWidth) * (CGFloat(numLine) - 1)
            
            if index < 10 {
                let numButton:NumPadButton = NumPadButton(frame: CGRectMake(numSqX,numSqY,AccountNumberPad.numberSqWidth,AccountNumberPad.numberSqHeight))
                numButton.setTitle(String(index), forState: UIControlState.Normal)
                self.addSubview(numButton)
            }
            
            if index == 10 {
                let zeroButton:NumPadButton = NumPadButton(frame: CGRectMake(numSqX,numSqY,AccountNumberPad.numberSqWidth * 2 + AccountNumberPad.separateLineWidth,AccountNumberPad.numberSqHeight))
                zeroButton.setTitle("0", forState: UIControlState.Normal)
                self.addSubview(zeroButton)
            }
            
            if index == 12 {
                let backButton:NumPadButton = NumPadButton(frame: CGRectMake(numSqX,numSqY,AccountNumberPad.numberSqWidth,AccountNumberPad.numberSqHeight))
                backButton.setImage(UIImage(named: "delete_num"), forState: UIControlState.Normal)
                self.addSubview(backButton)
            }
        }
    }
    
    func initRightOperateButtons() {
        let startSqY:CGFloat = AccountNumberPad.topBarHeight + AccountNumberPad.separateLineWidth
        
        for index in 0 ..< 4 {
            let sqX = AccountNumberPad.numberSqWidth * 3 + AccountNumberPad.separateLineWidth * 3
            let sqY = startSqY + (AccountNumberPad.numberSqHeight + AccountNumberPad.separateLineWidth) * CGFloat(index)
            
            let operateButton = NumPadButton(frame: CGRectMake(sqX,sqY,AccountNumberPad.operatorSqWidth,AccountNumberPad.numberSqHeight))
            switch index {
            case 0:
                operateButton.titleLabel?.font = UIFont.boldSystemFontOfSize(25)
                operateButton.setTitle("＋", forState: UIControlState.Normal)
                operateButton.setTitleColor(appIncomeColor, forState: UIControlState.Normal)
            case 1:
                operateButton.titleLabel?.font = UIFont.boldSystemFontOfSize(25)
                operateButton.setTitle("－", forState: UIControlState.Normal)
                operateButton.setTitleColor(appIncomeColor, forState: UIControlState.Normal)
            case 2:
                operateButton.titleLabel?.font = UIFont.boldSystemFontOfSize(29)
                operateButton.setTitle("×", forState: UIControlState.Normal)
                operateButton.setTitleColor(appIncomeColor, forState: UIControlState.Normal)
            case 3:
                operateButton.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
                operateButton.setTitle("确定", forState: UIControlState.Normal)
                operateButton.setTitleColor(appPayColor, forState: UIControlState.Normal)
            default:
                print("none")
            }
            
            self.addSubview(operateButton)
        }
    }
}
