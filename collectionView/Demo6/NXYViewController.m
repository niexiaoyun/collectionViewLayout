//
//  NXYViewController.m
//  NXYCategory
//
//  Created by 聂晓昀 on 2019/4/18.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "NXYViewController.h"
#import "NXYCollectionViewCell.h"
@interface NXYViewController ()<UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,copy) NSMutableArray *dataArray;
@end

@implementation NXYViewController
static NSString *cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initChildrenView];
}
-(void)initChildrenView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[NXYCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(collectionViewLongPress:)];
    [collectionView addGestureRecognizer:longPress];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NXYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    CGFloat red = arc4random_uniform(256)/255.0;
    CGFloat green = arc4random_uniform(256)/255.0;
    CGFloat blue = arc4random_uniform(256)/255.0;
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    cell.xy_label.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.item]];
    return cell;
}

-(void)collectionViewLongPress:(UILongPressGestureRecognizer *)recognizer
{
    //获取点击的坐标, 根据坐标获取cell对应的indexPath
    CGPoint point = [recognizer locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
    //根据长按手势的状态进行处理
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            if (!indexPath) {
                //没有点击到cell不处理
                break;
            }
            //开始移动
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
            break;
        case UIGestureRecognizerStateChanged:
            //移动过程中更新位置
            [self.collectionView updateInteractiveMovementTargetPosition:point];
            break;
        case UIGestureRecognizerStateEnded:
            //停止移动
            [self.collectionView endInteractiveMovement];
            break;
        default:
            //取消移动
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}
//开始移动时会调用该方法
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    //根据indexPath判断是否可以移动, YES可移动, NO不可移动
    return YES;
}
//移动结束时调用该方法
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    /**
     sourceIndexPath 原始数据索引
     destinationIndexPath 目的位置索引
     */
    NSNumber *number = [self.dataArray objectAtIndex:sourceIndexPath.item];
    [self.dataArray removeObjectAtIndex:sourceIndexPath.item];
    [self.dataArray insertObject:number atIndex:destinationIndexPath.item];
}
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        for (int i = 0; i < 30; i ++) {
            [_dataArray addObject:@(i)];
        }
    }
    return _dataArray;
}
@end
