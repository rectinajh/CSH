//
//  ScenicSpotsViewController.m
//  6-19考试
//
///  Created by cheng on 15/6/19.
//  Copyright (c) 2015年 cheng  All rights reserved.
//

#import "ScenicSpotsViewController.h"
#import "CustomTableViewCell.h"
#import "NextViewController.h"
#define Image(name) [UIImage imageNamed:name]
#define COLOR [UIColor colorWithRed:150 / 250.0 green:45 / 250.0 blue:45 / 255.0 alpha:1]
@interface ScenicSpotsViewController () <UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *_tableView;
    NSArray *_cellImage;
    NSArray *_cellName;
    NSArray *_cellNumber;
    NSArray *_cellAddress;
    NSArray *_pushImage;
    NSArray *_pushLabelText;
}

- (void)initializeAppearance;
- (void)initializeDataSource;


@end

static NSString *indefitier = @"XIBCell";

@implementation ScenicSpotsViewController
- (instancetype)init {
    
    self = [super init];
    if (self) {
       
        //标签栏配置
        UITabBarItem *tab = [[UITabBarItem alloc] initWithTitle:@"景点" image:Image(@"icon_menu_profile_press") selectedImage:Image(@"icon_menu_profile_selected")];
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
    
    _cellImage = @[@"宽窄巷子.jpg", @"杜甫草堂.jpg", @"欢乐谷.jpg", @"武侯祠.jpg", @"熊猫基地.jpg", @"锦里.jpg"];
    
    _cellName = @[@"宽窄巷子", @"杜甫草堂", @"欢乐谷", @"武侯祠", @"熊猫基地", @"锦里"];
    
    _cellNumber = @[@"028-0000-0000", @"028-0000-0001",@"028-0000-0002", @"028-0000-0003", @"028-0000-0003", @"028-0000-0004"];
    
    _cellAddress = @[@"成都市蜀都大道西端金河宾馆北面", @"成都市青华路38号，成都市外西草堂路", @"成都市金牛区西华大道16号", @"四川省成都市南门武侯祠大街", @"成都北郊斧头山" ,@"成都武侯祠大街中段"];
    
    _pushImage = @[@[@"宽窄巷子1.jpg",@"宽窄巷子2.jpg",@"宽窄巷子3.jpg"],
                    @[@"杜甫草堂1.jpg",@"杜甫草堂2.jpg",@"杜甫草堂3.jpg"],
                    @[@"欢乐谷1.jpg",@"欢乐谷2.jpg",@"欢乐谷3.jpg"],
                    @[@"武侯祠1.jpg",@"武侯祠2.jpg",@"武侯祠3.jpg"],
                    @[@"熊猫基地1.jpg",@"熊猫基地2.jpg",@"熊猫基地3.jpg"],
                    @[@"锦里1.jpg",@"锦里2.jpg",@"锦里3.jpg"]];
    
    _pushLabelText = @[@"“宽窄巷子”是成都市三大历史文化保护区之一，由宽巷子、窄巷子和井巷子三条平行排列的城市老式街道及其之间的四合院群落组成，于上世纪80年代列入《成都历史文化名城保护规划》。2008年6月，为期三年的宽窄巷子改造工程全面竣工。修葺一新的宽窄巷子由45个清末民初风格的四合院落、兼具艺术与文化底蕴的花园洋楼、新建的宅院式精品酒店等各具特色的建筑群落组成。",
                        @"成都杜甫草堂，是中国唐代大诗人杜甫流寓成都时的居所。公元759年冬天，杜甫为避 “安史之乱”，携家带口由陇右 (今甘肃省南部)入蜀辗转来到成都。次年春，在友人的帮助下，在成都西郊风景如画的浣花溪畔修建茅屋居住。第二年春天，茅屋落成，称 “成都草堂”。他的诗“万里桥西一草堂，百花潭水即沧浪”（《狂夫》）中提到的便是成都草堂。他在这里先后居住了将近四年，因曾被授“检校工部员外郎”之衔，而又被称做杜工部。765年，严武病逝，失去唯一依靠的杜甫只得携家带口告别成都，两年后经三峡流落荆、湘等地。",
                        @"成都欢乐谷主题公园（英文：Chengdu Happy Valley）是成都市文化产业重点项目和旅游产业重点项目。位于成都市金牛区西华大道16号，即北三环路一段与西华大道（交大路北延线）的交界处，距天府广场6.6公里，至成都市中心商务区（CBD）车行十余分钟，至成绵、成渝高速入口车行时间分别为15和20分钟。项目占地47万平方米。 园区由阳光港、欢乐时光、加勒比旋风、巴蜀迷情、飞行岛、魔幻城堡、飞跃地中海等七大主题区域组成，其中设置了130余项体验观赏项目，包括43项娱乐设备设施、58处人文生态景观、10项艺术表演、20项主题游戏和商业辅助性项目。",
                        @"武侯祠（汉昭烈庙）位于成都市武侯区，肇始于公元223年修建刘备惠陵时，它是中国唯一的一座君臣合祀祠庙和最负盛名的诸葛亮、刘备及蜀汉英雄纪念地，也是全国影响最大的三国遗迹博物馆。1961年国务院公布为首批全国重点文物保护单位，2008年评选为首批国家一级博物馆。成都武侯祠现占地15万平方米，由三国历史遗迹区（文物区）、西区（三国文化体验区）以及锦里民俗区（锦里）三部分组成，享有“三国圣地”的美誉。",
                        @"成都大熊猫繁育研究基地，是一个专门从事濒危野生动物研究、繁育、保护教育和教育旅游的非营利性机构。基地位于成都北郊斧头山，距市区10公里，有一条宽阔的熊猫大道与市区相连，大熊猫博物馆内珍贵的资料、丰富的展品举世无双，是认识大熊猫、回归大自然、观光旅游、休闲娱乐的极佳场所。四周翠竹葱笼，绿树成荫，花香鸟语，空气清新，山野风光和人工景观巧妙融合。大熊猫、小熊猫、黑颈鹤等珍稀濒危动物在这里悠然自得地生息繁衍。馆舍内、草坪上，大熊猫或卧或坐，或饮或嬉，或进或出，各得其所，令人陶醉。",
                        @"传说中锦里曾是西蜀历史上最古老、最具有商业气息的街道之一，早在秦汉、三国时期便闻名全国。现在，锦里占地30000余平方米，建筑面积14000余万平方米，街道全长550米，以明末清初川西民居作外衣，三国文化与成都民俗作内涵，集旅游购物、休闲娱乐为一体。"];
    
}

- (void)initializeAppearance {
    
    //导航栏文字
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.text = @"景点";
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:22], NSFontAttributeName, nil]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.rowHeight = 120;
    
    //设置数据源
    _tableView.dataSource = self;
    
    //设置代理
    _tableView.delegate = self;
    
    //注册
    [_tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:indefitier];
    
    [self.view addSubview:_tableView];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _cellImage.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indefitier forIndexPath:indexPath];
    cell.upLabel.tintColor = COLOR;
    cell.centrnLabel.tintColor = [UIColor blackColor];
    
    cell.image.image = [UIImage imageNamed:_cellImage[indexPath.row]];
    cell.upLabel.text = _cellName[indexPath.row];
    cell.centrnLabel.text = _cellNumber[indexPath.row];
    cell.downLabel.text = _cellAddress[indexPath.row];

    return cell;
}

#pragma mark - <UITableViewDelegate>

//行选中事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NextViewController *nvc = [[NextViewController alloc] init];
    
    nvc.imageList = _pushImage[indexPath.row];
    
    nvc.textView = [[UITextView alloc] init];
    
    nvc.textView.text = _pushLabelText[indexPath.row];
    
    nvc.titleString = _cellName[indexPath.row];
    
    [self.navigationController pushViewController:nvc animated:YES];

}

@end
