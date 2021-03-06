//
//  AddressBookTableViewCell.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "AddressBookTableViewCell.h"

@interface AddressBookTableViewCell ()
@property(nonatomic , strong)UIView *back_View;

@property(nonatomic , strong)UIImageView *icon_imageView;

@property(nonatomic , strong)UILabel *name_label;

@property(nonatomic , strong)UILabel *phone_label;
@end

@implementation AddressBookTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.back_View];
        self.back_View.tfy_LeftSpace(20).tfy_TopSpace(10).tfy_RightSpace(20).tfy_BottomSpace(10);
        
        [self.back_View addSubview:self.icon_imageView];
        self.icon_imageView.tfy_size(50, 50).tfy_CenterY(0).tfy_LeftSpace(20);
        
        [self.back_View addSubview:self.name_label];
        self.name_label.tfy_LeftSpaceToView(10, self.icon_imageView).tfy_TopSpace(0).tfy_RightSpace(20).tfy_Height(25);
        
        [self.back_View addSubview:self.phone_label];
        self.phone_label.tfy_LeftSpaceToView(10, self.icon_imageView).tfy_RightSpace(20).tfy_TopSpaceToView(0, self.name_label).tfy_BottomSpace(0);
        
    }
    return self;
}

-(void)setModel:(TFY_PersonModel *)model{
    _model = model;
    
    self.name_label.makeChain.text(_model.fullName);
    
    TFY_Phone *phone = _model.phones.firstObject;
    
    self.phone_label.makeChain.text(phone.phone);
}

-(UIView *)back_View{
    if (!_back_View) {
        _back_View = [UIView new];
        _back_View.backgroundColor = [UIColor whiteColor];
        _back_View.layer.shadowOffset = CGSizeMake(0, 0);
        _back_View.layer.shadowRadius = 5;
        _back_View.layer.shadowOpacity = 0.3;
        _back_View.layer.shadowColor = [UIColor blackColor].CGColor;
        _back_View.layer.cornerRadius = 15;
    }
    return _back_View;
}

-(UIImageView *)icon_imageView{
    if (!_icon_imageView) {
        _icon_imageView = UIImageViewSet();
        _icon_imageView.makeChain
        .image([UIImage imageNamed:@"touxiang"]);
    }
    return _icon_imageView;
}

-(UILabel *)name_label{
    if (!_name_label) {
        _name_label = UILabelSet();
        _name_label.makeChain
        .textColor([UIColor tfy_colorWithHex:@"212121"])
        .textAlignment(NSTextAlignmentCenter)
        .font([UIFont systemFontOfSize:15]);
    }
    return _name_label;
}

-(UILabel *)phone_label{
    if (!_phone_label) {
        _phone_label = UILabelSet();
        _phone_label.makeChain
        .textColor([UIColor tfy_colorWithHex:@"212121"])
        .textAlignment(NSTextAlignmentCenter)
        .font([UIFont systemFontOfSize:15]);
    }
    return _phone_label;
}
@end
