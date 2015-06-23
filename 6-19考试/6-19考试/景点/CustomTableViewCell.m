//
//  CustomTableViewCell.m
//  6-19考试
//
//  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    //设置图片阴影
    _image.layer.shadowColor = [UIColor grayColor].CGColor;
    _image.layer.shadowOffset = CGSizeMake(2, 2);
    _image.layer.shadowOpacity = 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
