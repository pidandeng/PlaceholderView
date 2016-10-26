//
//  ViewController.m
//  PidanPlaceholderView
//
//  Created by jimushiguang on 16/10/26.
//  Copyright © 2016年 jimushiguang. All rights reserved.
//

#import "ViewController.h"
#import "PdPlaceholderView/PdPlaceholderView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *dataSourceBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController{
    NSMutableArray *_dataArray;
    PdPlaceholderView *_placeholderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSourceBtn.selected = NO;
    _dataArray = @[@"1",@"2",@"3",@"4",@"5"].mutableCopy;
}

- (IBAction)dataSourceChange:(id)sender {
    if (self.dataSourceBtn.selected) {
        self.dataSourceBtn.selected = NO;
        _dataArray = @[@"1",@"2",@"3",@"4",@"5"].mutableCopy;
        [_tableView reloadData];
        [_placeholderView dismiss];
    }else{
        self.dataSourceBtn.selected = YES;
        _dataArray = @[].mutableCopy;
        [_tableView reloadData];
        _placeholderView = [PdPlaceholderView sharedInstance];
        [_placeholderView creatUiWithType:6];
        [_tableView addSubview:_placeholderView];
        __weak typeof(self) weakSelf = self;
        _placeholderView.reloadBlock = ^(){
            [weakSelf.tableView reloadData];
        };

    }
}


#pragma mark  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"这是一条数据";
    return cell;
}

@end
