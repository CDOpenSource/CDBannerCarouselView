//
//  CDMainTestVC.m
//  TestDemo
//
//  Created by Cindy on 2017/2/21.
//  Copyright © 2017年 Comtop. All rights reserved.
//

#import "CDMainTestVC.h"
#import "CDBannerCarouselView.h"

@interface CDMainTestVC () <CDBannerCarouselViewDelegate>
{
    CDBannerCarouselView *bannerView;
    NSArray *imageList;
}
@end

@implementation CDMainTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    imageList = @[@"h1.jpg",@"h2.jpg",@"h3.jpg"];
    bannerView = [[CDBannerCarouselView alloc] initBannerViewDefaultPlaceholderImage:nil WithDelegate:self];
    bannerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    bannerView.pageControlAliment = CDBannerCarouselViewPageContolAlimentRight;
    [self.view addSubview:bannerView];
    bannerView.bounds = CGRectMake(0, 0, 320, 150);
    bannerView.center = self.view.center;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [bannerView adjustWhenControllerViewWillAppera];
}

#pragma mark - CDBannerView Delegate
- (NSInteger)numberOfBannerItemOnBannerView:(CDBannerCarouselView *)bannerView
{
    return imageList.count;
}

- (UIImage *)bannerView:(CDBannerCarouselView *)bannerView itemImageAtIndex:(NSInteger)index
{
    return [UIImage imageNamed:imageList[index]];
}

// banner已经滚动至某个索引项
- (void)bannerView:(CDBannerCarouselView *)bannerView didScrollToIndex:(NSInteger)index
{
    NSLog(@"bannerView didScrollToIndex : %zi",index);
}

// banner已经点击选中了某个索引项
- (void)bannerView:(CDBannerCarouselView *)bannerView didSelectedIndex:(NSInteger)index
{
    NSLog(@"bannerView didSelectedIndex : %zi",index);
}

@end
