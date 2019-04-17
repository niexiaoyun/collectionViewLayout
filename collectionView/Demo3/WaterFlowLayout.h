//
//  Demo3Layout.h
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterFlowLayout;
NS_ASSUME_NONNULL_BEGIN
@protocol WaterFlowLayoutDelegate <NSObject>
@required
//根据索引和宽度计算item的高度
-(CGFloat)waterFlowLayout:(WaterFlowLayout *)waterFlowLayout heightForItemAtIndex:(NSInteger)index itemWidth:(CGFloat)itemWidth;

@optional
//列数
-(NSInteger)columnForWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout;
//列间隔
-(CGFloat)columnSpaceForWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout;
//行间隔
-(CGFloat)rowSpaceForWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout;
//外边距
-(UIEdgeInsets)edgeInsetsForWaterFlowLayout:(WaterFlowLayout *)waterFlowLayout;
@end
@interface WaterFlowLayout : UICollectionViewLayout

@property (nonatomic,weak) id<WaterFlowLayoutDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
