//
//  HomeViewController.swift
//  homefinancing
//
//  Created by 辰 宫 on 16/2/20.
//  Copyright © 2016年 wph. All rights reserved.
//

import UIKit

class HomeViewController: HFBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: HFBaseTableView!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var topCenterView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = appPayColor
        payLabel.adjustsFontSizeToFitWidth = true;
        incomeLabel.adjustsFontSizeToFitWidth = true;
        
        let progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
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
        return 10
    }
    //绘制cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let initIdentifier = "Cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: initIdentifier)
        
        cell.accessoryType = UITableViewCellAccessoryType.None
        //下面两个属性对应subtitle
        cell.textLabel?.text = "测试"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //每个cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
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
