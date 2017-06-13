//
//  LPPZLineCollectionViewCell.m
//  UICollectinView自定义相册
//
//  Created by LPPZ-User01 on 2017/6/9.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "LPPZLineCollectionViewCell.h"

@interface LPPZLineCollectionViewCell ()

@property (nonatomic, strong) UIImageView               *imageV;

@end

@implementation LPPZLineCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageV];
        self.imageV.frame = CGRectMake(0, 0, 160, 200);
    }
    return self;
}

- (void)setImageStr:(NSString *)imageStr {
    _imageStr = imageStr;
    self.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",imageStr]];
}

#pragma mark - setter / getter
- (UIImageView *)imageV {
    if (!_imageV) {
        _imageV = [[UIImageView alloc] init];
        _imageV.layer.borderWidth = 3.;
        _imageV.layer.borderColor = [UIColor whiteColor].CGColor;
        _imageV.layer.cornerRadius = 3.;
//        _imageV.layer.masksToBounds = YES;
    }
    return _imageV;
}

@end
