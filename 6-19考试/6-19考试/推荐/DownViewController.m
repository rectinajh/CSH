//
//  DownViewController.m
//  6-19考试
//
//  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//

#import "DownViewController.h"

@interface DownViewController ()

@end

@implementation DownViewController
- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.title = @"详情";
        
        _photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, CGRectGetMaxX(self.view.bounds) - 10, CGRectGetMidY(self.view.bounds))];
        [self.view addSubview:_photoImageView];
        
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_photoImageView.frame), CGRectGetMaxX(self.view.bounds) - 10, 280)];
        
        _textView.editable = NO;
        
        _textView.font = [UIFont systemFontOfSize:17];
        
        [self.view addSubview:_textView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = [UIColor whiteColor];
}

@end
