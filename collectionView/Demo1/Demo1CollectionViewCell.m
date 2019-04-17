//
//  Demo1CollectionViewCell.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/15.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "Demo1CollectionViewCell.h"

@interface Demo1CollectionViewCell()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation Demo1CollectionViewCell
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
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

-(void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
