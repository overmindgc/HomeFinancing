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
    static let numberSqWidth:CGFloat = (SCREEN_WIDTH * 0.75 - separateLineWidth * 3) / 3
    static let numberSqHeight:CGFloat = numberSqWidth * 0.65
    static let operatorSqWidth:CGFloat = SCREEN_WIDTH * 0.25
    static let padHeight = topBarHeight + numberSqHeight * 4 + separateLineWidth * 4
    
    var topBarView:UIView?
    var topBarLabel:UILabel?
    var resultLabel:UILabel?
    
    var confirmButton:NumPadButton?
    
    var resultText:String = ""
    
    let buttonTag = (plusTag: 1001,minusTag: 1002,multiplyTag: 1003,confirmTag: 1004,deleteTag: 1005)
    
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
        
        topBarLabel = UILabel(frame: CGRectMake(15,0,100,AccountNumberPad.topBarHeight))
        topBarLabel?.font = UIFont.boldSystemFontOfSize(18)
        topBarLabel?.text = "一般支出"
        topBarLabel?.textColor = appPayColor
        self.addSubview(topBarLabel!)
        
        resultLabel = UILabel(frame: CGRectMake(topBarLabel!.frame.size.width + 15,0,SCREEN_WIDTH - topBarLabel!.frame.size.width - 15 - 15,AccountNumberPad.topBarHeight))
        resultLabel?.textColor = UIColor.whiteColor()
        resultLabel?.adjustsFontSizeToFitWidth = true
        resultLabel?.numberOfLines = 0
        resultLabel?.font = UIFont.boldSystemFontOfSize(25)
        resultLabel?.textAlignment = NSTextAlignment.Right
        resultLabel?.text = "0"
        self.addSubview(resultLabel!)
        
        
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
                numButton.addTarget(self, action: #selector(self.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                numButton.tag = index
                self.addSubview(numButton)
            }
            
            if index == 10 {
                let zeroButton:NumPadButton = NumPadButton(frame: CGRectMake(numSqX,numSqY,AccountNumberPad.numberSqWidth * 2 + AccountNumberPad.separateLineWidth,AccountNumberPad.numberSqHeight))
                zeroButton.setTitle("0", forState: UIControlState.Normal)
                zeroButton.addTarget(self, action: #selector(self.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                zeroButton.tag = 0
                self.addSubview(zeroButton)
            }
            
            if index == 12 {
                let backButton:NumPadButton = NumPadButton(frame: CGRectMake(numSqX,numSqY,AccountNumberPad.numberSqWidth,AccountNumberPad.numberSqHeight))
                backButton.tag = buttonTag.deleteTag
                backButton.setImage(UIImage(named: "delete_num"), forState: UIControlState.Normal)
                backButton.addTarget(self, action: #selector(self.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
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
                operateButton.tag = buttonTag.plusTag
                operateButton.titleLabel?.font = UIFont.boldSystemFontOfSize(25)
                operateButton.setTitle("＋", forState: UIControlState.Normal)
                operateButton.setTitleColor(appIncomeColor, forState: UIControlState.Normal)
            case 1:
                operateButton.tag = buttonTag.minusTag
                operateButton.titleLabel?.font = UIFont.boldSystemFontOfSize(25)
                operateButton.setTitle("－", forState: UIControlState.Normal)
                operateButton.setTitleColor(appIncomeColor, forState: UIControlState.Normal)
            case 2:
                operateButton.tag = buttonTag.multiplyTag
                operateButton.titleLabel?.font = UIFont.boldSystemFontOfSize(29)
                operateButton.setTitle("×", forState: UIControlState.Normal)
                operateButton.setTitleColor(appIncomeColor, forState: UIControlState.Normal)
            case 3:
                confirmButton = operateButton
                operateButton.tag = buttonTag.confirmTag
                operateButton.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
                operateButton.setTitle("确定", forState: UIControlState.Normal)
                operateButton.setTitleColor(appPayColor, forState: UIControlState.Normal)
            default:
                print("none")
            }
            
            operateButton.addTarget(self, action: #selector(self.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            self.addSubview(operateButton)
        }
    }
    
    //MARK - action
    func buttonClick(sender:AnyObject) {
        let currButton:NumPadButton = sender as! NumPadButton
        
        switch currButton.tag {
        case buttonTag.plusTag:
            resultText = resultText.stringByAppendingString("+")
            
        case buttonTag.minusTag:
            resultText = resultText.stringByAppendingString("-")
            
        case buttonTag.multiplyTag:
            resultText = resultText.stringByAppendingString("×")
            
        case buttonTag.deleteTag:
            if resultText.characters.count > 0 {
                resultText.removeAtIndex(resultText.endIndex.predecessor())
            }
        case buttonTag.confirmTag:
            
            print("")
        default:
            resultText = resultText.stringByAppendingString(String(currButton.tag))
            
        }
        
        if resultText.characters.count > 0 {
            resultLabel?.text = resultText
            changeConfirmToEqule(true)
        } else {
            resultLabel?.text = "0"
            changeConfirmToEqule(false)
        }
    }
    
    func changeConfirmToEqule(isChange:Bool) {
        if isChange {
            confirmButton?.titleLabel?.font = UIFont.boldSystemFontOfSize(25)
            confirmButton?.setTitle("=", forState: UIControlState.Normal)
            confirmButton?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        } else {
            confirmButton?.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
            confirmButton?.setTitle("确定", forState: UIControlState.Normal)
            confirmButton?.setTitleColor(appPayColor, forState: UIControlState.Normal)
        }
    }
}
