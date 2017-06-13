//
//  LPPZCollectionViewCell.m
//  UICollectinView自定义相册
//
//  Created by LPPZ-User01 on 2017/6/9.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "LPPZCollectionViewCell.h"

@implementation LPPZCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.imageView];
        self.imageView.frame = CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width-40) /3, 150);//(KWidth - 20)/kRowCount
    }
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end
