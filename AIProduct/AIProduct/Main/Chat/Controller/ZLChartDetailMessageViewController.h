//
//  ZLChartDetailMessageViewController.h
//  AIProduct
//
//  Created by mac on 2017/8/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLBaseCustomNavViewController.h"
#import <GCDAsyncSocket.h>
@interface ZLChartDetailMessageViewController : ZLBaseCustomNavViewController

{
    GCDAsyncSocket *serverSocket;
    GCDAsyncSocket *listenSocket;
    GCDAsyncSocket *clientSocket;
    
    
    
    
}

@end
