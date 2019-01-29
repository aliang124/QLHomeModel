//
//  QLSubTieBaViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/6.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLSubTieBaViewController.h"
#import "QLTieBaCell.h"
#import "QLTieBaDetailViewController.h"
#import "QLTieBaNetWork.h"

@interface QLSubTieBaViewController ()
@property (nonatomic, assign) int pageIndex;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation QLSubTieBaViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc] init];
    self.navBar.hidden = YES;
    self.formManager[@"QLTieBaItem"] = @"QLTieBaCell";
    self.formTable.top = 0;
    self.formTable.height = WTScreenHeight-WT_NavBar_Height-32-WT_TabBar_Height;
    self.pageIndex = 1;
    [self getData];
}

- (void)getData {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:[NSNumber numberWithInt:self.pageIndex] forKey:@"page"];
    [param setObject:@"10" forKey:@"pageSize"];
    [param setObject:self.catogeryInfo[@"plateId"] forKey:@"plateId"];
    [QLTieBaNetWork getTieBaList:nil successHandler:^(id json) {
        NSArray *ar = json[@"subjectData"];
        if (ar && [ar isKindOfClass:[NSArray class]]) {
            [self.dataArray addObjectsFromArray:ar];
        }
        [self initForm];
    } failHandler:^(NSString *message) {
        NSLog(@"bbbbbb");
    }];
}

- (void)initForm {
    WT(weakSelf);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    for (int i = 0; i < self.dataArray.count; i++) {
        [section0 addItem:[WTEmptyItem initWithHeight:8]];
        NSDictionary *dic = self.dataArray[i];
        
        QLTieBaItem *it = [[QLTieBaItem alloc] init];
        it.info = dic;
        it.selectionHandler = ^(QLTieBaItem *item) {
            QLTieBaDetailViewController *detail = [[QLTieBaDetailViewController alloc] init];
            detail.subjectId = item.info[@"subjectId"];
            [weakSelf.navigationController pushViewController:detail animated:YES];
        };
        [section0 addItem:it];
    }
    [section0 addItem:[WTEmptyItem initWithHeight:8]];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

@end
