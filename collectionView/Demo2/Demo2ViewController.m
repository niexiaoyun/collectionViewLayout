//
//  Demo2ViewController.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/15.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "Demo2ViewController.h"
#import "Demo2CollectionViewCell.h"
#import "Demo2Layout.h"
#import "Demo2Layout2.h"
@interface Demo2ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation Demo2ViewController
static NSString *cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initChildrenView];
}
-(void)initChildrenView
{
//    Demo2Layout *layout = [[Demo2Layout alloc] init];
//    layout.itemSize = CGSizeMake(self.view.frame.size.width, 120);
//    layout.minimumLineSpacing = 10;
    Demo2Layout2 *layout = [[Demo2Layout2 alloc] init];
    
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[Demo2CollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [self.view addSubview:collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Demo2CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.imageName = self.dataArray[indexPath.row];
    return cell;
}

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"01",@"02",@"03",@"04",@"05",@"06",@"07"];
    }
    return _dataArray;
}
@end
