//
//  HotViewController.m
//  ZKBProgect
//
//  Created by qianfeng on 15-1-26.
//  Copyright (c) 2015年 lichuanmin. All rights reserved.
//

#import "HotViewController.h"

#import "DetailHotViewController.h"

#import "UIButton+WebCache.h"
@interface HotViewController ()
{
    UIScrollView *sc;
}


@property(nonatomic,strong)NSMutableArray *dataArray1;
@property(nonatomic,strong)NSMutableArray *dataArray2;
@property(nonatomic,strong)NSMutableArray *dataArray3;
@property(nonatomic,strong)NSMutableArray *dataArray4;
@property(nonatomic,strong)NSMutableArray *dataArray5;
@property(nonatomic,strong)NSMutableArray *dataArray6;
@property(nonatomic,strong)NSMutableArray *dataArray7;

@end

@implementation HotViewController

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
    
    [self createNav];
    
    
    [self loadData];
    
    
    // Do any additional setup after loading the view.
}

- (void)loadData
{
    HttpRequestBlock *block = [[HttpRequestBlock alloc]initWithUrlPath:_UrlStr Block:^(BOOL isSucceed, HttpRequestBlock *http) {
        if(isSucceed)
        {
            self.dataArray1 = [NSMutableArray arrayWithCapacity:0];
            self.dataArray2 = [NSMutableArray arrayWithCapacity:0];
            self.dataArray3 = [NSMutableArray arrayWithCapacity:0];
            self.dataArray4 = [NSMutableArray arrayWithCapacity:0];
            self.dataArray5 = [NSMutableArray arrayWithCapacity:0];
            self.dataArray6 = [NSMutableArray arrayWithCapacity:0];
            
            self.dataArray7 = [NSMutableArray arrayWithCapacity:0];
            
            
            
            
            self.dataArray1 = http.dataDic[@"女人街"];
            
            self.dataArray2 = http.dataDic[@"居家屋"];
            self.dataArray3 = http.dataDic[@"母婴坊"];
            self.dataArray4 = http.dataDic[@"电器城"];
            self.dataArray5 = http.dataDic[@"男人装"];
            self.dataArray6 = http.dataDic[@"美容院"];
            self.dataArray7 = http.dataDic[@"零食店"];
            
            
        [self makeUI];

        }
        
    }];
    
    
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


- (void)makeUI
{
    sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    sc.contentSize = CGSizeMake(WIDTH,WIDTH*4-40);
    
    //关闭反弹属性
    sc.bounces = NO;
    
    sc.showsHorizontalScrollIndicator = NO;
   // sc.showsVerticalScrollIndicator = NO;
    
    sc.backgroundColor = [UIColor whiteColor];
    
    //sc.delegate = self;
    [self.view addSubview:sc];
    
    
//女人街
    UIImageView *biaotiView1 = [ZCControl createImageViewFrame:CGRectMake(0, 0, WIDTH, 34) imageName:@"tiao.png"];
    [sc addSubview:biaotiView1];
    
    UILabel *biaotiLabel1 = [ZCControl createLabelWithFrame:CGRectMake(10, 3, 100, 25) font:15 text:@"女人街"];
    [biaotiView1 addSubview:biaotiLabel1];
    
    
    int i1=0;
    
    for(int j=0;j<6;j++)
    {
        for(int k=0;k<3;k++)
        {
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(20+k*90, 50+j*40, 85, 30) title:self.dataArray1[i1][@"name"] imageName:nil bgImageName:[NSString stringWithFormat:@"ciditu.png"] target:self method:@selector(buttonClick1:)];
            button.tag = 1000+i1;
            button.titleLabel.font = [UIFont fontWithName:nil size:12];
            button.titleLabel.textColor =[UIColor purpleColor];
            
            [sc addSubview:button];
            i1++;
            if(i1>=self.dataArray1.count)
            {
                break;
                
            }
        }
    }

    
//男人装
    UIImageView *biaotiView5 = [ZCControl createImageViewFrame:CGRectMake(0, 300, WIDTH, 34) imageName:@"tiao.png"];
    [sc addSubview:biaotiView5];
    
    UILabel *biaotiLabel5 = [ZCControl createLabelWithFrame:CGRectMake(10, 3, 100, 25) font:15 text:@"男人装"];
    [biaotiView5 addSubview:biaotiLabel5];

    
    int i5=0;
    
    for(int j=0;j<5;j++)
    {
        for(int k=0;k<3;k++)
        {
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(20+k*90, 350+j*40, 85, 30) title:self.dataArray5[i5][@"name"] imageName:nil bgImageName:[NSString stringWithFormat:@"ciditu.png"] target:self method:@selector(buttonClick1:)];
            button.tag = 2000+i5;
            button.titleLabel.font = [UIFont fontWithName:nil size:12];
            button.titleLabel.textColor =[UIColor purpleColor];
            
            [sc addSubview:button];
            i5++;
            if(i5>=self.dataArray5.count)
            {
                break;
                
            }
        }
    }

    
