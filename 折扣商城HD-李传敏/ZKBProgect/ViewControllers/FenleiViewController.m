//
//  FenleiViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-29.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "FenleiViewController.h"
#import "MyCenterViewController.h"
#import "GreatValueViewController.h"
//#import "MainTabBarController.h"
#import "RemenpindaoViewController.h"
#import "QingcangtemaiViewController.h"

#import "GengDuoTuiJianViewController.h"
@interface FenleiViewController ()

@property(nonatomic,strong)NSDictionary *dict;

@end

@implementation FenleiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadData];
    
    
    [self createView];
    
    
    
    // Do any additional setup after loading the view.
}


- (void)loadData
{
    HttpRequestBlock *block = [[HttpRequestBlock alloc]initWithUrlPath:REMENPINDAO Block:^(BOOL isSucceed, HttpRequestBlock *http) {
        
        if(isSucceed)
        {
            self.dataArray = [NSMutableArray arrayWithCapacity:0];
            
            self.dataArray1 = [NSMutableArray arrayWithCapacity:0];
            
            self.dataArray2 = [NSMutableArray arrayWithCapacity:0];
            
            self.dataArray = http.dataDic[@"data"];
            
            for(int i=0;i<self.dataArray.count;i++)
            {
                [self.dataArray1 addObject:self.dataArray[i][@"title"]];
                [self.dataArray2 addObject:self.dataArray[i][@"click_url"]];
            }
            
            
            [self createView];
            
        }
        
        
    }];
    
}




-(void)viewWillAppear:(BOOL)animated{
    
    //隐藏原生导航栏
    self.navigationController.navigationBarHidden= NO;
    //[self.navigationController setToolbarHidden:YES];
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    
}
- (void)createView
{
    
    UIImageView *bgimageView = [ZCControl createImageViewFrame:CGRectMake(0, 20, WIDTH, HEIGHT-20) imageName:[NSString stringWithFormat:@"ditu.png"]];
    [self.view addSubview:bgimageView];
    
    
    
    UIImageView *remenpindaoView = [ZCControl createImageViewFrame:CGRectMake(0, 30, 260, 35) imageName:[NSString stringWithFormat:@"heng.png"]];
    [bgimageView addSubview:remenpindaoView];
    UILabel *remenLabel = [ZCControl createLabelWithFrame:CGRectMake(10, 5, 200, 25) font:14 text:[NSString stringWithFormat:@"热门频道"]];
    [remenpindaoView addSubview:remenLabel];
    
    int m=0;
    NSArray *arrayColor =@[@"lv.png",@"huang.png",@"hong.png",@"zi.png"];
    //循环创建6个button
    for(int i=0;i<2;i++)
    {
        for(int j=0;j<3;j++)
        {
            
            UIImageView *starImageView = [ZCControl createImageViewFrame:CGRectMake(10+i*110, 80+j*30, 20, 20) imageName:arrayColor[j]];
            [bgimageView addSubview:starImageView];
            
            
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(30+i*110, 80+j*30,WIDTH/4-30, 20) title:self.dataArray1[m] imageName:nil bgImageName:nil target:self method:@selector(buttonClick:)];
            
            button.tag = 500+m;
            button.titleLabel.font = [UIFont fontWithName:nil size:12];
            button.titleLabel.textColor = [UIColor redColor];
            [bgimageView addSubview:button];
            m++;
            if(m>=self.dataArray.count)
            {
                break;
                
            }
        }
    }
    
    
    UIImageView *quanbuView = [ZCControl createImageViewFrame:CGRectMake(0, 170, 260, 35) imageName:[NSString stringWithFormat:@"heng.png"]];
    [bgimageView addSubview:quanbuView];
    
    UILabel *quanbuLabel = [ZCControl createLabelWithFrame:CGRectMake(10, 5, 200, 25) font:14 text:[NSString stringWithFormat:@"全部商品"]];
    [quanbuView addSubview:quanbuLabel];
    
    
    //循环创建11个button
    
    
    NSArray *array =@[@"left0.png",@"left1.png",@"left2.png",@"left3.png",@"left4.png",@"left5.png",@"left6.png",@"left7.png",@"left8.png",@"left9.png",@"left10.png"];
    
    
    int num=0;
    for(int i=0;i<4;i++)
    {
        for(int j=0;j<3;j++)
        {
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(0+j*87, 210+i*60, 87, 60) title:nil imageName:nil bgImageName:array[num] target:self method:@selector(buttonClick1:)];
            button.tag = 700+num;
            
            [bgimageView addSubview:button];
            num++;
            if(num>=11)
            {
                break;
                
            }
        }
    }
    
    
    //更多和设置
    
    UIButton *moreButton =[ZCControl createButtonWithFrame:CGRectMake(0, 450, 120, 45) title:nil imageName:nil bgImageName:[NSString stringWithFormat:@"gengduo.png"] target:self method:@selector(buttonClick2:)];
    [bgimageView addSubview:moreButton];
    
    UIButton *settingButton = [ZCControl createButtonWithFrame:CGRectMake(120, 450, 140, 45) title:nil imageName:nil bgImageName:[NSString stringWithFormat:@"shezhi.png"] target:self method:@selector(buttonClick3:)];
    [bgimageView addSubview:settingButton];
    
    
}

