//
//  AddContactViewController.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "AddContactViewController.h"

@interface AddContactViewController ()
@property(nonatomic , strong)UIImageView *login_imageView;
@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.login_imageView];
    
    self.login_imageView.tfy_CenterX(0).tfy_size(80, 80).tfy_TopSpace(64);
}

-(void)setIndex:(NSInteger)index{
    _index = index;
    if (_index == 0) {
        self.title = @"创建联系人";
        self.navigationItem.rightBarButtonItem = tfy_barbtnItem().tfy_titleItem(@"创建",16,[UIColor greenColor],self,@selector(leftClick));
    }
    else{
       self.title = @"添加联系人";
        self.navigationItem.rightBarButtonItem = tfy_barbtnItem().tfy_titleItem(@"添加",16,[UIColor greenColor],self,@selector(rightClick));
    }
    
}


-(UIImageView *)login_imageView{
    if (!_login_imageView) {
        _login_imageView = tfy_imageView().tfy_imge(@"guanyu copy");
    }
    return _login_imageView;
}


-(void)leftClick{
    [[TFY_ContactManager sharedInstance] createNewContactWithPhoneNum:@"13662049573" controller:self];
}

-(void)rightClick{
    [[TFY_ContactManager sharedInstance] addToExistingContactsWithPhoneNum:@"13662049573" controller:self];
}
@end
