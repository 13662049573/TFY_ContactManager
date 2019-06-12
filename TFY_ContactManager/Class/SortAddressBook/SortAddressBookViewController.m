//
//  SortAddressBookViewController.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "SortAddressBookViewController.h"
#import "ContactTableViewCell.h"
@interface SortAddressBookViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSArray *dataSource;
@property (nonatomic, copy) NSArray *keys;
@end

@implementation SortAddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"获取联系人列表(已分组)";
    
    self.tableView.delegate=self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView tfy_AutoSize:0 top:0 right:0 bottom:0];
    
    [self addharder];
}

-(void)loadNewData{
    [[TFY_ContactManager sharedInstance] accessSectionContactsComplection:^(BOOL succeed, NSArray<TFY_SectionPerson *> * _Nonnull contacts, NSArray<NSString *> * _Nonnull keys) {
        
        self.dataSource = contacts;
        self.keys = keys;
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TFY_SectionPerson *sectionModel = self.dataSource[section];
    return sectionModel.persons.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SectionCell"];
    if (!cell) {
        cell = [[ContactTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SectionCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    
    TFY_SectionPerson *sectionModel = self.dataSource[indexPath.section];
    TFY_PersonModel *personModel = sectionModel.persons[indexPath.row];
    cell.model = personModel;
    return cell;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.keys;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    TFY_SectionPerson *sectionModel = self.dataSource[section];
    return sectionModel.key;
}
@end
