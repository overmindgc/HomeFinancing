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
    @IBOutlet weak var horSeparateLine: UIView!
    
    var scrollView: UIScrollView!
    
    var payTypeButtonArray:Array<AccountTypeSquareButton> = []
    var incomeTypeButtonArray:Array<AccountTypeSquareButton> = []
    
    var lastSelectPayTypeIndex:Int = -1
    var lastSelectIncomeTypeIndex:Int = -1
    
    var numPadView:AccountNumberPad?
    
    override func viewDidLoad() {
        dateButton.layer.borderWidth = 1
        dateButton.layer.borderColor = UIColor.whiteColor().CGColor
        dateButton.layer.cornerRadius = 5
        
        menberButton.layer.borderWidth = 1
        menberButton.layer.borderColor = UIColor.whiteColor().CGColor
        menberButton.layer.cornerRadius = 5
        menberButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        let scrollViewHeight:CGFloat = SCREEN_HEIGHT - AccountNumberPad.padHeight - horSeparateLine.frame.origin.y
        scrollView = UIScrollView(frame: CGRectMake(0,horSeparateLine.frame.origin.y + 1,SCREEN_WIDTH, scrollViewHeight))
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        self.view.addSubview(scrollView)
        
        initAccountTypeButtons()
        initNumberPadView()
    }
    
    override func viewDidLayoutSubviews() {
        let tipLabelRect:CGRect = payTipLabel.frame
        payTipLabel.frame = CGRect(x:SCREEN_WIDTH/4*3/2 - tipLabelRect.size.width/2, y:tipLabelRect.origin.y, width:tipLabelRect.size.width, height:tipLabelRect.size.height)
        payTipLabel.setNeedsDisplay()
        incomeTipLabel.frame = CGRect(x:SCREEN_WIDTH/4*3 + SCREEN_WIDTH/4/2 - tipLabelRect.size.width/2, y:tipLabelRect.origin.y, width:tipLabelRect.size.width, height:tipLabelRect.size.height)
        separateLine.frame = CGRect(x:SCREEN_WIDTH/4*3 - 6, y:64, width:1, height:29)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    func initAccountTypeButtons() {
        let paddingTop:CGFloat = 15
        
        let payModelArray = DataStorageService.sharedInstance.getAccountTypeList(AccountType.pay)
        let incomeModelArray = DataStorageService.sharedInstance.getAccountTypeList(AccountType.income)
        
        for index in 0 ..< payModelArray.count {
            let payModel = payModelArray[index]
            
            var payLine:Int = ((index + 1) / 3)
            var payLineNum:Int = (index + 1) % 3
            if payLineNum == 0 {
                payLineNum = 3
                payLine = payLine - 1
            }
            let payButtonX:CGFloat = AccountTypeSquareButton.buttonPadding * CGFloat(payLineNum) + 0 + AccountTypeSquareButton.buttonWidth * (CGFloat(payLineNum) - 1)
            let payButtonY:CGFloat = AccountTypeSquareButton.buttonPadding * CGFloat(payLine) + AccountTypeSquareButton.buttonHeight * CGFloat(payLine) + paddingTop
            
            let payButton:AccountTypeSquareButton = AccountTypeSquareButton(frame: CGRectMake(payButtonX, payButtonY, AccountTypeSquareButton.buttonWidth, AccountTypeSquareButton.buttonHeight),type: AccountType.pay,title: payModel.name!)
            payButton.buttonIndex = index;
            payButton.addTarget(self, action: #selector(self.typeButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            scrollView.addSubview(payButton)
            
            if index == 0 {
                payButton.selectedSquare = true;
                lastSelectPayTypeIndex = 0
            }
            
            payTypeButtonArray.append(payButton)
        }
        
        for index in 0 ..< incomeModelArray.count {
            let incomeModel = incomeModelArray[index]
            
            let incomeButtonX:CGFloat = SCREEN_WIDTH -  AccountTypeSquareButton.buttonPadding - AccountTypeSquareButton.buttonWidth
            let incomeButtonY:CGFloat = paddingTop + AccountTypeSquareButton.buttonPadding * CGFloat(index) + AccountTypeSquareButton.buttonHeight * CGFloat(index)
            
            let incomeButton:AccountTypeSquareButton = AccountTypeSquareButton(frame: CGRectMake(incomeButtonX, incomeButtonY, AccountTypeSquareButton.buttonWidth, AccountTypeSquareButton.buttonHeight),type: AccountType.income,title: incomeModel.name!)
            incomeButton.buttonIndex = index
            incomeButton.addTarget(self, action: #selector(self.typeButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            scrollView.addSubview(incomeButton)
            
            incomeTypeButtonArray.append(incomeButton)
        }
        
        let payLine:Int = payModelArray.count / 3
        let incomeLine:Int = incomeModelArray.count
        var maxLine:Int = payLine
        if payLine < incomeLine {
            maxLine = incomeLine
        }
        
        scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, CGFloat(maxLine) * AccountTypeSquareButton.buttonHeight + CGFloat(maxLine) * AccountTypeSquareButton.buttonPadding + paddingTop)
    }
    
    func initNumberPadView() {
        numPadView = AccountNumberPad(frame: CGRectMake(0,SCREEN_HEIGHT - AccountNumberPad.padHeight,SCREEN_WIDTH,AccountNumberPad.padHeight))
        numPadView?.confirmClosure = confirmResult
        self.view.addSubview(numPadView!)
    }
    
    func confirmResult(result:Int) {
        if result > 0 {
            let accountModel:AccountModel = AccountModel()
            let nowDate = NSDate()
            accountModel.id = String(nowDate.timeIntervalSince1970)
            accountModel.bookId = "1"
            accountModel.accountDate = NSDate.dateDayStringWithStandardFormat(nowDate)
            accountModel.accountMonthDate = NSDate.dateMonthStringWithStandardFormat(nowDate)
            accountModel.createDate = NSDate.dateFullStringWithStandardFormat(nowDate)
            accountModel.updateDate = NSDate.dateFullStringWithStandardFormat(nowDate)
            accountModel.typeId = "2001"
            accountModel.typeName = "一般支出"
            accountModel.amount = String(result)
            accountModel.menberId = "001"
            accountModel.menberName = "全家"
            accountModel.payOrIncome = "pay"
            
            DataStorageService.sharedInstance.addAccountToDatabase(accountModel)
        }
    }
    
    //MARK: - Functions
    
    
    // MARK: - Actions
    func typeButtonClick(sender:AnyObject) {
        let typeButton = sender as! AccountTypeSquareButton
        let isSelected = typeButton.selectedSquare
        let selectIndex = typeButton.buttonIndex
        let buttenType = typeButton.accountType
        
        numPadView?.changeTopBarLabelText(typeButton.buttonTitle!, type: buttenType)

        if buttenType == AccountType.pay {
            if lastSelectPayTypeIndex != -1 {
                let lastPayButton = payTypeButtonArray[lastSelectPayTypeIndex]
                lastPayButton.selectedSquare = false
            }
            if isSelected == true {
                typeButton.selectedSquare = false
                lastSelectPayTypeIndex = -1
            } else {
                typeButton.selectedSquare = true
                lastSelectPayTypeIndex = selectIndex!
            }
            
            if lastSelectIncomeTypeIndex != -1 {
                let lastIncomeButton = incomeTypeButtonArray[lastSelectIncomeTypeIndex]
                lastIncomeButton.selectedSquare = false
            }
            
        } else {
            if lastSelectIncomeTypeIndex != -1 {
                let lastIncomeButton = incomeTypeButtonArray[lastSelectIncomeTypeIndex]
                lastIncomeButton.selectedSquare = false
            }
            if isSelected == true {
                typeButton.selectedSquare = false
                lastSelectIncomeTypeIndex = -1
            } else {
                typeButton.selectedSquare = true
                lastSelectIncomeTypeIndex = selectIndex!
            }
            
            if lastSelectPayTypeIndex != -1 {
                let lastPayButton = payTypeButtonArray[lastSelectPayTypeIndex]
                lastPayButton.selectedSquare = false
            }
        }
        
    }
    
    @IBAction func closeAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