//美容院
    UIImageView *biaotiView6 = [ZCControl createImageViewFrame:CGRectMake(0, 556, WIDTH, 34) imageName:@"tiao.png"];
    [sc addSubview:biaotiView6];
    
    UILabel *biaotiLabel6 = [ZCControl createLabelWithFrame:CGRectMake(10, 3, 100, 25) font:15 text:@"美容院"];
    [biaotiView6 addSubview:biaotiLabel6];
    
    
    int i6=0;
    
    for(int j=0;j<2;j++)
    {
        for(int k=0;k<3;k++)
        {
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(20+k*90, 600+j*40, 85, 30) title:self.dataArray6[i6][@"name"] imageName:nil bgImageName:[NSString stringWithFormat:@"ciditu.png"] target:self method:@selector(buttonClick1:)];
            button.tag = 3000+i6;
            button.titleLabel.font = [UIFont fontWithName:nil size:12];
            button.titleLabel.textColor =[UIColor purpleColor];
            
            [sc addSubview:button];
            i6++;
            if(i6>=self.dataArray6.count)
            {
                break;
                
            }
        }
    }

    
//零食店
    UIImageView *biaotiView7 = [ZCControl createImageViewFrame:CGRectMake(0, 686, WIDTH, 34) imageName:@"tiao.png"];
    [sc addSubview:biaotiView7];
    
    UILabel *biaotiLabel7 = [ZCControl createLabelWithFrame:CGRectMake(10, 3, 100, 25) font:15 text:@"零食店"];
    [biaotiView7 addSubview:biaotiLabel7];
    
    
    int i7=0;
    
    for(int j=0;j<1;j++)
    {
        for(int k=0;k<3;k++)
        {
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(20+k*90, 730+j*40, 85, 30) title:self.dataArray7[i7][@"name"] imageName:nil bgImageName:[NSString stringWithFormat:@"ciditu.png"] target:self method:@selector(buttonClick1:)];
            button.tag = 4000+i7;
            button.titleLabel.font = [UIFont fontWithName:nil size:12];
            button.titleLabel.textColor =[UIColor purpleColor];
            
            [sc addSubview:button];
            i7++;
            if(i7>=self.dataArray7.count)
            {
                break;
                
            }
        }
    }
//母婴坊
    UIImageView *biaotiView3 = [ZCControl createImageViewFrame:CGRectMake(0, 776, WIDTH, 34) imageName:@"tiao.png"];
    [sc addSubview:biaotiView3];
    
    UILabel *biaotiLabel3 = [ZCControl createLabelWithFrame:CGRectMake(10, 3, 100, 25) font:15 text:@"母婴坊"];
    [biaotiView3 addSubview:biaotiLabel3];
    
    
    int i3=0;
    
    for(int j=0;j<2;j++)
    {
        for(int k=0;k<3;k++)
        {
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(20+k*90, 820+j*40, 85, 30) title:self.dataArray3[i3][@"name"] imageName:nil bgImageName:[NSString stringWithFormat:@"ciditu.png"] target:self method:@selector(buttonClick1:)];
            button.tag = 5000+i3;
            button.titleLabel.font = [UIFont fontWithName:nil size:12];
            button.titleLabel.textColor =[UIColor purpleColor];
            
            [sc addSubview:button];
            i3++;
            if(i3>=self.dataArray3.count)
            {
                break;
                
            }
        }
    }

