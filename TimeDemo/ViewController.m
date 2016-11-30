//
//  ViewController.m
//  TimeDemo
//
//  Created by zsy on 2016/11/29.
//  Copyright © 2016年 zsy. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end
static NSString * const identifier = @"time";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:identifier];
    [self.view addSubview:self.tableView];
    [self creatData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataSource;
}
- (void)creatData {
    
    for (int i = 0; i < 50; i++) {
        TimeDataModel *model = [[TimeDataModel alloc] initWithTimeInterval:[self getRandomNumber:1480053240 to:1481349240]];
        [self.dataSource addObject:model];
    }
    [self.tableView reloadData];
}
-(NSTimeInterval)getRandomNumber:(long long)from to:(long long)to {
    return (NSTimeInterval)(from + (arc4random() % (to - from + 1)));
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimeDataModel *model = self.dataSource[indexPath.row];
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.model = model;
    return cell;
}
@end
