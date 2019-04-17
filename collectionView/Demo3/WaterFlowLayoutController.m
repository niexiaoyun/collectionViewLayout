//
//  Demo3ViewController.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "WaterFlowLayoutController.h"
#import "WaterFlowLayout.h"
#import "WaterFlowCell.h"
@interface WaterFlowLayoutController ()<UICollectionViewDelegate, UICollectionViewDataSource, WaterFlowLayoutDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,copy) NSMutableArray *dataArray;
@end

@implementation WaterFlowLayoutController
static NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"瀑布流";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initChildrenView];
}
-(void)initChildrenView
{
    WaterFlowLayout *layout = [[WaterFlowLayout alloc] init];
    layout.delegate = self;

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[WaterFlowCell class] forCellWithReuseIdentifier:cellId];
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WaterFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    cell.colorView.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
//    cell.colorView.backgroundColor = [UIColor orangeColor];
    return cell;
}
-(CGFloat)waterFlowLayout:(WaterFlowLayout *)waterFlowLayout heightForItemAtIndex:(NSInteger)index itemWidth:(CGFloat)itemWidth
{
    NSDictionary *dict = [self.dataArray objectAtIndex:index];
    CGFloat width = [[dict objectForKey:@"w"] floatValue];
    CGFloat height = [[dict objectForKey:@"h"] floatValue];
    
    CGFloat itemHeight = itemWidth * height / width;
    
    return itemHeight;
}
-(CGFloat)rowSpaceForWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout
{
    return 10;
}
-(CGFloat)columnSpaceForWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout
{
    return 10;
}
-(UIEdgeInsets)edgeInsetsForWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout
{
    return UIEdgeInsetsMake(0, 6, 0, 6);
}

-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        [_dataArray addObjectsFromArray:array];
    }
    return _dataArray;
}
@end
