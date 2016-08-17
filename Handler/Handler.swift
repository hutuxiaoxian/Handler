//
//  Handler.swift
//  PlatformWithMac
//
//  Created by hutu on 16/8/15.
//  Copyright © 2016年 hutu. All rights reserved.
//


public protocol HandlerMessage {
    func handleMessage(msg : Message?)
}

public class Handler: NSObject {
    
    private let handler : HandlerMessage;
    private let action : HandlerAction;
    
    public init(handlerMessage : HandlerMessage) {
        self.handler = handlerMessage;
        action = HandlerAction.init();
    }

    public func sendMessage(msg : Message) {
        action.running(nil, handler: self.handler, msg: msg);
    }
    
    public func postRunnable(runnable : Void) {
        let msg = Message.init();
        msg.what = 1;
        action.running(runnable, handler: self.handler, msg: msg);

    }
    
    public func postRunnable(runnable : Void , isAsync : Bool) {
        action.setAsync(isAsync);
        action.running(runnable, handler: self.handler, msg: nil);
    }
}
