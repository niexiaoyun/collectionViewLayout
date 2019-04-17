//
//  SquareLayout.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "SquareLayout.h"

@interface SquareLayout()

@property (nonatomic,copy) NSMutableArray *attributeArray;

@end

@implementation SquareLayout
-(void)prepareLayout
{
    [super prepareLayout];
    //清空之前所有的布局属性
    [self.attributeArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributeArray addObject:attr];
    }
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat width = self.collectionView.frame.size.width * 0.5;
    CGFloat height = width;
    if (indexPath.item == 0)
    {
        attr.frame = CGRectMake(0, 0, width, height);
    }else if(indexPath.item == 1)
    {
        attr.frame = CGRectMake(width, 0, width, height / 2);
    }else if(indexPath.item == 2)
    {
        attr.frame = CGRectMake(width, height / 2, width, height / 2);
    }else if(indexPath.item == 3)
    {
        attr.frame = CGRectMake(0, height, width, height / 2);
    }else if(indexPath.item == 4)
    {
        attr.frame = CGRectMake(0, height * 1.5, width, height / 2);
    }else if(indexPath.item == 5)
    {
        attr.frame = CGRectMake(width, height, width, height);
    }else
    {
        UICollectionViewLayoutAttributes *att = self.attributeArray[indexPath.item - 6];
        CGRect frame = att.frame;
        frame.origin.y += 2 * height;
        attr.frame = frame;
    }
    
    return attr;
}
-(CGSize)collectionViewContentSize
{
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    NSInteger count = itemCount / 3;
    CGFloat height = self.collectionView.frame.size.width * 0.5;
    CGFloat collectionViewH = (itemCount % 3 == 0 ? count : count + 1) * height;
    return CGSizeMake(0, collectionViewH);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributeArray;
}

-(NSMutableArray *)attributeArray
{
    if (_attributeArray == nil) {
        _attributeArray = [NSMutableArray array];
    }
    return _attributeArray;
}
@end
