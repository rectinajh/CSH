//
//  UserData.h
//  6-19考试
//
//  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface UserData : NSObject


@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *password;



+ (UserData *)shareInstance;


@end
