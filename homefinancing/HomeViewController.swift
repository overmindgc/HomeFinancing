//
//  HomeViewController.swift
//  homefinancing
//
//  Created by 辰 宫 on 16/2/20.
//  Copyright © 2016年 wph. All rights reserved.
//

import UIKit

class HomeViewController: HFBaseViewController,UITableViewDelegate,UITableViewDataSource {

    let tableCellIndentifierDate = "tableCellIndentifierDate"
    let tableCellIndentifierItem = "tableCellIndentifierItem"
    
    @IBOutlet weak var tableView: HFBaseTableView!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var topCenterView: UIButton!
    
    var progress:KDCircularProgress!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = appPayColor
        self.navigationController?.title = "主页"
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        let colorDict:[String:AnyObject] = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = colorDict
        
        payLabel.adjustsFontSizeToFitWidth = true;
        incomeLabel.adjustsFontSizeToFitWidth = true;
        
        progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        progress.startAngle = -90
        progress.progressThickness = 0.35
        progress.trackThickness = 0.35
        progress.clockwise = false
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = true
        progress.glowMode = .NoGlow
        progress.angle = 275
        progress.setColors(appIncomeColor)
        progress.trackColor = appLitePayColor
        topCenterView.addSubview(progress)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        progress.angle = 275
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //每一块有多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    //绘制cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row % 3 == 0 {
            let dateCell = HomeDateCell(style: UITableViewCellStyle.Default, reuseIdentifier: tableCellIndentifierDate)
            dateCell.accessoryType = UITableViewCellAccessoryType.None
            dateCell.payMoneyLabel.text = "￥150"
            dateCell.dateLabel.text = "\(row + 1)日"
            dateCell.incomeMoneyLabel.text = "￥1000"
            return dateCell
        } else {
            let itemCell = HomeItemCell(style: UITableViewCellStyle.Default, reuseIdentifier: tableCellIndentifierItem)
            itemCell.accessoryType = UITableViewCellAccessoryType.None
            if row % 2 == 0 {
                itemCell.currentType = PayIncomeType.Pay
            } else {
                itemCell.currentType = PayIncomeType.Income
            }
            itemCell.payLabel.text = "￥150 日用品"
            itemCell.incomeLabel.text = "奖金 ￥1000"
            return itemCell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currCell:HFTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as! HFTableViewCell
        currCell.selected = false
    }
    
    //每个cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let row = indexPath.row
        if row % 3 == 0 {
            return dateCellHeight
        } else {
            return colorCellHeight
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func addClickAction(sender: AnyObject) {
        
    }

}
