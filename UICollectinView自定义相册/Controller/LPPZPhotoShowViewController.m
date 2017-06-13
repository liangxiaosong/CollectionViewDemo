//
//  LPPZPhotoShowViewController.m
//  UICollectinView自定义相册
//
//  Created by LPPZ-User01 on 2017/6/9.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "LPPZPhotoShowViewController.h"
#import "LPPZLineLayout.h"
#import "LPPZLineCollectionViewCell.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
static NSString * const KLPPZLineCollectionViewCell = @"LPPZLineCollectionViewCell";

@interface LPPZPhotoShowViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)NSMutableArray *imageS;

@end

@implementation LPPZPhotoShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    for (int i = 1; i <= 20; i++) {
        [self.imageS addObject:[NSString stringWithFormat:@"%d", i]];
    }

    [self createCollectionView];


}

- (void)createCollectionView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:[[LPPZLineLayout alloc] init]];
    [collectionV setBackgroundColor:[UIColor lightGrayColor]];//
    collectionV.delegate = self;
    collectionV.dataSource = self;
    //    collectionV.pagingEnabled = YES;
    collectionV.showsHorizontalScrollIndicator = NO;
    [collectionV registerClass:[LPPZLineCollectionViewCell class] forCellWithReuseIdentifier:KLPPZLineCollectionViewCell];
    [self.view addSubview:collectionV];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageS.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LPPZLineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KLPPZLineCollectionViewCell forIndexPath:indexPath];
    cell.imageStr = self.imageS[indexPath.item];
    return cell;
}

#pragma mark - setter / getter
- (NSMutableArray *)imageS {
    if (!_imageS) {
        self.imageS = [NSMutableArray array];
    }
    return _imageS;
}


@end
