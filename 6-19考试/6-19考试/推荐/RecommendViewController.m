//
//  RecommendViewController.m
//  6-19考试
//
//  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//

#import "RecommendViewController.h"
#import "DownViewController.h"
#define Image(name) [UIImage imageNamed:name]

@interface RecommendViewController () {
    
    NSMutableArray  *_imageNameList;
    NSMutableArray  *_imagePushList;
    NSMutableArray  *_textPush;
    NSTimer         *_timer;

}
- (void)initializeAppearance;
- (void)initializeDataSource;
- (void)buttonPress:(UIButton *)sender;

@end

@implementation RecommendViewController

- (void)viewWillAppear:(BOOL)animated {
    
    //计时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(blockAnimation) userInfo:nil repeats:YES];
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
    
        UITabBarItem *tab = [[UITabBarItem alloc] initWithTitle:@"推荐" image:Image(@"icon_menu_x_press") selectedImage:Image(@"icon_menu_x_selected")];
        self.tabBarItem = tab;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeDataSource];
    [self initializeAppearance];
}

- (void)initializeDataSource {
    _imageNameList = [[NSMutableArray alloc] init];
    _imageNameList = [@[@"theplace_coffee_logo", @"starbucks_coffee_logo", @"man_coffee_logo", @"winshare_logo", @"goodwoods_coffee_logo"] mutableCopy];
    
    _imagePushList = [@[@"theplace_coffee_detail", @"starbucks_coffee_detail", @"man_coffee_detail", @"goodwoods_coffee.detail", @"winshare_detail"] mutableCopy];
    
    _textPush = [@[@"推荐：theplace",
                   @"推荐：星巴克",
                   @"推荐：漫咖啡",
                   @"推荐：良木缘",
                   @"推荐：轩客会"] mutableCopy];
}

- (void)initializeAppearance {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.text = @"推荐";
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:22], NSFontAttributeName, nil]];
    
    //循环创建button
    for (int i = 0; i < 3 ; i++) {
        
        for (int j = 0; j < 2  ; j++) {
            
            if ((i == 2) && (j == 1)) {
                
                break;
            }
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            UIImage *image = [UIImage imageNamed:_imageNameList[i + j * 3]];
            
            [button setImage:image forState:UIControlStateNormal];
            
            button.bounds = CGRectMake(0, 0, 90, 90);
            
            button.center = CGPointMake((CGRectGetWidth(self.view.bounds) + 100) / 4  * (i + 1) - 50, (CGRectGetHeight(self.view.bounds) + 300)  / 8 * (j + 1 ) + 20);
            //button的点击事件
            [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
            //设置tag值
            button.tag = i + j * 3 + 100;
            
            [self.view addSubview:button];
        }
    }
    
}

- (void)buttonPress:(UIButton *)sender {
    
    DownViewController *dvc = [[DownViewController alloc] init];
    
    int index = (int)sender.tag - 100;
    //根据tag值给button加图片
    dvc.photoImageView.image = [UIImage imageNamed:_imagePushList[index]];
    
    //根据text文本获取文字
    NSString * str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_textPush[index] ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    
    dvc.textView.text = str;
    
    //页面推送
    [self.navigationController pushViewController:dvc animated:YES];
    
}

- (void)blockAnimation {
    
    static NSInteger i = 0;
    
    UIButton *button = (UIButton *)[self.view viewWithTag:100 + i % 5];
    
    //设置button旋转动画
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:button cache:YES];
        
    } completion:^(BOOL finished) {
        
    }];
    
    i++;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    //关闭计时器
    [_timer invalidate];
    _timer = nil;
    
}

@end
