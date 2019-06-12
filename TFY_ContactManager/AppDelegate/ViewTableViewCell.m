//
//  ViewTableViewCell.m
//  TFY_ContactManager
//
//  Created by 田风有 on 2019/6/12.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "ViewTableViewCell.h"

@interface ViewTableViewCell ()
@property(nonatomic , strong)UIView *back_View;
@property(nonatomic , strong)UILabel *title_label;
@property(nonatomic , strong)UIImageView *icon_imageView;
@end

@implementation ViewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
       
        
        [self.contentView addSubview:self.back_View];
        self.back_View.tfy_LeftSpace(20).tfy_TopSpace(10).tfy_RightSpace(20).tfy_BottomSpace(10);
        
        [self.back_View addSubview:self.title_label];
        self.title_label.tfy_LeftSpace(20).tfy_RightSpace(50).tfy_TopSpace(0).tfy_BottomSpace(0);
        
        [self.back_View addSubview:self.icon_imageView];
        self.icon_imageView.tfy_RightSpace(20).tfy_CenterY(0).tfy_size(6, 10);
    }
    return self;
}

-(void)setName_string:(NSString *)name_string{
    _name_string = name_string;
    
    self.title_label.tfy_text(_name_string);
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
        _icon_imageView = tfy_imageView().tfy_imge(@"jiantou");
    }
    return _icon_imageView;
}

-(UILabel *)title_label{
    if (!_title_label) {
        _title_label = tfy_label().tfy_textcolor(@"212121",1).tfy_fontSize(15).tfy_alignment(0);
    }
    return _title_label;
}


@end
