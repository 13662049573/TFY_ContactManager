//
//  SelectPhoneNumViewController.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "SelectPhoneNumViewController.h"

@interface SelectPhoneNumViewController ()
@property(nonatomic , strong)UIButton *button;

@property(nonatomic , strong)UILabel *name_label;

@property(nonatomic , strong)UILabel *phone_label;

@end

@implementation SelectPhoneNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择指定联系人显示";
    
    [self.view addSubview:self.button];
    self.button.tfy_LeftSpace(30).tfy_TopSpace(64).tfy_RightSpace(30).tfy_Height(50);
    
    [self.view addSubview:self.name_label];
    self.name_label.tfy_LeftSpace(30).tfy_TopSpaceToView(30, self.button).tfy_RightSpace(30).tfy_Height(40);
    
    [self.view addSubview:self.phone_label];
    self.phone_label.tfy_LeftSpace(30).tfy_TopSpaceToView(10, self.name_label).tfy_RightSpace(30).tfy_Height(40);
    
}

-(UIButton *)button{
    if (!_button) {
        _button = tfy_button();
        _button.tfy_title(@"选择指定人", @"3D4453", 16).tfy_action(self, @selector(btnClick)).tfy_backgroundColor(@"FAE158", 1).tfy_cornerRadius(10);
    }
    return _button;
}

-(UILabel *)name_label{
    if (!_name_label) {
        _name_label = tfy_label();
        _name_label.tfy_textcolor(@"3D4453", 1).tfy_fontSize(14).tfy_alignment(1).tfy_borders(1, @"5395DB");
    }
    return _name_label;
}

-(UILabel *)phone_label{
    if (!_phone_label) {
        _phone_label = tfy_label();
        _phone_label.tfy_textcolor(@"3D4453", 1).tfy_fontSize(14).tfy_alignment(1).tfy_borders(1, @"5395DB");
    }
    return _phone_label;
}

-(void)btnClick{
    [[TFY_ContactManager sharedInstance] selectContactAtController:self complection:^(NSString * _Nonnull name, NSString * _Nonnull phone) {
        
        self.name_label.tfy_text([NSString stringWithFormat:@"姓名:%@",name]);
        
        self.phone_label.tfy_text([NSString stringWithFormat:@"电话:%@",phone]);
    }];
}
@end
