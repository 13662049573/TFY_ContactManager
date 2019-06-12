//
//  BaseTableViewController.h
//  TFY_AutoLMTools
//
//  Created by 田风有 on 2019/5/16.
//  Copyright © 2019 恋机科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : UIViewController

@property(nonatomic , strong)UITableView *tableView;

/**
 *  下拉加载
 */
-(void)addharder;
/**
 *  下拉需要加载数据调用这个方法
 */
- (void)loadNewData;
/**
 *  上拉加载
 */
-(void)addfooter;
/**
 *  上拉需要加载数据调用这个方法
 */
-(void)loadfooter;
/**
 *  有数据是否加载显示文字
 */
- (void)setNoMoreData:(BOOL)noMoreData;
@end

NS_ASSUME_NONNULL_END
