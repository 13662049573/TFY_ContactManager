//
//  ContactTableViewCell.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "ContactTableViewCell.h"

@interface ContactTableViewCell ()
@property(nonatomic , strong)UIView *back_View;
@property (strong, nonatomic)UIImageView *iconImageV;
@property (strong, nonatomic)UILabel *nameLabel;
@property (strong, nonatomic)UILabel *phoneNumLabel;
@end

@implementation ContactTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.back_View];
        self.back_View.tfy_LeftSpace(20).tfy_TopSpace(10).tfy_RightSpace(20).tfy_BottomSpace(10);
        
        [self.back_View addSubview:self.iconImageV];
        self.iconImageV.tfy_LeftSpace(20).tfy_CenterY(0).tfy_size(50, 50);
        
        [self.back_View addSubview:self.nameLabel];
        self.nameLabel.tfy_LeftSpaceToView(10, self.iconImageV).tfy_TopSpace(0).tfy_RightSpace(20).tfy_Height(30);
        
        [self.back_View addSubview:self.phoneNumLabel];
        self.phoneNumLabel.tfy_LeftSpaceToView(10, self.iconImageV).tfy_TopSpaceToView(0, self.nameLabel).tfy_RightSpace(20).tfy_BottomSpace(0);
        
    }
    return self;
}

-(void)setModel:(TFY_PersonModel *)model{
    _model = model;
    
    self.iconImageV.image = _model.image ? model.image : [[UIImage imageNamed:@"touxiang"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.nameLabel.makeChain.text(_model.fullName);
    
    TFY_Phone *phone = _model.phones.firstObject;
    
    self.phoneNumLabel.makeChain.text(phone.phone);
}

-(UIView *)back_View{
    if (!_back_View) {
        _back_View = [UIView new];
        _back_View.backgroundColor = [UIColor cyanColor];
        _back_View.layer.shadowOffset = CGSizeMake(0, 0);
        _back_View.layer.shadowRadius = 5;
        _back_View.layer.shadowOpacity = 0.3;
        _back_View.layer.shadowColor = [UIColor blackColor].CGColor;
        _back_View.layer.cornerRadius = 15;
    }
    return _back_View;
}

-(UIImageView *)iconImageV{
    if (!_iconImageV) {
        _iconImageV = UIImageViewSet();
        _iconImageV.makeChain.cornerRadius(25);
    }
    return _iconImageV;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = UILabelSet();
        _nameLabel.makeChain.textColor([UIColor tfy_colorWithHex:@"212121"])
        .textAlignment(NSTextAlignmentCenter)
        .font([UIFont systemFontOfSize:15]);
    }
    return _nameLabel;
}

-(UILabel *)phoneNumLabel{
    if (!_phoneNumLabel) {
        _phoneNumLabel = UILabelSet();
        _phoneNumLabel.makeChain
        .textColor([UIColor tfy_colorWithHex:@"212121"])
        .font([UIFont systemFontOfSize:14])
        .textAlignment(NSTextAlignmentCenter);
    }
    return _phoneNumLabel;
}
@end
