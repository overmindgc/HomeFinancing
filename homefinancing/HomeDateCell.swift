//
//  HomeDateCell.swift
//  homefinancing
//
//  Created by 辰 宫 on 4/6/16.
//  Copyright © 2016 wph. All rights reserved.
//

import UIKit

let dateCellHeight:CGFloat = 55

class HomeDateCell: HFTableViewCell {

    var payMoneyLabel: UILabel!
    var dateLabel: UILabel!
    var incomeMoneyLabel: UILabel!
    
    private var payLabel: UILabel!
    private var centerDateView: UIView!
    private var incomeLabel: UILabel!
    private var verLineView:UIView!
    
    let tableOffset:CGFloat = 0
    let centerDateViewWidth:CGFloat = 40
    let payIncomeLabelWidth:CGFloat = 60
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initViews()
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        verLineView = UIView(frame: CGRectMake(SCREEN_WIDTH/2 - 0.5 + tableOffset,0,1,dateCellHeight))
        verLineView.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(verLineView)
        
        payMoneyLabel = UILabel(frame: CGRectMake(tableOffset,0,SCREEN_WIDTH/2 - payIncomeLabelWidth - centerDateViewWidth/2,dateCellHeight))
        payMoneyLabel.textAlignment = NSTextAlignment.Right
        payMoneyLabel.textColor = UIColor.grayColor()
        payMoneyLabel.font = UIFont.boldSystemFontOfSize(14)
        payMoneyLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(payMoneyLabel)
        
        payLabel = UILabel(frame: CGRectMake(payMoneyLabel.frame.size.width,0,payIncomeLabelWidth,dateCellHeight))
        payLabel.textAlignment = NSTextAlignment.Center
        payLabel.textColor = appPayColor
        payLabel.font = UIFont.boldSystemFontOfSize(14)
        payLabel.text = "支出"
        self.addSubview(payLabel)
        
        centerDateView = UIView(frame: CGRectMake(SCREEN_WIDTH/2 - centerDateViewWidth/2 + tableOffset,dateCellHeight/2 - centerDateViewWidth/2,centerDateViewWidth,centerDateViewWidth))
        centerDateView.backgroundColor = UIColor.lightGrayColor()
        centerDateView.layer.cornerRadius = centerDateViewWidth / 2
        self.addSubview(centerDateView)
        
        dateLabel = UILabel(frame: CGRectMake(0,0,centerDateViewWidth,centerDateViewWidth))
        dateLabel.textAlignment = NSTextAlignment.Center
        dateLabel.font = UIFont.boldSystemFontOfSize(13)
        dateLabel.textColor = UIColor.whiteColor()
        centerDateView.addSubview(dateLabel)
        
        incomeLabel = UILabel(frame: CGRectMake(SCREEN_WIDTH/2 + centerDateViewWidth/2 + tableOffset,0,payIncomeLabelWidth,dateCellHeight))
        incomeLabel.textAlignment = NSTextAlignment.Center
        incomeLabel.textColor = appIncomeColor
        incomeLabel.font = UIFont.boldSystemFontOfSize(14)
        incomeLabel.text = "收入"
        self.addSubview(incomeLabel)
        
        incomeMoneyLabel = UILabel(frame: CGRectMake(incomeLabel.frame.origin.x + incomeLabel.frame.size.width - tableOffset,0,SCREEN_WIDTH - incomeLabel.frame.origin.x - incomeLabel.frame.size.width,dateCellHeight))
        incomeMoneyLabel.textAlignment = NSTextAlignment.Left
        incomeMoneyLabel.textColor = UIColor.grayColor()
        incomeMoneyLabel.font = UIFont.boldSystemFontOfSize(14)
        incomeMoneyLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(incomeMoneyLabel)
        
    }
    
}