//电器城
    UIImageView *biaotiView4 = [ZCControl createImageViewFrame:CGRectMake(0, 906, WIDTH, 34) imageName:@"tiao.png"];
    [sc addSubview:biaotiView4];
    
    UILabel *biaotiLabel4 = [ZCControl createLabelWithFrame:CGRectMake(10, 3, 100, 25) font:15 text:@"电器城"];
    [biaotiView4 addSubview:biaotiLabel4];
    
    
    int i4=0;
    
    for(int j=0;j<2;j++)
    {
        for(int k=0;k<3;k++)
        {
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(20+k*90, 950+j*40, 85, 30) title:self.dataArray4[i4][@"name"] imageName:nil bgImageName:[NSString stringWithFormat:@"ciditu.png"] target:self method:@selector(buttonClick1:)];
            button.tag = 6000+i4;
            button.titleLabel.font = [UIFont fontWithName:nil size:12];
            button.titleLabel.textColor =[UIColor purpleColor];
            
            [sc addSubview:button];
            i4++;
            if(i4>=self.dataArray4.count)
            {
                break;
                
            }
        }
    }
    
//居家屋
    UIImageView *biaotiView2 = [ZCControl createImageViewFrame:CGRectMake(0, 1036, WIDTH, 34) imageName:@"tiao.png"];
    [sc addSubview:biaotiView2];
    
    UILabel *biaotiLabel2 = [ZCControl createLabelWithFrame:CGRectMake(10, 3, 100, 25) font:15 text:@"居家屋"];
    [biaotiView2 addSubview:biaotiLabel2];
    
    
    int i2=0;
    
    for(int j=0;j<1;j++)
    {
        for(int k=0;k<3;k++)
        {
            UIButton *button = [ZCControl createButtonWithFrame:CGRectMake(20+k*90, 1080+j*40, 85, 30) title:self.dataArray2[i2][@"name"] imageName:nil bgImageName:[NSString stringWithFormat:@"ciditu.png"] target:self method:@selector(buttonClick1:)];
            button.tag = 7000+i2;
            button.titleLabel.font = [UIFont fontWithName:nil size:12];
            button.titleLabel.textColor =[UIColor purpleColor];
            
            [sc addSubview:button];
            i2++;
            if(i2>=self.dataArray2.count)
            {
                break;
                
            }
        }
    }

}

-(void)buttonClick1:(UIButton *)button
{
    NSInteger index = button.tag/1000;
   // NSLog(@"%ld",index);
    
   DetailHotViewController *vc = [[DetailHotViewController alloc]init];

    
    switch (index) {
        case 1:
        {
            //vc.UrlStr = [NSString stringWithFormat:REMENFENLEIDETAIL,self.dataArray1[button.tag-1000][@"cid"],0,@""];
            
            
            vc.UrlStr = REMENFENLEIDETAIL;
            
            vc.num = self.dataArray1[button.tag-1000][@"cid"];
            
            
            vc.title = self.dataArray1[button.tag-1000][@"name"];
        }
            break;
           
        case 2:
        {
            vc.UrlStr = REMENFENLEIDETAIL;
            vc.num = self.dataArray5[button.tag-2000][@"cid"];
            
            vc.title = self.dataArray5[button.tag-2000][@"name"];
        }
            break;
        case 3:
        {
            vc.UrlStr = REMENFENLEIDETAIL;
            
            vc.num = self.dataArray6[button.tag-3000][@"cid"];
            
            vc.title = self.dataArray6[button.tag-3000][@"name"];
        }
            break;
        case 4:
        {
            vc.UrlStr = REMENFENLEIDETAIL;

            vc.num = self.dataArray7[button.tag-4000][@"cid"];
            
            vc.title = self.dataArray7[button.tag-4000][@"name"];
        }
            break;
        case 5:
        {
            vc.UrlStr = REMENFENLEIDETAIL;
            vc.num = self.dataArray3[button.tag-5000][@"cid"];
            
            vc.title = self.dataArray3[button.tag-5000][@"name"];
        }
            break;
        case 6:
        {
            vc.UrlStr = REMENFENLEIDETAIL;
            vc.num = self.dataArray4[button.tag-6000][@"cid"];
            
            vc.title = self.dataArray4[button.tag-6000][@"name"];
        }
            break;
        case 7:
        {
            vc.UrlStr = REMENFENLEIDETAIL;
            vc.num = self.dataArray2[button.tag-7000][@"cid"];
            
            vc.title = self.dataArray2[button.tag-7000][@"name"];
        }
            break;
        default:
            break;
    }
    
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
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
