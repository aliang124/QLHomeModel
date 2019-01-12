//
//  QLMerchantListViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/7.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLMerchantListViewController.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLMerchantListCell.h"
#import "QLMerchantDetailViewController.h"
@interface QLMerchantListViewController ()<QLDropDownMenuDataSource,QLDropDownMenuDelegate>
{
    NSMutableArray *_data1;
    NSMutableArray *_data2;
    NSMutableArray *_data3;
    
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;
}
@end

@implementation QLMerchantListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"商家列表";
    
    self.formTable.top = 44 + WT_NavBar_Height;
    self.formTable.height = WTScreenHeight-WT_NavBar_Height-44;
    
    _data1 = [NSMutableArray arrayWithObjects:@"美食", @"娱乐", @"影视", @"表演", nil];
    _data2 = [NSMutableArray arrayWithObjects:@"小于3km", @"3-5km", @"5-10km", @"20km以上", nil];
    _data3 = [NSMutableArray arrayWithObjects:@"不限人数", @"单人餐", @"双人餐", @"3~4人餐", nil];
    
    QLDropDownMenu *menu = [[QLDropDownMenu alloc] initWithOrigin:CGPointMake(0, WT_NavBar_Height) andHeight:44];
    menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    menu.separatorColor = WT_Color_Line;
    menu.textColor = QL_UserName_TitleColor_Black;
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];

    
    self.formManager[@"QLMerchantListItem"] = @"QLMerchantListCell";
    [self initForm];
}

- (NSInteger)numberOfColumnsInMenu:(QLDropDownMenu *)menu {
    return 3;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    if (column==0) {
        return _currentData1Index;
    }
    if (column==1) {
        return _currentData2Index;
    }
    if (column==2) {
        return _currentData3Index;
    }
    return 0;
}

- (NSInteger)menu:(QLDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    if (column==0) {
        return _data1.count;
    } else if (column==1){
        return _data2.count;
    } else if (column==2){
        return _data3.count;
    }
    return 0;
}

- (NSString *)menu:(QLDropDownMenu *)menu titleForColumn:(NSInteger)column{
    switch (column) {
        case 0: return _data1[0];
            break;
        case 1: return _data2[0];
            break;
        case 2: return _data3[0];
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(QLDropDownMenu *)menu titleForRowAtIndexPath:(QLIndexPath *)indexPath {
    if (indexPath.column==0) {
        return _data1[indexPath.row];
    } else if (indexPath.column==1) {
        return _data2[indexPath.row];
    } else {
        return _data3[indexPath.row];
    }
}

- (CGFloat)widthRatioOfLeftColumn:(NSInteger)column {
    return 1;
}

- (BOOL)haveRightTableViewInColumn:(NSInteger)column {
    return NO;
}

- (void)menu:(QLDropDownMenu *)menu didSelectRowAtIndexPath:(QLIndexPath *)indexPath {
    if (indexPath.column == 0) {
        _currentData1Index = indexPath.row;
    } else if(indexPath.column == 1){
        _currentData2Index = indexPath.row;
    } else{
        _currentData3Index = indexPath.row;
    }
}

- (void)initForm {
    WT(weakSelf);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    for (int i = 0; i < 210; i++) {
        QLMerchantListItem *it = [[QLMerchantListItem alloc] init];
        it.selectionHandler = ^(id item) {
            QLMerchantDetailViewController *detail = [[QLMerchantDetailViewController alloc] init];
            [weakSelf.navigationController pushViewController:detail animated:YES];
        };
        [section0 addItem:it];
    }
    
    WTEmptyItem *itE = [[WTEmptyItem alloc] init];
    itE.cellHeight = 8;
    itE.bgColor = WT_Color_ViewBackGround;
    [section0 addItem:itE];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}
@end
