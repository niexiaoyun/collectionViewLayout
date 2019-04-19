//
//  NXYCollectionViewCell.m
//  NXYCategory
//
//  Created by 聂晓昀 on 2019/4/18.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "NXYCollectionViewCell.h"

@implementation NXYCollectionViewCell
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
    self.xy_label = [[UILabel alloc] init];
    self.xy_label.font = [UIFont systemFontOfSize:20];
    self.xy_label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.xy_label];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.xy_label.frame = self.contentView.bounds;
}
@end
