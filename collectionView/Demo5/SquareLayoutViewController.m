//
//  SquareLayoutViewController.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "SquareLayoutViewController.h"
#import "SquareLayout.h"
#import "LineRollCell.h"
@interface SquareLayoutViewController ()<UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation SquareLayoutViewController
static NSString *cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initChildrenView];
}
-(void)initChildrenView
{
    SquareLayout *layout = [[SquareLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) collectionViewLayout:layout];
    collectionView.dataSource = self;
    [collectionView registerClass:[LineRollCell class] forCellWithReuseIdentifier:cellId];
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
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

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24"];
    }
    return _dataArray;
}
@end