- (void)buttonClick3:(UIButton *)button
{
    //NSLog(@"设置");
    
    MainTabBarController *vc = [[MainTabBarController alloc]init];
    
    
    vc.selectedIndex = 4;
    
    vc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
}
- (void)buttonClick2:(UIButton *)button
{
    //更多推荐
    GengDuoTuiJianViewController *vc = [[GengDuoTuiJianViewController alloc]init];
    vc.title = @"更多推荐";
    vc.urlStr =@"http://cloud.yijia.com/yunying/applist.php?app_id=4249946504&app_oid=d1b8b082c01d4bb4&app_version=3.5.8&app_channel=91com";
    
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nc animated:YES completion:nil];
    
    
}

- (void)buttonClick1:(UIButton *)button
{
    //全部商品
    
    MainTabBarController *vc = [[MainTabBarController alloc]init];
    vc.selectedIndex = 0;
    
    _str = [NSString stringWithFormat:QUANBUSHANGPIN,button.tag-700];
    
    
    switch (button.tag-700) {
        case 0:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"全部",@"name",_str,@"dizhi",nil];
        }
            break;
        case 1:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"数码",@"name",_str,@"dizhi",nil];
            
        }
            break;
            
        case 2:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"女装",@"name",_str,@"dizhi",nil];
        }
            break;
            
        case 3:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"男装",@"name",_str,@"dizhi",nil];
        }
            break;
            
        case 4:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"家居",@"name",_str,@"dizhi",nil];
        }
            break;
            
        case 5:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"母婴",@"name",_str,@"dizhi",nil];
        }
            break;
            
        case 6:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"鞋包",@"name",_str,@"dizhi",nil];
        }
            break;
            
        case 7:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"配饰",@"name",_str,@"dizhi",nil];
        }
            break;
            
        case 8:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"美妆",@"name",_str,@"dizhi",nil];
        }
            break;
            
        case 9:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"美食",@"name",_str,@"dizhi",nil];
        }
            break;
            
        case 10:
        {
            self.dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"其他",@"name",_str,@"dizhi",nil];
        }
            break;
            
            
        default:
            break;
    }
    
    
    //创建通知
    NSNotification *notification = [NSNotification notificationWithName:@"tongzhi" object:nil userInfo:self.dict];
    
    //发送通知
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)buttonClick:(UIButton *)button
{
    
    if (button.tag-500==5) {
        
        // NSLog(@"%ld",button.tag-500);
        
        QingcangtemaiViewController *vc = [[QingcangtemaiViewController alloc]init];
        vc.urlstr = self.dataArray2[button.tag-500];
        
        vc.title = @"清仓特卖";
        
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        
        
        [self presentViewController:nc animated:YES completion:nil];
        
        
    }else{
        
        RemenpindaoViewController *vc = [[RemenpindaoViewController alloc]init];
        
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        
        vc.title = self.dataArray1[button.tag-500];
        vc.UrlStr = self.dataArray2[button.tag-500];
        
        [self presentViewController:nc animated:YES completion:nil];
        
        
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
