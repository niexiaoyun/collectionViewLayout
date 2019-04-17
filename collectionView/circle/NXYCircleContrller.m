//
//  NXYCircleContrller.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/12.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "NXYCircleContrller.h"
#import "CircleCollectionViewCell.h"
#define maxSections 100
#define screenWidth [UIScreen mainScreen].bounds.size.width
@interface NXYCircleContrller ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) UIPageControl *pageControl;
@end

@implementation NXYCircleContrller
static NSString *cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildrenView];
    [self startTimer];
    self.title = @"轮播图";
}

-(void)addChildrenView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(screenWidth, 200);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, 200) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor orangeColor];
    [collectionView registerClass:[CircleCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:maxSections/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(screenWidth * 0.5, 160+64);
    pageControl.bounds = CGRectMake(0, 0, 150, 40);
    pageControl.pageIndicatorTintColor = [UIColor blueColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.enabled = NO;
    pageControl.numberOfPages = self.dataArray.count;
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return maxSections;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CircleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.imageName = self.dataArray[indexPath.row];
    return cell;
}

-(void)startTimer
{
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf nextPage];
    }];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)endTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
-(void)nextPage
{
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:maxSections/2];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem == self.dataArray.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextInexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self.collectionView scrollToItemAtIndexPath:nextInexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
//开始拖拽,停止定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self endTimer];
}
// 停止拖拽, 开启定时器
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5) % self.dataArray.count;
    self.pageControl.currentPage = page;

}

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07"];
    }
    return _dataArray;
}

@end
