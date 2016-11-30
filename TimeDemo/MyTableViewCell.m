//
//  MyTableViewCell.m
//  TimeDemo
//
//  Created by zsy on 2016/11/29.
//  Copyright © 2016年 zsy. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell()
@property (nonatomic, strong) UILabel *hourLabel;
@property (nonatomic, strong) UILabel *minuteLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) UILabel *hintLabel;
@end
@implementation MyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatSubviews];
    }
    return self;
}
- (void)creatSubviews {
    _hourLabel = [self label];
    _hourLabel.frame = CGRectMake(20, 10, 40, 20);
    [self.contentView addSubview:_hourLabel];
    
    UILabel *label1 = [self maohaoLabel];
    label1.frame = CGRectMake(60, 10, 20, 20);
    [self.contentView addSubview:label1];
    
    _minuteLabel = [self label];
    _minuteLabel.frame = CGRectMake(80, 10, 40, 20);
    [self.contentView addSubview:_minuteLabel];
    
    UILabel *label2 = [self maohaoLabel];
    label2.frame = CGRectMake(120, 10, 20, 20);
    [self.contentView addSubview:label2];
    
    _secondLabel = [self label];
    _secondLabel.frame = CGRectMake(140, 10, 40, 20);
    [self.contentView addSubview:_secondLabel];
    
    _hintLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 10, 100, 20)];
    _hintLabel.textColor = [UIColor greenColor];
    _hintLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_hintLabel];
}
- (UILabel *)label {
    UILabel *label = [UILabel new];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor greenColor];
    return label;
}
- (UILabel *)maohaoLabel {
    UILabel *label = [UILabel new];
    label.text = @":";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    return label;
}
- (void)setModel:(TimeDataModel *)model {
    _model = model;
    __weak typeof(self) weakSelf = self;
    _model.timechanged = ^ {
        weakSelf.hourLabel.text = [NSString stringWithFormat:@"%02ld",weakSelf.model.hour];
        weakSelf.minuteLabel.text = [NSString stringWithFormat:@"%02ld",weakSelf.model.minute];
        weakSelf.secondLabel.text = [NSString stringWithFormat:@"%02ld",weakSelf.model.second];
        weakSelf.hintLabel.text = weakSelf.model.isEnd ? @"超时" : @"剩余";
        
        if (weakSelf.model.isEnd) {
            weakSelf.hourLabel.backgroundColor = [UIColor redColor];
            weakSelf.minuteLabel.backgroundColor = [UIColor redColor];
            weakSelf.secondLabel.backgroundColor = [UIColor redColor];
            weakSelf.hintLabel.textColor = [UIColor redColor];
        }
    };
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.hourLabel.text = nil;
    self.hourLabel.backgroundColor = [UIColor greenColor];
    self.minuteLabel.text = nil;
    self.minuteLabel.backgroundColor = [UIColor greenColor];
    self.secondLabel.text = nil;
    self.secondLabel.backgroundColor = [UIColor greenColor];
    self.hintLabel.text = nil;
    self.hintLabel.textColor = [UIColor greenColor];
}
@end
