//
//  QLStarView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/26.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLStarView.h"

@implementation QLStarView
@synthesize starImg1,starImg2,starImg3,starImg4,starImg5,starCount;

- (id)initWithPoint:(CGPoint)pt {
    CGRect frame = CGRectMakes(pt.x, pt.y, 61*QL_MULPITLE, 9*QL_MULPITLE);
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.starCount = 0;
        
        starImg1 = [[UIImageView alloc] initWithFrame:CGRectMakes(0, 0, 9, 9)];
        [self addSubview:starImg1];
        
        starImg2 = [[UIImageView alloc] initWithFrame:CGRectMakes(13, 0, 9, 9)];
        [self addSubview:starImg2];
        
        starImg3 = [[UIImageView alloc] initWithFrame:CGRectMakes(26, 0, 9, 9)];
        [self addSubview:starImg3];
        
        starImg4 = [[UIImageView alloc] initWithFrame:CGRectMakes(39, 0, 9, 9)];
        [self addSubview:starImg4];
        
        starImg5 = [[UIImageView alloc] initWithFrame:CGRectMakes(52, 0, 9, 9)];
        [self addSubview:starImg5];
    }
    return self;
}

- (id)initWithOrgPoint:(CGPoint)pt {
    CGRect frame = CGRectMakes(pt.x, pt.y, 61, 9);
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.starCount = 0;
        
        starImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 9, 9)];
        [self addSubview:starImg1];
        
        starImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(13, 0, 9, 9)];
        [self addSubview:starImg2];
        
        starImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(26, 0, 9, 9)];
        [self addSubview:starImg3];
        
        starImg4 = [[UIImageView alloc] initWithFrame:CGRectMake(39, 0, 9, 9)];
        [self addSubview:starImg4];
        
        starImg5 = [[UIImageView alloc] initWithFrame:CGRectMake(52, 0, 9, 9)];
        [self addSubview:starImg5];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [starImg1 setImage:[UIImage imageNamed:@"starGray"]];
    [starImg2 setImage:[UIImage imageNamed:@"starGray"]];
    [starImg3 setImage:[UIImage imageNamed:@"starGray"]];
    [starImg4 setImage:[UIImage imageNamed:@"starGray"]];
    [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    if (starCount==1) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg3 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg4 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    } else if (starCount==2) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg3 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg4 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    } else if (starCount==3) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg3 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg4 setImage:[UIImage imageNamed:@"starGray"]];
        [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    } else if (starCount==4) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg3 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg4 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg5 setImage:[UIImage imageNamed:@"starGray"]];
    } else if (starCount==5) {
        [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg2 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg3 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg4 setImage:[UIImage imageNamed:@"starYellow"]];
        [starImg5 setImage:[UIImage imageNamed:@"starYellow"]];
    }
}
@end
