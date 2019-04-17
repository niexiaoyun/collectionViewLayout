//
//  LineRollLayout.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "LineRollLayout.h"

@implementation LineRollLayout
//-(void)prepareLayout
//{
//    [super prepareLayout];
//    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //获得super已经计算好的布局属性, 只有线性布局才能使用
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    //计算collectionView中心点的X值
    CGFloat collectionViewCenterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width / 2;
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        CGFloat centerOffset = fabs(attr.center.x - collectionViewCenterX);
        //根据间距值, 计算cell的缩放比例
        CGFloat scale = 1 - centerOffset / self.collectionView.frame.size.width;
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return attributes;
}
/**
 collectionView显示范围发生改变的时候, 是否重新发生布局
 
 一旦重新布局, 就会调用
 layoutAttributesForElementsInRect:
 prepareLayout
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
/**
 松开手的时候调用
 返回值是 collectionView停止滚动时候的偏移量
 proposedContentOffset 是最终偏移量的值(但是实际情况还是要根据返回值来决定)
 velocity 是滚动速率,有个x和y, 如果x有值,说明x上有速度, 可以根据x的正负来判断左右滚动
 */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    // 最终显示的矩形
    CGRect rect;
    rect.origin.x = proposedContentOffset.x;
    rect.origin.y = 0;
    rect.size = self.collectionView.frame.size;
    
    //当前collectionView中心点位置的x偏移量
    CGFloat currentX = proposedContentOffset.x + self.collectionView.frame.size.width / 2.0;
    //计算最小间距
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGFloat minSpace = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in array) {
        if (fabs(minSpace) > (attr.center.x - currentX)) {
            minSpace = attr.center.x - currentX;
        }
    }
    
    proposedContentOffset.x += minSpace;
    return proposedContentOffset;
}
@end
