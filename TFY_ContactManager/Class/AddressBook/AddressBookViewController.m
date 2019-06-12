//
//  AddressBookViewController.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "AddressBookViewController.h"
#import "AddressBookTableViewCell.h"

@interface AddressBookViewController ()
@property (nonatomic, copy) NSArray *dataSource;
@end

@implementation AddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.title = @"获取联系人(未分组)";
    
    [self.view addSubview:self.tableView];
    
    [self.tableView tfy_AutoSize:0 top:0 right:0 bottom:0];
    
    [self addharder];
    
}

-(void)loadNewData{
    
    [[TFY_ContactManager sharedInstance] accessContactsComplection:^(BOOL succeed, NSArray<TFY_PersonModel *> * _Nonnull contacts) {
        
        self.dataSource = contacts;
        
        [self tableViewLayout];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    }];
}

-(void)tableViewLayout{
    [self.tableView tfy_tableViewMaker:^(TFY_TableViewMaker * _Nonnull tableMaker) {
        
        [tableMaker tfy_addSectionMaker:^(TFY_SectionMaker * _Nonnull sectionMaker) {
            
            [sectionMaker.tfy_dataArr(TFY_DataArr(self.dataSource)) tfy_cellMaker:^(TFY_CellMaker * _Nonnull cellMaker) {
                
                cellMaker.tfy_cellClass(TFY_CellClass(AddressBookTableViewCell))
                .tfy_adapter(^(__kindof AddressBookTableViewCell *cell, id data, NSIndexPath *indexPath){
                    
                    cell.model = data;
                })
                .tfy_rowHeight(60);
            }];
        }];
    }];
    
}

@end
