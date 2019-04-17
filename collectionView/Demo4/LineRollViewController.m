//
//  LineRollViewController.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "LineRollViewController.h"
#import "LineRollCell.h"
#import "LineRollLayout.h"
@interface LineRollViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation LineRollViewController
static NSString *cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initChildrenView];
}

-(void)initChildrenView
{
    LineRollLayout *layout = [[LineRollLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(120, 120);
    layout.minimumLineSpacing = 6;
    
    UICollectionView *collectoinView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200) collectionViewLayout:layout];
    collectoinView.dataSource = self;
    collectoinView.delegate = self;
    [collectoinView registerClass:[LineRollCell class] forCellWithReuseIdentifier:cellId];
    collectoinView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:collectoinView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LineRollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.imageName = self.dataArray[indexPath.item];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0 || indexPath.item == self.dataArray.count-1) return;
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    CGFloat cellCenterX = cell.frame.origin.x + cell.frame.size.width / 2;
    CGFloat centerX = collectionView.frame.size.width / 2.0 + collectionView.contentOffset.x;
    CGFloat centerSpace = cellCenterX - centerX;
    CGFloat collectionViewOffsetX = collectionView.contentOffset.x + centerSpace;
    
    collectionView.contentOffset = CGPointMake(collectionViewOffsetX, 0);
}

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20"];
    }
    return _dataArray;
}
@end
