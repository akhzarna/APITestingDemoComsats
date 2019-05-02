//
//  Property.swift
//  Yakut
//
//  Created by Tahir Hameed on 3/7/18.
//  Copyright © 2018 AtTech. All rights reserved.
//

import UIKit

class PublicationPDF: NSObject {
   
    var ID:Int = 0
    var title:String = ""
    var updated_at:String = ""
    var created_at:String = ""
    var file:String = ""
    var type:String = ""
   
//    var propertySliderArray = NSArray()
//    var propertyFeatureList = [PropertyFeature]()
//    var propertyTypeList = [PropertyType]()
//    var propertyFeature = PropertyFeature()
//    var propertyStatusList = [PropertyStatus]()
//
    override init() {
        super.init()
    }
    
    init(Data dictionary:[String: Any]){
        super.init()
        
        if let aid = dictionary["id"] as? Int {
            ID = aid
        }
        
        if let aTitle = dictionary["title"] as? String {
            title = aTitle
        }
        
        
        if let aFile = dictionary["file"] as? String {
            file = aFile
        }
        
        if let aCreated_at = dictionary["created_at"] as? String {
            created_at = aCreated_at
        }
        
        if let aUpdated_at = dictionary["updated_at"] as? String {
            updated_at = aUpdated_at
        }
        
        if let aType = dictionary["type"] as? String {
            type = aType
        }
        
//        if let response = dictionary["pure_taxonomies"] as? [String:Any],
//                let aarti = response["property-feature"] as? [[String:Any]] {
//                propertyFeatureList = PropertyFeature.PopulateArray(array: aarti)
//        }
        
//        if let response = dictionary["pure_taxonomies"] as? [String:Any],
//            let aarti = response["property-type"] as? [[String:Any]] {
//            propertyTypeList = PropertyType.PopulateArray(array: aarti)
//        }
        
    }
    
    class func Populate(dictionary:[String: Any]) -> PublicationPDF {
        let obj = PublicationPDF(Data: dictionary)
        return obj
    }
    
    class func PopulateArray(array:[[String: Any]]) -> [PublicationPDF] {
        var result :[PublicationPDF] = []
        for item in array {
            let obj = PublicationPDF(Data: item)
            result.append(obj)
        }
        return result
    }
}
