//
//  Demo1ViewController.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/15.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "Demo1ViewController.h"
#import "Demo1CollectionViewCell.h"
#import "DemoSectionHeaderView.h"
@interface Demo1ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation Demo1ViewController
static NSString *cellId = @"cellId";
static NSString *sectionId = @"sectionId";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initialChildrenView];
    self.title = @"悬浮照片墙";
}
-(void)initialChildrenView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 50);
    layout.sectionHeadersPinToVisibleBounds = YES;//透视图悬浮
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[Demo1CollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [collectionView registerClass:[DemoSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionId];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Demo1CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.imageName = self.dataArray[indexPath.section];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *resuableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        DemoSectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:sectionId forIndexPath:indexPath];
        header.headerTitleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.section];
        resuableView = header;
        
    }
    return resuableView;
}



-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07"];
    }
    return _dataArray;
}


@end
