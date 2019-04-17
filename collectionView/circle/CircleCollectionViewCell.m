//
//  CircleCollectionViewCell.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/12.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "CircleCollectionViewCell.h"

@interface CircleCollectionViewCell()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *label;

@end

@implementation CircleCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addChilderenView];
    }
    return self;
}
-(void)addChilderenView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:label];
    self.label = label;
}

-(void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    [self settingData];
    [self setttingFrame];
}

-(void)settingData
{
    self.imageView.image = [UIImage imageNamed:self.imageName];
    self.label.text = [NSString stringWithFormat:@"第%@张图片",self.imageName];
}
-(void)setttingFrame
{
    self.imageView.frame = self.contentView.bounds;
    self.label.frame = self.contentView.bounds;
}
@end
