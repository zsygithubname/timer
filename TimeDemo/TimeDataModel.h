//
//  TimeDataModel.h
//  TimeDemo
//
//  Created by zsy on 2016/11/29.
//  Copyright © 2016年 zsy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeDataModel : NSObject
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, assign) BOOL isEnd;
@property (nonatomic, assign) NSInteger hour;
@property (nonatomic, assign) NSInteger minute;
@property (nonatomic, assign) NSInteger second;
@property (nonatomic, copy) void (^timechanged)();
- (instancetype)initWithTimeInterval:(NSTimeInterval)interval;
@end
