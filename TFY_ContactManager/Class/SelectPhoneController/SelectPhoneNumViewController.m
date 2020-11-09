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
        _button = UIButtonSet();
        _button.makeChain
        .text(@"选择指定人", UIControlStateNormal)
        .textColor([UIColor tfy_colorWithHex:@"3D4453"], UIControlStateNormal)
        .font([UIFont systemFontOfSize:16])
        .addTarget(self, @selector(btnClick), UIControlEventTouchUpInside)
        .backgroundColor([UIColor tfy_colorWithHex:@"FAE158"])
        .cornerRadius(10);
    }
    return _button;
}

-(UILabel *)name_label{
    if (!_name_label) {
        _name_label = UILabelSet();
        _name_label.makeChain
        .textColor([UIColor tfy_colorWithHex:@"3D4453"])
        .font([UIFont systemFontOfSize:14])
        .textAlignment(NSTextAlignmentLeft)
        .border(1, [UIColor tfy_colorWithHex:@"5395DB"]);
    }
    return _name_label;
}

-(UILabel *)phone_label{
    if (!_phone_label) {
        _phone_label = UILabelSet();
        _phone_label.makeChain
        .textColor([UIColor tfy_colorWithHex:@"3D4453"])
        .font([UIFont systemFontOfSize:14])
        .textAlignment(NSTextAlignmentLeft)
        .border(1, [UIColor tfy_colorWithHex:@"5395DB"]);
    }
    return _phone_label;
}

-(void)btnClick{
    [[TFY_ContactManager sharedInstance] selectContactAtController:self complection:^(NSString * _Nonnull name, NSString * _Nonnull phone) {
        
        self.name_label.makeChain.text([NSString stringWithFormat:@"姓名:%@",name]);
        
        self.phone_label.makeChain.text([NSString stringWithFormat:@"电话:%@",phone]);
    }];
}
@end
