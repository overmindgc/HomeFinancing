//
//  DataStorageService.swift
//  homefinancing
//
//  Created by 辰 宫 on 5/8/16.
//  Copyright © 2016 wph. All rights reserved.
//

class DataStorageService: GCBaseStorage {
    
    static let sharedInstance = DataStorageService()
    private override init() {}
    
    static let incomeTypeArray = [["id":"1001","name":"工资"],
                                  ["id":"1002","name":"奖金"],
                                  ["id":"1003","name":"回账"],
                                  ["id":"1004","name":"利息"],
                                  ["id":"1005","name":"其他"]]
    static let payTypeArray = [["id":"2001","name":"一般支出"],
                               ["id":"2002","name":"日用品"],
                               ["id":"2003","name":"吃喝"],
                               ["id":"2004","name":"娱乐"],
                               ["id":"2005","name":"交通"],
                               ["id":"2006","name":"孩子"],
                               ["id":"2007","name":"水电费"],
                               ["id":"2008","name":"电话费"],
                               ["id":"2009","name":"住宿"],
                               ["id":"2010","name":"服装"],
                               ["id":"2011","name":"教育"],
                               ["id":"2012","name":"医疗"],
                               ["id":"2013","name":"数码"],
                               ["id":"2014","name":"网购"],
                               ["id":"2015","name":"其他"]]
    
    internal func getAccountTypeList(type:AccountType) -> Array<AccountTypeModel> {
        
        var typeArray:Array<AccountTypeModel> = []
        
        if type == AccountType.pay {
            for payDict in DataStorageService.payTypeArray {
                let payTypeModel:AccountTypeModel = AccountTypeModel(dict: payDict)
                typeArray.append(payTypeModel)
            }
        } else {
            for incomeDict in DataStorageService.incomeTypeArray {
                let incomeTypeModel:AccountTypeModel = AccountTypeModel(dict: incomeDict)
                typeArray.append(incomeTypeModel)
            }
        }
        
        return typeArray
    }
    
}
