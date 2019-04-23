//
//  Property.swift
//  Yakut
//
//  Created by Tahir Hameed on 3/7/18.
//  Copyright © 2018 AtTech. All rights reserved.
//

import UIKit

class QuranTehqeeqAudioVideo: NSObject {
    
    var ID:Int = 0
    var title:String = ""
    var image:String = ""
    var updated_at:String = ""
    var video_link:String = ""
    var created_at:String = ""
    var category:String = ""
    var audio_link:String = ""
   
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
        
        if let anImage = dictionary["image"] as? String {
            image = anImage
        }
        
        if let anAudio_link = dictionary["audio_link"] as? String {
            audio_link = anAudio_link
        }
        
        if let aCategory = dictionary["category"] as? String {
            category = aCategory
        }
        
        if let aCreated_at = dictionary["created_at"] as? String {
            created_at = aCreated_at
        }
        
        if let aUpdated_at = dictionary["updated_at"] as? String {
            updated_at = aUpdated_at
        }
        
        if let aVideo_link = dictionary["video_link"] as? String {
            video_link = aVideo_link
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
    
    class func Populate(dictionary:[String: Any]) -> QuranTehqeeqAudioVideo {
        let obj = QuranTehqeeqAudioVideo(Data: dictionary)
        return obj
    }
    
    class func PopulateArray(array:[[String: Any]]) -> [QuranTehqeeqAudioVideo] {
        var result :[QuranTehqeeqAudioVideo] = []
        for item in array {
            let obj = QuranTehqeeqAudioVideo(Data: item)
            result.append(obj)
        }
        return result
    }
}
