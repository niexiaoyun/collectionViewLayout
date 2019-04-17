//
//  Demo3Layout.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "WaterFlowLayout.h"

static const NSInteger defaultColumn = 3;

@interface WaterFlowLayout()
//存放所有布局属性
@property (nonatomic,copy) NSMutableArray *attributeArray;
//存放所有列的当前高度
@property (nonatomic,copy) NSMutableArray *columnHeightArray;
// 记录内容高度(为了计算滚动范围)
@property (nonatomic,assign) CGFloat contentHeight;

-(NSInteger)columnCount;
-(CGFloat)rowSpace;
-(CGFloat)columnSpace;
-(UIEdgeInsets)edgeInsets;
@end

@implementation WaterFlowLayout

-(void)prepareLayout
{
    [super prepareLayout];
    self.contentHeight = 0;
    //清除以前所有的高度
    [self.columnHeightArray removeAllObjects];
    for (int i = 0; i < self.columnCount; i++) {
        [self.columnHeightArray addObject:@(self.edgeInsets.top)];
    }
    
    //清除之前的所有布局属性
    [self.attributeArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributeArray addObject:attribute];
    }
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributeArray;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //collectionView宽度
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    // 计算每个cell的宽度
    CGFloat cellWidth = (collectionViewWidth - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount -1) * self.columnSpace) / self.columnCount;
    CGFloat cellHeight = [self.delegate waterFlowLayout:self heightForItemAtIndex:indexPath.item itemWidth:cellWidth];
    
    //找出高度最短的一列
    
    //高度最短列索引
    NSInteger minIndex = 0;
    CGFloat minColumnHeight = [[self.columnHeightArray firstObject] floatValue];
    for (int i = 1; i < self.columnCount; i++) {
        CGFloat height = [self.columnHeightArray[i] floatValue];
        if (minColumnHeight > height) {
            minColumnHeight = height;
            minIndex = i;
        }
    }
    CGFloat x = self.edgeInsets.left + minIndex * (self.rowSpace + cellWidth);
    CGFloat y = minColumnHeight;
    if (y != self.edgeInsets.top) {
        y += self.rowSpace;
    }
    attribute.frame = CGRectMake(x, y, cellWidth, cellHeight);
    
    //更新最短列的高度
    self.columnHeightArray[minIndex] = @(CGRectGetMaxY(attribute.frame));
    
    //记录高度内容
    CGFloat columnH = [self.columnHeightArray[minIndex] doubleValue];
    if (self.contentHeight < columnH) {
        self.contentHeight = columnH;
    }
    return attribute;
}

-(CGSize)collectionViewContentSize
{
    return CGSizeMake(0, self.contentHeight+self.edgeInsets.top);
}


-(NSInteger)columnCount
{
    if ([self.delegate respondsToSelector:@selector(columnForWaterFlowLayout:)]) {
        return [self.delegate columnForWaterFlowLayout:self];
    }
    return defaultColumn;
}
-(CGFloat)rowSpace
{
    if ([self.delegate respondsToSelector:@selector(rowSpaceForWaterFlowLayout:)]) {
        return [self.delegate rowSpaceForWaterFlowLayout:self];
    }
    return 0;
}
-(CGFloat)columnSpace
{
    if ([self.delegate respondsToSelector:@selector(columnSpaceForWaterFlowLayout:)]) {
       return [self.delegate columnSpaceForWaterFlowLayout:self];
    }
    return 0;
}
-(UIEdgeInsets)edgeInsets
{
    if ([self.delegate respondsToSelector:@selector(edgeInsetsForWaterFlowLayout:)]) {
        return [self.delegate edgeInsetsForWaterFlowLayout:self];
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(NSMutableArray *)attributeArray
{
    if (_attributeArray == nil) {
        _attributeArray = [NSMutableArray array];
    }
    return _attributeArray;
}
-(NSMutableArray *)columnHeightArray
{
    if (_columnHeightArray == nil) {
        _columnHeightArray = [NSMutableArray array];
    }
    return _columnHeightArray;
}
@end
