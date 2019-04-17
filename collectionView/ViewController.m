//
//  ViewController.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/12.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "ViewController.h"
#import "NXYCircleContrller.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "WaterFlowLayoutController.h"
#import "LineRollViewController.h"
#import "SquareLayoutViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation ViewController
static NSString *cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"collectionView布局";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            NXYCircleContrller *VC = [[NXYCircleContrller alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 1:
        {
            Demo1ViewController *VC = [[Demo1ViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 2:
        {
            Demo2ViewController *VC = [[Demo2ViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 3:
        {
            WaterFlowLayoutController *VC = [[WaterFlowLayoutController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 4:
        {
            LineRollViewController *VC = [[LineRollViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 5:
        {
            SquareLayoutViewController *VC = [[SquareLayoutViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        default:
            break;
    }
}


-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[@"轮播图",@"悬浮照片墙",@"倾斜图片",@"瀑布流",@"水平滚动缩放",@"正方形布局"];
    }
    return _dataArray;
}

@end
