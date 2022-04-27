//
//  ZZChooseImageVController.m
//  ZZMemorialDay
//
//  Created by mac on 2022/4/27.
//

#import "ZZChooseImageVController.h"
#import "PrefixHeader.pch"
#import <SDWebImage/SDWebImage.h>

@interface ZZChooseImageVController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionV;
@property (strong, nonatomic) UIView *navigationBar;

@end

@implementation ZZChooseImageVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionV];
    
    _navigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DWScreenWidth, DWSettingNavigationBarHeight)];
    [_navigationBar setBackgroundColor:DWDiaryThemeBlueColor];
    
    UILabel *labelTitle = [[UILabel alloc] init];
    labelTitle.text = @"选择图片";
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.font = [UIFont systemFontOfSize:20];
    [labelTitle sizeToFit];
    labelTitle.frame = CGRectMake(_navigationBar.frame.size.width / 2 - labelTitle.frame.size.width / 2, _navigationBar.frame.size.height / 2 - labelTitle.frame.size.height / 2, labelTitle.frame.size.width, labelTitle.frame.size.height);
    [_navigationBar addSubview:labelTitle];
    
    UIButton *buttonQuit = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonQuit setImage:[UIImage imageNamed:@"quit"] forState:UIControlStateNormal];
    [buttonQuit setFrame:CGRectMake(DWSettingQuitButtonLeftPadding, _navigationBar.frame.size.height / 2 - DWSettingQuitButtonWidth / 2, DWSettingQuitButtonWidth, DWSettingQuitButtonWidth)];
    [buttonQuit addTarget:self action:@selector(buttonQuitTap) forControlEvents:UIControlEventTouchUpInside];
    [_navigationBar addSubview:buttonQuit];
    
    [self.view addSubview:_navigationBar];
}
-(UICollectionView *)collectionV{
    if (!_collectionV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((DWScreenWidth-40)/3, (DWScreenWidth-40)/3*DWScreenHeight/DWScreenWidth);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        _collectionV  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, DWSettingNavigationBarHeight+10, DWScreenWidth, DWScreenHeight-DWSettingNavigationBarHeight-10) collectionViewLayout:flowLayout];
        _collectionV.delegate = self;
        _collectionV.dataSource = self;
        [_collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"emptyCell"];
    }
    return _collectionV;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *emptyCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"emptyCell" forIndexPath:indexPath];
    emptyCell.backgroundColor = [UIColor whiteColor];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:emptyCell.bounds];
    [emptyCell addSubview:imageV];
    imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"bgImage%li.png",(long)indexPath.row]];
    return emptyCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"LocImage"];
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"bgImage%li.png",(long)indexPath.row]];
    [[SDImageCache sharedImageCache] storeImage:image forKey: @"/Documents/pic.png" completion:^{
            
        }];
    KPostNotification(@"ChangeImage", nil, nil);
    [self buttonQuitTap];
}

- (void)buttonQuitTap {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
