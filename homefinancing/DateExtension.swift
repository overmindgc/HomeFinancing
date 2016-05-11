//
//  DateExtension.swift
//  homefinancing
//
//  Created by 辰 宫 on 5/11/16.
//  Copyright © 2016 wph. All rights reserved.
//

extension NSDate {
    static func dateFullStringWithStandardFormat(date:NSDate?) -> String {
        var originDate = date
        if date == nil {
            originDate = NSDate()
        }
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.stringFromDate(originDate!)
    }
    
    static func dateDayStringWithStandardFormat(date:NSDate?) -> String {
        var originDate = date
        if date == nil {
            originDate = NSDate()
        }
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.stringFromDate(originDate!)
    }
    
    static func dateMonthStringWithStandardFormat(date:NSDate?) -> String {
        var originDate = date
        if date == nil {
            originDate = NSDate()
        }
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM"
        return formatter.stringFromDate(originDate!)
    }
}
