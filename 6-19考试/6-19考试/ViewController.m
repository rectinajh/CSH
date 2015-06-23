//
//  ViewController.m
//  6-19考试
//
//  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//

#import "ViewController.h"
#import "HomePageViewController.h"
#import "RecommendViewController.h"
#import "ScenicSpotsViewController.h"
#import "PersonalCenterViewController.h"
#import "LogoView.h"
#define COLOR [UIColor colorWithRed:150 / 250.0 green:45 / 250.0 blue:45 / 250.0 alpha:1]



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建控制导航栏
    HomePageViewController *hvc = [[HomePageViewController alloc] init];
    UINavigationController *nhvc = [[UINavigationController alloc]initWithRootViewController:hvc];
    
    RecommendViewController *rvc = [[RecommendViewController alloc] init];
    UINavigationController *nrvc = [[UINavigationController alloc] initWithRootViewController:rvc];
    
    ScenicSpotsViewController *svc = [[ScenicSpotsViewController alloc] init];
    UINavigationController *nsvc = [[UINavigationController alloc] initWithRootViewController:svc];
    
    PersonalCenterViewController *pvc = [[PersonalCenterViewController alloc] init];
    UINavigationController *npvc = [[UINavigationController alloc] initWithRootViewController:pvc];
  
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    [self.view addSubview:tab.view];
    [self addChildViewController:tab];
    tab.viewControllers = @[nhvc, nrvc, nsvc, npvc];
    
    //配置标签栏
    tab.tabBar.barTintColor = COLOR;
    tab.tabBar.tintColor = [UIColor whiteColor];
    
    //配置导航栏
    [[UINavigationBar appearance] setBarTintColor:COLOR];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //添加到视图
    LogoView *lv = [[LogoView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:lv];

}



@end
