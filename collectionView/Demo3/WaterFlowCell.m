//
//  Demo3CollectionViewCell.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "WaterFlowCell.h"

@implementation WaterFlowCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initChildrenView];
    }
    return self;
}
-(void)initChildrenView
{
    self.colorView = [[UIView alloc] init];
    [self.contentView addSubview:self.colorView];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.colorView.frame = self.contentView.bounds;
}
@end
