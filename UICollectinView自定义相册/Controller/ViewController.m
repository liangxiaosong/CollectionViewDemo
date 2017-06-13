//
//  ViewController.m
//  UICollectinView自定义相册
//
//  Created by LPPZ-User01 on 2017/6/9.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "ViewController.h"
#import "LPPZCollectionViewCell.h"
#import "LPPZPhotoShowViewController.h"


static const NSInteger kRowCount = 3;
static const CGFloat spacing = 10;

static NSString * const KLPPZCollectionViewCell = @"KLPPZCollectionViewCell";

#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView                   *collectionView;
@property (nonatomic, strong) UILongPressGestureRecognizer       *longTap;
@property (nonatomic, strong) NSMutableArray                   *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"相册";
    //初始换数据源
    [self createData];

    [self.view addSubview:self.collectionView];
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGest:)];
    [self.collectionView addGestureRecognizer:longTap];
    self.longTap = longTap;
}

- (void)createData {
    for (int i = 0; i < 20; i ++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"%zd.jpg", i]];
    }
}

#pragma mark - 手势
- (void)longGest:(UILongPressGestureRecognizer *)tap {
    switch (tap.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[self.longTap locationInView:self.collectionView]];
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self.collectionView updateInteractiveMovementTargetPosition:[tap locationInView:tap.view]];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [self.collectionView endInteractiveMovement];
        }
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LPPZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KLPPZCollectionViewCell forIndexPath:indexPath];
    // Configure the cell
    cell.imageView.image = [UIImage imageNamed:self.dataArray[indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LPPZPhotoShowViewController *vc = [[LPPZPhotoShowViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//移动方法
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.dataArray exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
    [self.collectionView reloadData];
}

#pragma mark - setter / getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake((KWidth - 40)/kRowCount, 150);
        layout.minimumLineSpacing = spacing;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, -10, -10);

        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
        [_collectionView registerClass:[LPPZCollectionViewCell class] forCellWithReuseIdentifier:KLPPZCollectionViewCell];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor grayColor];
        _collectionView.pagingEnabled = NO;
        _collectionView.directionalLockEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = NO;
        _collectionView.alwaysBounceHorizontal = YES;
    }
    return _collectionView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}


@end
