//
//  DemoSectionHeaderView.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/15.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "DemoSectionHeaderView.h"

@implementation DemoSectionHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self initChildrenView];
    }
    return self;
}
-(void)initChildrenView
{
    self.headerTitleLabel = [[UILabel alloc] init];
    self.headerTitleLabel.textColor = [UIColor redColor];
    self.headerTitleLabel.font = [UIFont systemFontOfSize:20];
    self.headerTitleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.headerTitleLabel];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.headerTitleLabel.frame = self.bounds;
}

@end
