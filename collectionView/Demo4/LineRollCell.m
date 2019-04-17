//
//  LineRollCell.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/16.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "LineRollCell.h"

@interface LineRollCell()
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation LineRollCell
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
    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageView];
    self.contentView.backgroundColor = [UIColor orangeColor];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    CGFloat space = 6;
    CGRect tempFrame = self.imageView.frame;
    tempFrame.size = CGSizeMake(width - space, height - space);
    tempFrame.origin = CGPointMake(space / 2, space / 2);
    self.imageView.frame = tempFrame;
}

-(void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
