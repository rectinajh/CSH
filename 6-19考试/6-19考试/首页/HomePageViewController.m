//
//  HomePageViewController.m
//  6-19考试
//
///  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//


#import "HomePageViewController.h"

#define Image(name) [UIImage imageNamed:name]

#define COLOR [UIColor colorWithRed:150 / 255.0 green:45 / 250.0 blue:45 / 250.0 alpha:1]

#define TEXT_ONE @"       成都，简称“蓉”，四川省省会，副省级市，国家区域中心城市（西南），1993年被国务院确定为西南地区的科技、商贸、金融中心和交通及通信枢纽，综合实力西部第一。"
#define TEXT_TWO @"       成都位于中国华西地区东部，西南地区最大平原——成都平原腹地，境内地势平坦、河网纵横、物产丰富、水系发达，自古就有“天府之国”的美誉，是国家首批历史文化名城和中国最佳旅游城市。"
#define TEXT_THERE @"       成都有着4500余年的文明史，2600年左右的建城史。三国蜀汉、五代前后蜀及北宋李顺、明末张献忠大西等割据政权先后在此建都，唐朝和中华民国时曾作为临时首都而存在。早在北宋年间成都人联合发行了世界最早的纸币“交子”，官府在成都设立了世界最早的管理储蓄银行“交子务”。"

@interface HomePageViewController () {
    
    UIScrollView *_scrollView;
    UIImageView *_rollImageView;
    NSArray *_imageNameList;
    NSTimer *_timer;
}

- (void)initializeAppearance;
- (void)initializeDataSource;

@end

@implementation HomePageViewController
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        //配置标签
        UITabBarItem *tab = [[UITabBarItem alloc] initWithTitle:@"乐行于蜀" image:Image(@"icon_menu_hp_press") selectedImage:Image(@"icon_menu_hp_selected")];
        
        self.tabBarItem = tab;
    }
    return self;
}


- (void)viewDidAppear:(BOOL)animated {
    
    //计时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeDataSource];
    [self initializeAppearance];
}

- (void)initializeDataSource {
    
  //图片数组
    _imageNameList = @[@"首页1", @"首页2", @"首页3"];
}

- (void)initializeAppearance {
    
    //配置导航栏文字
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.text = @"乐行于蜀";
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:22], NSFontAttributeName, nil]];
    
    //创建滚动视图
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    
    _scrollView.backgroundColor = [UIColor whiteColor];
    // 滚动视图的大小
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 1155);
    
    [self.view addSubview:_scrollView];
    
#pragma 滚动图片
    
    _rollImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.view.bounds) - 10, 200)];
    
    _rollImageView.backgroundColor = [UIColor cyanColor];
    
    _rollImageView.image = [UIImage imageNamed:_imageNameList[0]];
    
    [_scrollView addSubview:_rollImageView];
    
    
#pragma 固定滚动
    //0. 上面label
    UILabel *upLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_rollImageView.frame) + 20, CGRectGetWidth(self.view.bounds) - 20, 50)];
    //1. 设置label文字
    upLabel.text = TEXT_ONE;
    //2. 设置label行数
    upLabel.numberOfLines = 0;
    //3. 自适应大小
    [upLabel sizeToFit];
    upLabel.font = [UIFont systemFontOfSize:15];
    //4. 添加到视图
    [_scrollView addSubview:upLabel];
    
    //上面图片
    UIImageView *upImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(upLabel.frame), CGRectGetWidth(self.view.bounds) - 10, 200)];
    [upImageView  setImage:[UIImage imageNamed:@"首页1"]];
    [_scrollView addSubview:upImageView];
    
    //中间label
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(upImageView.frame), CGRectGetWidth(self.view.bounds) - 20, 50)];
    centerLabel.text = TEXT_TWO;
    centerLabel.numberOfLines = 0;
    [centerLabel sizeToFit];
    centerLabel.font = [UIFont systemFontOfSize:15];
    [_scrollView addSubview:centerLabel];
    
    //中间图片
    UIImageView *centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(centerLabel.frame), CGRectGetWidth(self.view.bounds) - 10, 200)];
    [centerImageView  setImage:[UIImage imageNamed:@"首页2"]];
    [_scrollView addSubview:centerImageView];
    
    //下面label
    UILabel *downLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(centerImageView.frame), CGRectGetWidth(self.view.bounds) - 20, 50)];
    downLabel.text = TEXT_THERE;
    downLabel.numberOfLines = 0;
    [downLabel sizeToFit];
    downLabel.font = [UIFont systemFontOfSize:15];
    [_scrollView addSubview:downLabel];
 
    //下面图片
    UIImageView * downImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(downLabel.frame), CGRectGetWidth(self.view.bounds) - 10, 200)];
    [downImageView  setImage:[UIImage imageNamed:@"首页3"]];
    [_scrollView addSubview:downImageView];
    
}


- (void)changeImage {
    
    static int i = 0;
    
    UIImage *image = [UIImage imageNamed:_imageNameList[i % 3]];
    
    _rollImageView.image = image;
    
    i++;
}

//视图消失的时候
- (void)viewDidDisappear:(BOOL)animated {
    
    [_timer invalidate];
    
    _timer = nil;

}

@end
