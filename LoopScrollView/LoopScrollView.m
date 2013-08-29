//
//  LoopScrollView.m
//  HealthAttendant
//
//  Created by Zhou Jinxiu on 13-8-23.
//  Copyright (c) 2013年 Zhou Jinxiu. All rights reserved.
//

#import "LoopScrollView.h"

@implementation LoopScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setContentInset:UIEdgeInsetsMake(frame.size.height/2, INT32_MAX, frame.size.height/2, INT32_MAX)];
        [self setBounces:NO];
        
    }
    return self;
}

-(void)setContentSize:(CGSize)contentSize{
    [super setContentSize:contentSize];
    if (contentSize.width > self.frame.size.width) {
        [self setContentInset:UIEdgeInsetsMake(0, INT32_MAX, 0, INT32_MAX)];
    }else if(contentSize.height > self.frame.size.height){
        [self setContentInset:UIEdgeInsetsMake(INT32_MAX, 0, INT32_MAX, 0)];
    }
}

-(void)setContentOffset:(CGPoint)contentOffset{
    double x = contentOffset.x;
    double y = contentOffset.y;
    while (x<= -self.bounds.size.width) {
        x+= self.contentSize.width;
    }
    while (y <= -self.bounds.size.height) {
        y+= self.contentSize.height;
    }
    while (x > self.contentSize.width) {
        x -= self.contentSize.width;
    }
    while (y > self.contentSize.height) {
        y -= self.contentSize.height;
    }
    contentOffset.x = x;
    contentOffset.y = y;
    [super setContentOffset:contentOffset];
    //reset subview to make conent scroll
    for (UIView *sub in self.subviews) {
        CGRect subRect = [sub frame];
        float x = subRect.origin.x-contentOffset.x;
        float y = subRect.origin.y-contentOffset.y;
        if (x > self.bounds.size.width && x - self.contentSize.width > -subRect.size.width) {
            subRect.origin.x -= self.contentSize.width;
        }else if(x < - subRect.size.width && x + self.contentSize.width < self.bounds.size.width){
            subRect.origin.x += self.contentSize.width;
        }
        if (y > self.bounds.size.height && y - self.contentSize.height > -subRect.size.height) {
            subRect.origin.y -= self.contentSize.height;
        }else if(y < - subRect.size.height && y + self.contentSize.height < self.bounds.size.height){
            subRect.origin.y += self.contentSize.height;
        }
        [sub setFrame:subRect];
    }
}

@end
