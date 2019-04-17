//
//  Demo2Layout2.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "Demo2Layout2.h"

@interface Demo2Layout2()

@property (nonatomic,copy)  NSMutableArray *attributeArray;

@end

@implementation Demo2Layout2
-(void)prepareLayout
{
    //清除之前所有的布局属性
    [self.attributeArray removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
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
    CGFloat width = self.collectionView.frame.size.width;
    CGFloat height = 120;
    CGFloat x = 0;
    CGFloat y = indexPath.item * height;
    attribute.frame = CGRectMake(x, y, width, height);
    
    CGFloat degrees = M_PI * (-14 / 180.0);
    attribute.transform = CGAffineTransformMakeRotation(degrees);
    
    return attribute;
}
// 返回contentSize, 计算滚动范围
-(CGSize)collectionViewContentSize
{
    return CGSizeMake(0, self.attributeArray.count * 120);
}

-(NSMutableArray *)attributeArray
{
    if (_attributeArray == nil) {
        _attributeArray = [NSMutableArray array];
    }
    return _attributeArray;
}
@end
