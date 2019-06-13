//
//  SortAddressBookViewController.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "SortAddressBookViewController.h"
#import "ContactTableViewCell.h"
@interface SortAddressBookViewController ()
@property (nonatomic, copy) NSArray *dataSource;
@property (nonatomic, copy) NSArray *keys;
@end

@implementation SortAddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"获取联系人列表(已分组)";
    
    [self.view addSubview:self.tableView];
    
    [self.tableView tfy_AutoSize:0 top:0 right:0 bottom:0];
    
    [self addharder];
}

-(void)loadNewData{
    [[TFY_ContactManager sharedInstance] accessSectionContactsComplection:^(BOOL succeed, NSArray<TFY_SectionPerson *> * _Nonnull contacts, NSArray<NSString *> * _Nonnull keys) {
        
        self.dataSource = contacts;
        self.keys = keys;
        
        [self tableViewLayout];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    }];
}

-(void)tableViewLayout{
    [self.tableView tfy_tableViewMaker:^(TFY_TableViewMaker * _Nonnull tableMaker) {
        
        [tableMaker.tfy_sectionCount(self.dataSource.count).tfy_sectionIndexArr(self.keys) tfy_sectionMaker:^(TFY_SectionMaker * _Nonnull sectionMaker) {
            
            sectionMaker.tfy_headerHeight(20);
            
            TFY_SectionPerson *sectionModel = self.dataSource[[sectionMaker section]];
            sectionMaker.tfy_headerTitle(sectionModel.key);
            
            [sectionMaker.tfy_dataArr(^(void){
                TFY_SectionPerson *sectionModel = self.dataSource[[sectionMaker section]];
                return sectionModel.persons;
                
            }) tfy_cellMaker:^(TFY_CellMaker * _Nonnull cellMaker) {
               
                cellMaker.tfy_cellClass(TFY_CellClass(ContactTableViewCell))
                .tfy_adapter(^(__kindof ContactTableViewCell *cell,TFY_PersonModel *model,NSIndexPath *iindexPath){
                    cell.model = model;
                })
                .tfy_rowHeight(60);
            }];
        }];
    }];
}

@end
