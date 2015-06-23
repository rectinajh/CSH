//
//  UserData.m
//  6-19考试
//
//  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//

//

#import "UserData.h"

static UserData *userData = nil;

@implementation UserData

+ (UserData *)shareInstance {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        userData = [[UserData alloc] init];
    });
    return userData;
}

@end
