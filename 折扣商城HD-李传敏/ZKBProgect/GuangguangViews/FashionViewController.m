//
//  FashionViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-27.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "FashionViewController.h"
#import "DetailFashionViewController.h"

@interface FashionViewController ()

@property(nonatomic,strong)NSMutableArray *dataArray1;
@property(nonatomic,strong)NSMutableArray *dataArray2;
@property(nonatomic,assign)NSInteger num1;
@property(nonatomic,assign)NSInteger num2;

@property(nonatomic,strong)NSString *url;

@end

@implementation FashionViewController

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
    
    
    [self createNav];
    
    [self createView];

    
    
    // Do any additional setup after loading the view.
}

- (void)loadData
{
    HttpRequestBlock *block= [[HttpRequestBlock alloc]initWithUrlPath:_UrlStr Block:^(BOOL isSucceed, HttpRequestBlock *http) {
       if(isSucceed)
       {
           self.dataArray1 = [NSMutableArray arrayWithCapacity:0];
           self.dataArray2 = [NSMutableArray arrayWithCapacity:0];
           
           self.dataArray1 = http.dataArray[0][@"list"];
           self.dataArray2 = http.dataArray[1][@"list"];
           self.num1 = self.dataArray1.count;
           self.num2 = self.dataArray2.count;
           
           [self createView];
           
       }
      
        
    }];
}

- (void)createView
{
    //背景
    UIImageView *bgImageView = [ZCControl createImageViewFrame:CGRectMake(0, 0, WIDTH, HEIGHT) imageName:[NSString stringWithFormat:@"ditu.png"]];
    [self.view addSubview:bgImageView];
    
    //今日
    UILabel *jinriLabel = [ZCControl createLabelWithFrame:CGRectMake(15, 40, WIDTH-20, 20) font:15 text:@"今日关注上升"];
    jinriLabel.font = [UIFont boldSystemFontOfSize:15];
    
    [bgImageView addSubview:jinriLabel];
    
    int i=0;
    
    for(int j=0;j<4;j++)
        {
            for(int k=0;k<3;k++)
            {
                UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(20+k*90, 70+j*40, 85, 30) title:self.dataArray1[i][0] imageName:nil bgImageName:[NSString stringWithFormat:@"ciditu.png"] target:self method:@selector(buttonClick1:)];
                button.tag = 1000+i;
                button.titleLabel.font = [UIFont fontWithName:nil size:12];
                button.titleLabel.textColor =[UIColor purpleColor];
                
                [bgImageView addSubview:button];
                i++;
                if(i>=self.dataArray1.count)
                {
                    break;
                    
                }
            }
        }
    
    //一周
    UILabel *yizhouLabel = [ZCControl createLabelWithFrame:CGRectMake(15, 235, WIDTH-20, 20) font:15 text:@"一周关注热门"];
    yizhouLabel.font = [UIFont boldSystemFontOfSize:15];
    
    [bgImageView addSubview:yizhouLabel];
    
    
    int m=0;
    for(int j=0;j<4;j++)
    {
        for(int k=0;k<3;k++)
        {
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(20+k*90, 265+j*40, 85, 30) title:self.dataArray2[m][0] imageName:nil bgImageName:[NSString stringWithFormat:@"ciditu.png"] target:self method:@selector(buttonClick1:)];
            button.tag = 2000+m;
            button.titleLabel.font = [UIFont fontWithName:nil size:12];
            button.titleLabel.textColor = [UIColor purpleColor];
            
            [bgImageView addSubview:button];
            m++;
            if(m>=self.dataArray2.count)
            {
                break;
                
            }
        }
    }
    
}
- (void)buttonClick1:(UIButton *)button
{
   // NSLog(@"%ld",button.tag);
    
    if (button.tag<2000) {
        
        self.url = [NSString stringWithFormat:DETAILFASHION,self.dataArray1[button.tag-1000][1]];
        
    }else{
        self.url =[NSString stringWithFormat:DETAILFASHION,self.dataArray2[button.tag-2000][1]];

    }

    DetailFashionViewController *vc = [[DetailFashionViewController alloc]init];
    vc.UrlStr = self.url;
    vc.title = @"搜索";
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)createNav
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 40, 40);
    
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
}

- (void)buttonClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
