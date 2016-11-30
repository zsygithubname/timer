//
//  MyTableViewCell.h
//  TimeDemo
//
//  Created by zsy on 2016/11/29.
//  Copyright © 2016年 zsy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeDataModel.h"
@interface MyTableViewCell : UITableViewCell
@property (nonatomic, strong) TimeDataModel *model;
@end
