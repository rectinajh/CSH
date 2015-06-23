//
//  PersonalCenterViewController.m
//  6-19考试
//
///  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//
//

#import "PersonalCenterViewController.h"
#import "UserData.h"

#define Image(name) [UIImage imageNamed:name]

#define COLOR [UIColor colorWithRed:150 / 255.0 green:45 / 255.0 blue:45 / 255.0 alpha:1]

@interface PersonalCenterViewController () {
    
    UserData *_userData;
}


- (void)initializeAppearance;

@end

@implementation PersonalCenterViewController

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        UITabBarItem *tab = [[UITabBarItem alloc] initWithTitle:@"更多" image:Image(@"icon_menu_ihave_press") selectedImage:Image(@"icon_menu_ihave_selected")];
        self.tabBarItem = tab;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeAppearance];
}

- (void)initializeAppearance {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化单例
    _userData = [UserData shareInstance];
    
    //导航栏文字
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.text = @"更多";
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:22], NSFontAttributeName, nil]];
    
    //logo
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo3"]];
    logoView.bounds = CGRectMake(0, 0, 200, 180);
    logoView.center = CGPointMake(CGRectGetMidX(self.view.bounds), 200);
    [self.view addSubview:logoView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, CGRectGetMidY(self.view.bounds) + 30, 60, 30)];
    nameLabel.text = @"账号:";
    [self.view addSubview:nameLabel];
    
    //用户名
    UILabel *nameLabelText = [[UILabel alloc] initWithFrame:CGRectMake(80 + 80, CGRectGetMidY(self.view.bounds) + 30, 60, 30)];
    nameLabelText.text = _userData.name;
    [self.view addSubview:nameLabelText];
   
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, CGRectGetMidY(self.view.bounds) + 80, 60, 30)];
    passwordLabel.text = @"密码:";
    [self.view addSubview:passwordLabel];
     //密码
    UILabel *passwordLabelText = [[UILabel alloc] initWithFrame:CGRectMake(80 + 80, CGRectGetMidY(self.view.bounds) + 80, 60, 30)];
    passwordLabelText.text = _userData.password;
    [self.view addSubview:passwordLabelText];
    
    UILabel *slierLabel = [[UILabel alloc] init];
    slierLabel.bounds = CGRectMake(0, 0, 100, 30);
    slierLabel.text = @"音量调节:";
    slierLabel.center = CGPointMake(95, CGRectGetMaxY(self.view.bounds) - 195);
    [self.view addSubview:slierLabel];
    
    //音量调节slider
    UISlider *musicSlider = [[UISlider alloc] init];
    musicSlider.bounds = CGRectMake(0, 0, 200, 30);
    musicSlider.center = CGPointMake( 230, CGRectGetMaxY(self.view.bounds) - 195);
    //slider初始化位置
    musicSlider.value = 0.5;
    musicSlider.minimumValue = 0;
    musicSlider.maximumValue = 1;
    //音乐初始音量
    _userData.audioPlayer.volume = 0.5;
    
    [musicSlider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:musicSlider];
    
    //版本信息
    UILabel *versionsLabel = [[UILabel alloc] init];
    versionsLabel.text = @"vision 1.0 by RIMI";
    versionsLabel.bounds = CGRectMake(0, 0, 150, 30);
    versionsLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) - 20);
    versionsLabel.textAlignment = NSTextAlignmentCenter;
    versionsLabel.textColor = [UIColor grayColor];
    [self.view addSubview:versionsLabel];
    
}

//调节slider的方法
- (void)sliderValueChange:(UISlider *)slider {
    
    _userData.audioPlayer.volume = slider.value;
    
}

@end
