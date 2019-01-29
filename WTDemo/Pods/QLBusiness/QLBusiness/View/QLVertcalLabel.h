//
//  JFLabel.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/29.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface QLVertcalLabel : UILabel
{
    
@private
    
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment;

@end  
