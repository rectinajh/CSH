//
//  CustomTableViewCell.h
//  6-19考试
//
//  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *upLabel;

@property (weak, nonatomic) IBOutlet UILabel *centrnLabel;

@property (weak, nonatomic) IBOutlet UILabel *downLabel;



@end
