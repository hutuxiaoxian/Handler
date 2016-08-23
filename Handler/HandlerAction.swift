//
//  HandlerAction.swift
//  PlatformWithMac
//
//  Created by hutu on 16/8/15.
//  Copyright © 2016年 hutu. All rights reserved.
//

import Cocoa

class HandlerAction: NSObject {

    private var runnable : Void?;
    
    private var queue : dispatch_queue_t;
    
    private var isAsync : Bool = true;
    
    override init() {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    }
    
    convenience init(isAsync : Bool) {
        self.init();
        self.isAsync = isAsync;
    }
    
    func setAsync(isAsync : Bool) {
        self.isAsync = isAsync;
    }
    
    func running(runnable:Void?, handler: HandlerMessage?, msg : Message?) {
        if isAsync {
            if (runnable != nil) {
                dispatch_async(queue, {
                    runnable;
                });
            }
            if (handler != nil && msg != nil) {
                dispatch_async(dispatch_get_main_queue(), {
                    handler!.handleMessage(msg);
                });
            }
        } else {
            dispatch_sync(queue, {
                if (runnable != nil) {
                    runnable;
                }
                if (handler != nil && msg != nil) {
                    handler!.handleMessage(msg);
                }
            });
        }
    }

}
