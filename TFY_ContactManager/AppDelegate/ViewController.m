//
//  ViewController.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "ViewController.h"
#import "SortAddressBookViewController.h"
#import "SelectPhoneNumViewController.h"
#import "AddContactViewController.h"
#import "AddressBookViewController.h"

#import "ViewTableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"通讯录选择";
    self.navigationController.tfy_titleColor = [UIColor redColor];
    self.navigationController.tfy_titleFont = [UIFont systemFontOfSize:15];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView tfy_AutoSize:0 top:0 right:0 bottom:0];
    
    [self tableViewLayout];
}

-(void)tableViewLayout{
    NSArray *arr = @[@"选择联系人",@"创建新联系人",@"添加现有联系人",@"获取联系人(未分组)",@"获取联系人列表(已分组)"];
    [self.tableView tfy_tableViewMaker:^(TFY_TableViewMaker * _Nonnull tableMaker) {
        
        [tableMaker tfy_addSectionMaker:^(TFY_SectionMaker * _Nonnull sectionMaker) {
            
            [sectionMaker.tfy_dataArr(TFY_DataArr(arr)) tfy_cellMaker:^(TFY_CellMaker * _Nonnull cellMaker) {
               
                cellMaker.tfy_cellClass(TFY_CellClass(ViewTableViewCell))
                .tfy_adapter(^(__kindof ViewTableViewCell *cell, id data, NSIndexPath *indexPath){
                    
                    cell.name_string = data;
                })
                .tfy_event(^(__kindof UITableView *tableView,NSIndexPath *indexPath,id data){
                    if (indexPath.row == 0) {
                        [self.navigationController pushViewController:[SelectPhoneNumViewController new] animated:YES];
                    }
                    else if (indexPath.row == 1){
                        AddContactViewController *vc = [AddContactViewController new];
                        vc.index = 0;
                        [self.navigationController pushViewController:vc animated:YES];
                    }
                    else if (indexPath.row == 2){
                        AddContactViewController *vc = [AddContactViewController new];
                        vc.index = 1;
                        [self.navigationController pushViewController:vc animated:YES];
                    }
                    else if (indexPath.row == 3){
                        [self.navigationController pushViewController:[AddressBookViewController new] animated:YES];
                    }
                    else if (indexPath.row == 4){
                        [self.navigationController pushViewController:[SortAddressBookViewController new] animated:YES];
                    }
                })
                .tfy_rowHeight(60);
            }];
        }];
    }];
}

@end
