//
//  TimeDataModel.m
//  TimeDemo
//
//  Created by zsy on 2016/11/29.
//  Copyright © 2016年 zsy. All rights reserved.
//

#import "TimeDataModel.h"

@interface TimeDataModel()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSDateComponents *components;
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, assign) NSUInteger flags;
@property (nonatomic, strong) NSDate *endTime;
@end
@implementation TimeDataModel
- (instancetype)initWithTimeInterval:(NSTimeInterval)interval {
    if (self = [super init]) {
        _timeInterval = interval;
        [self parserTime];
    }
    return self;
}
- (void)parserTime {
    _endTime = [[NSDate alloc] initWithTimeIntervalSince1970:_timeInterval];
    _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    _flags = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChanged:) userInfo:nil repeats:YES];
}
- (void)timeChanged:(NSTimer *)timer {
    _components = [self.calendar components:_flags fromDate:[NSDate date] toDate:_endTime options:NSCalendarWrapComponents];
    _hour = labs(self.components.hour);
    _minute = labs(self.components.minute);
    _second = labs(self.components.second);
    _isEnd = self.components.second < 0 ? YES : NO;
    if (self.timechanged) {
        self.timechanged();
        
    }
}
@end
