//
//  HomeTableViewCell.swift
//  homefinancing
//
//  Created by 辰 宫 on 4/6/16.
//  Copyright © 2016 wph. All rights reserved.
//

import UIKit

class HomeTableViewCell: HFTableViewCell {

    var payMoneyLabel: UILabel
    var payLabel: UILabel
    var centerCircleView: UIView
    var incomeLabel: UILabel
    var incomeMoneyLabel: UILabel
    var verLineView:UIView
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initViews()
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.initViews()
    }
    
    func initViews() {
        
    }
    
}
