//
//  BaseTableViewController.m
//  TFY_AutoLMTools
//
//  Created by 田风有 on 2019/5/16.
//  Copyright © 2019 恋机科技. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor tfy_colorWithHex:@"ffffff"];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.showsHorizontalScrollIndicator=NO;
        _tableView.separatorInset= UIEdgeInsetsMake(0,20,0,20);
        _tableView.separatorColor = [UIColor tfy_colorWithHex:@"E8E8E8"];
        _tableView.estimatedRowHeight=30;
        _tableView.rowHeight=UITableViewAutomaticDimension;
    }
    return _tableView;
}
//下拉刷新
-(void)addharder
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = NO;
    // 隐藏状态
    header.stateLabel.hidden = NO;
    
    self.tableView.mj_header= header;
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadNewData{}

-(void)addfooter{
    MJRefreshBackNormalFooter *footer=[MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadfooter)];
    // 隐藏状态
    footer.stateLabel.hidden = YES;
    
    self.tableView.mj_footer =footer;
}

-(void)loadfooter{}

- (void)setNoMoreData:(BOOL)noMoreData{
    
    if (noMoreData) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
    else{
        [self.tableView.mj_footer resetNoMoreData];
    }
}
@end
