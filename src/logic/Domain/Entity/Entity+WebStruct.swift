//
//  Entity+WebStruct.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/04.
//  Copyright © 2017年 addli.jp. All rights reserved.
//

import Foundation
import WebStruct

// Dummy type of Request
public struct RequestStruct {
    let value:String
}

extension RequestStruct : WebDeserializable {

    public func toObject() -> Any{
        return [ "key" : value ]
    }
}


// Error type
public struct ParseError : Swift.Error{
    let code:Int
    let reason:String
}

public struct ApplicationError : Swift.Error{
    let code:Int
    let reason:String
}


extension ApplicationError : WebSerializable{
    public init (fromObject object:Any) throws{
        guard case let dic as [String:Any] = object
            else{ throw ParseError(code: 0, reason: "") }
        
        guard case let error as [String:Any] = dic["error"]
            else{ throw ParseError(code: 0, reason: "") }
        
        guard case let code as Int = error["code"]
            else{ throw ParseError(code: 0, reason: "") }
        self.code = code
        
        guard case let reason as String = error["reason"]
            else{ throw ParseError(code: 0, reason: "") }
        self.reason = reason
    }
}



public struct PlacesWrapper{
    let places:[Place]
}

extension PlacesWrapper : WebInitializable{
    
    public typealias inputType = RequestStruct
    public typealias errorType = ApplicationError
    
    public init (fromObject object:Any) throws{
        
        guard case let array as [[String:Any]] = object
            else { throw ParseError(code: -1, reason: "Returned body is not array.") }
        
        self.places = try array.map({ place in
            
            guard case let title as String = place["title"]
                else{ throw ParseError(code: -1, reason: "The title not contain.") }
            guard case let type as String = place["type"]
                else{ throw ParseError(code: -1, reason: "The type not contain.") }
            guard case let postalCode as String = place["postalCode"]
                else{ throw ParseError(code: -1, reason: "The postalCode not contain.") }
            guard case let address as String = place["address"]
                else{ throw ParseError(code: -1, reason: "The address not contain.") }
            guard case let tel as String = place["tel"]
                else{ throw ParseError(code: -1, reason: "The tel not contain.") }
            guard case let url as String = place["url"]
                else{ throw ParseError(code: -1, reason: "The url not contain.") }
            
            guard case let location as [String:Double] = place["location"]
                else{ throw ParseError(code: -1, reason: "The location not contain.") }
            guard let lat = location["latitude"]
                else{ throw ParseError(code: -1, reason: "The latitude not contain.") }
            guard let lon = location["longitude"]
                else{ throw ParseError(code: -1, reason: "The longitude not contain.") }
            
            return Place( title: title, type: type, postalCode: postalCode, address: address, tel: tel, url: url, location: Location( latitude: lat, longitude: lon ) )
        })
    }
}

public struct MarkdownWrapper{
    let text:String
}

extension MarkdownWrapper : WebInitializable{
    
    public typealias inputType = RequestStruct
    public typealias errorType = ApplicationError

    public init (fromObject object:Any) throws{
        guard case let text as String = object
             else { throw ParseError(code: -1, reason: "Returned body is not text.") }
        self.text = text
    }
    
    public static var request:URLRequest {
        guard let url = URL(string: "http://" ) else{ fatalError() }
        var request = URLRequest(url:url, cachePolicy:.reloadIgnoringLocalCacheData, timeoutInterval:3.0 )
        request.addValue("text/plain", forHTTPHeaderField: "Content-Type" )
        return request
    }
    
    public static func serialize(data:Data) throws -> Any {
        return String(data: data, encoding: .utf8 ) ?? data
    }
}
