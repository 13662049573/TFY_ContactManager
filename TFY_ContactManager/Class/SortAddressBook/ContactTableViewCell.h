//
//  ContactTableViewCell.h
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TFY_PersonModel;

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableViewCell : UITableViewCell

@property (nonatomic, strong) TFY_PersonModel *model;

@end

NS_ASSUME_NONNULL_END
