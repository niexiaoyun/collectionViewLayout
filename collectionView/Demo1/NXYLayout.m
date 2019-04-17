//
//  NXYLayout.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/15.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "NXYLayout.h"

@implementation NXYLayout
//自动调用
-(void)prepareLayout
{
    // 该方法默认什么也没做, 但是在自己的子类实现中, 一般在该方法中设定一些必要的layout的结构和初始需要的参数等
}

//返回collectionView的内容尺寸
-(CGSize)collectionViewContentSize
{
    return CGSizeZero;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    /**
     返回 rect中的所有元素的布局属性
     返回的是UICollectionViewLayoutAttributes 的数组
     UICollectionViewLayoutAttributes 可以是cell, 追加视图或者是装饰视图的信息,通过不同的UICollectionViewLayoutAttributes初始化方法可以得到
     不同类型的UICollectionViewLayoutAttributes
     
     1.layoutAttributesForCellWithIndexPath:
     2.layoutAttributesForSupplementaryViewOfKind:withIndexPath
     3.layoutAttributesForDecorationViewOfKind:withIndexPath
     */
    
    return nil;
}


-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 返回对应于indexPath的位置的cell的布局属性
    return nil;
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    //返回对应于indexPath的位置的追加视图的布局属性,  如果没有追加视图可以不重载
    return nil;
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    //返回对应于indexPath位置的装饰视图的布局属性, 如果没有装饰视图可以不重载
    return nil;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    // 当边界发生改变时, 是否应该刷新布局, 如果YES, 则在边界变化时(一般是scroll到其他地方), 将重新计算需要的布局信息
    return YES;
}

/**
  调用顺序
  prepareLayout  设置layout的结构和初始需要的参数等
  collectionViewContentSize  确定collectionView的所有内容的尺寸
  layoutAttributeesForElementsInRect  初始化的layout的外观将由该方法返回的UICollectionViewLayoutAttributes来决定
  在需要更新layout时, 需要给当前layout发送 invalidateLayout, 该消息会立即返回, 并且预约下一个loop的时候刷新当前layout, 这一点和
  UIView的setNeedsLayout方法十分类似, 在invalidateLayout后的下一个collectionView的刷新loop中,  又会从prepareLayout开始,依次调用
 collectionViewContentSize和layoutAttributesForElementsInRect来生成更新后的布局
 */
@end
