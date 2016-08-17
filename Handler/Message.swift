//
//  Message.swift
//  PlatformWithMac
//
//  Created by hutu on 16/8/15.
//  Copyright © 2016年 hutu. All rights reserved.
//

public class Message: NSObject {

    public var flag1 : Int?;
    public var flag2 : Int?;
    public var what : Int?;
    
    public var isAsynchronous : Bool = false;
    
    private var object : NSObject?;
    
    public func setData(data:NSObject) {
        self.object = data;
    }
    
    public func getData() -> NSObject? {
        return self.object;
    }
    
    
    override public var description : String {
        var str : String = "";
        if flag1 != nil {
            str += "flag1:" + String(flag1) + " ";
        }
        
        if flag2 != nil {
            str += "flag2:" + String(flag2) + " ";
        }
        
        if what != nil {
            str += "what:" + String(what) + " ";
        }
        if object != nil {
            str += "object:" + object!.description;
        }
        
        return str;
    }
}
