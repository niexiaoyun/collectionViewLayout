//
//  Demo2Layout.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/15.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "Demo2Layout.h"

@implementation Demo2Layout

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributeArray = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attribute in attributeArray) {
        CGFloat degrees = M_PI * (-14 / 180.0);
        attribute.transform = CGAffineTransformMakeRotation(degrees);
    }
    return attributeArray;
}

//-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    CGFloat degrees = M_PI * (-14 / 180.0);
//    attributes.transform = CGAffineTransformMakeRotation(degrees);
//    attributes.size = CGSizeMake(self.collectionView.frame.size.width, 120);
//    return attributes;
//}

@end
