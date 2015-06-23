//
//  LogoView.m
//  6-19考试
//
//  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//

#import "LogoView.h"
#import <AVFoundation/AVFoundation.h>
#import "UserData.h"
#define COLOR [UIColor colorWithRed:152 / 255.0 green:45 / 255.0 blue:44 / 255.0 alpha:1]
@interface LogoView () <UITextFieldDelegate> {
    UserData *_userData;
    UITextField *_nameTextField;
    UITextField *_passwordTextField;
}

- (void)initializeAppearance;
- (void)initializeAudioPlayerWithName:(NSString *)musicName;

- (void)buttonPress:(UIButton *)sender;

@end

@implementation LogoView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeAppearance];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeAppearance];
    }
    return self;
}

- (void)initializeAppearance {

    self.backgroundColor = [UIColor whiteColor];
    
    //初始化单例
    _userData = [UserData shareInstance];
    
    //logo
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo3"]];
    logoView.bounds = CGRectMake(0, 0, 200, 180);
    logoView.center = CGPointMake(CGRectGetMaxX(self.bounds) / 2.0, 180);
    [self addSubview:logoView];
    
    //用户名输入框
    _nameTextField= [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    _nameTextField.center = CGPointMake(CGRectGetMaxX(self.bounds) /2.0, CGRectGetMidY(self.bounds) - 27);
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [_nameTextField setPlaceholder:@"请输入用户名"];
    _nameTextField.clearButtonMode = YES;
    _nameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _nameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _nameTextField.delegate = self;
    [self addSubview:_nameTextField];
    
    //密码输入框
     _passwordTextField= [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    _passwordTextField.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(_nameTextField.frame) + 50);
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    [_passwordTextField setPlaceholder:@"请输入密码"];
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.clearButtonMode = YES;
    _passwordTextField.delegate = self;
    [self addSubview:_passwordTextField];
    
    //登陆按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 300, 40);
    button.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(_passwordTextField.frame) + 40);
    button.backgroundColor = COLOR;
    button.layer.cornerRadius = 5;
    [button setTitle:@"登陆" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
}

//背景音乐播放方法
- (void)initializeAudioPlayerWithName:(NSString *)musicName {
    
    if (musicName == nil) {
        
        return;
    }
    NSURL *musicUrl = [[NSBundle mainBundle] URLForResource:musicName withExtension:@"mp3"];
    
    NSError *error = nil;
    
    _userData.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicUrl error:&error];
    
    _userData.audioPlayer.numberOfLoops = -1;
    
    [_userData.audioPlayer prepareToPlay];
    
    [_userData.audioPlayer play];
}

//登陆判断
- (void)buttonPress:(UIButton *)sender {
    
    if ([_nameTextField.text isEqual:@"admin"] && [_passwordTextField.text isEqual:@"123456"]) {
        
        _userData.name = _nameTextField.text;
        
        _userData.password = _passwordTextField.text;
        
        [self soundEffect:@"music_success.caf"];
        
        [UIView animateWithDuration:1 animations:^{
            self.alpha = 0;
            
        }];
    
        [self endEditing:YES];
        
        [self initializeAudioPlayerWithName:@"background"];

    }
    else {
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请输入用户名或密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [self addSubview:alerView];
        
        alerView.alertViewStyle = UIAlertViewStyleDefault;
        
        [alerView show];
        
        [self soundEffect:@"music_fail.mp3"];
        
        _userData.audioPlayer.numberOfLoops = 0;
        
    }
}

//音效方法
- (void)soundEffect:(NSString *)name {
    
    //获取url
    NSURL *url = [[NSBundle mainBundle] URLForAuxiliaryExecutable:name];
    //创建音乐ID
    SystemSoundID systemId = 0;
    //进行函数调用创建系统音乐ID
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &systemId);
    //进行音效播放
    AudioServicesPlaySystemSound(systemId);
}

//回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self endEditing:YES];
}

//实现return回收键盘
#pragma mark - <UITextFieldDelegate>

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}


@end
