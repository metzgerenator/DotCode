//
//  Constants.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 10/23/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation
import UIKit


//company types new ones

let USERTYPE = "user_type"

let CLIENT = "client"
let DEVELOPER = "developer"

let COMPANYSIZE = "company_size"
let FREELANCERTYPE = "Freelancer"
let SMALLTEAMTYPE = "Small Team"
let DEVSHOPTYPE = "Dev Shop"
let CITY = "city"
let USERLOCATION = "Location"
let USERSWEBSITE = "user_website"
let USERSNAME = "username"
let USERSEMAIL = "user_emal"
let COMPANYNAME = "company_name"
let COMPANYDESCRIPTION = "company_description"
let PREVIOUSCLIENTS = "previous_clients"
let USERIMAGE = "user image"
let USERPROJECTS = "project_portfolio"
let PROJECTDESCRIPTION = "Description"
let PROJECTURLS = "URLS"
let DEVELOPERSKILLS = "developer_skills"


//Client types
let Entrepeneur = "Entrepreneur"
let Company  = "Company"




let USERAVAILABILITY = "user_availability"
//longterm shortterm contract 

let LONGTERM = "long_term"
let SHORTTERM = "short_term"
let CONTRACT = "contract"


//////
 let dateFormatter = DateFormatter()

let users = "users"

let customers = "customer"

let userIDType = "user_type"

//Developers

let DEVELOPERTYPE = "developerType"
let FREELANCER = "freelancer"
let COMPANY = "company"

let developer = "developers"


var currentUserDevType: String?





//Client Job creatin 

var JOBSIZE = "Job Size"
var WEBAPP = "Web App"
var APP = "App"
var WEBSITE = "Web Site"




extension Date {
    
    func westernTime() ->String{
        
        let date = self.currentTimeInt()
    
        return "\(date.month)/ \(date.day)/ \(date.year)"
    }
    
    
    
    func currentTimeInt() ->(hours: Int, minutes: Int, seconds: Int, month: Int, day: Int, year: Int, weekday: Int, monthString: String, weekofmonth: Int){
        
        
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day , .month , .year, .hour, .minute, .second, .weekday, .weekOfMonth], from: self)
        
        let year =  components.year
        let month = components.month
        let months = dateFormatter.shortMonthSymbols
        
        let monthSymbol = (months?[month!-1])! as String
        
        let day = components.day
        let hours = components.hour
        let minutes = components.minute
        let seconds = components.second
        let weekday = components.weekday
        let weekofMonth = components.weekOfMonth
        
        return (hours!, minutes!, seconds!, month!, day!, year!, weekday!, monthSymbol, weekofMonth!)
    }
    
    
    
    func dayAdderandSubtractor(_ daystoModify: Int) -> Date {
        
        
        return  Calendar.current.date(byAdding: .day, value: daystoModify, to: self)!
        
        
    }

    
}


extension UITextField {
    
    func setBottomBorder(borderColor: UIColor)
    {
        
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        let width = 0.5
        
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - width, width: Double(self.frame.width), height: width)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
    
}


extension UILabel {
    
    
    func setFullBorder(borderColor: UIColor)
    {
        
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.clear
        let width = 0.5
        
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height), width: Double(self.frame.width), height: width)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }

    
    
}


extension UIButton {
    
    func setBottomBorder(borderColor: UIColor)
    {
        
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.clear
        let width = 0.5
        
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - width, width: Double(self.frame.width), height: width)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
    
    
    func setFullBorder(borderColor: UIColor)
    {
        
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.clear
        let width = 0.5
        
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height), width: Double(self.frame.width), height: width)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
    
}






