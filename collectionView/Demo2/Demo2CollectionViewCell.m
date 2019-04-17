//
//  Demo2CollectionViewCell.m
//  collectionView
//
//  Created by 聂晓昀 on 2019/4/15.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "Demo2CollectionViewCell.h"

@interface Demo2CollectionViewCell()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation Demo2CollectionViewCell
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
    CGFloat space = 10;
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    CGRect tempFrame = self.imageView.frame;
    tempFrame.origin = CGPointMake(space, space);
    tempFrame.size = CGSizeMake(width - 2 * space, height - 2 * space);
    self.imageView.frame = tempFrame;
}

-(void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
