//
//  PdPlaceholderView.m
//  jmsg
//
//  Created by jimushiguang on 16/10/14.
//  Copyright © 2016年 jmsg. All rights reserved.
//

#import "PdPlaceholderView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define Screenheight [UIScreen mainScreen].bounds.size.height

static id sharedInstance;

@implementation PdPlaceholderView

- (void)awakeFromNib{
    self.reloadButton.hidden = YES;
    self.statusLabel.text = @"";
    self.statusImageView.image = nil;
}

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[NSBundle mainBundle] loadNibNamed:@"PdPlaceholderView" owner:self options:nil] firstObject];
    });
    [sharedInstance setFrame:CGRectMake(0, Screenheight/2 - ScreenWidth/2, ScreenWidth, ScreenWidth)];
    return sharedInstance;
}

- (void)creatUiWithType:(PlaceHolderType)type{
    switch (type) {
        case 0:
            self.statusLabel.text = @"这个人很懒，没有动态~";
            self.statusImageView.image = [UIImage imageNamed:@"1"];
            break;
        case 1:
            self.statusLabel.text = @"粉丝被火星人带走啦~";
            self.statusImageView.image = [UIImage imageNamed:@"1"];
            break;
        case 2:
            self.statusLabel.text = @"还没人给你送礼物哦~";
            self.statusImageView.image = [UIImage imageNamed:@"没有礼物"];
            break;
        case 3:
            self.statusLabel.text = @"关注的人被火星人带走啦~";
            self.statusImageView.image = [UIImage imageNamed:@"1"];
            break;
        case 4:
            self.statusLabel.text = @"你还没有加群哦~";
            self.statusImageView.image = [UIImage imageNamed:@"1"];
            break;
        case 5:
            self.statusLabel.text = @"还没有被拉黑的人哦~";
            self.statusImageView.image = [UIImage imageNamed:@"1"];
            break;
        case 6:
            self.statusLabel.text = @"没有找到你想要的~";
            self.statusImageView.image = [UIImage imageNamed:@"1"];
            break;
        case 7:
            self.statusLabel.text = @"还没有消息哦~";
            self.statusImageView.image = [UIImage imageNamed:@"没有消息"];
            break;
        case 8:
            self.statusLabel.text = @"网络异常";
            self.statusImageView.image = [UIImage imageNamed:@"没有网络"];
            self.reloadButton.hidden = NO;
            break;
        default:
            break;
    }
}

- (void)networkErrorWithTabBarHiden:(BOOL)hiden{
    self.statusLabel.text = @"网络异常";
    self.statusImageView.image = [UIImage imageNamed:@"没有网络"];
    if (hiden) {
        [sharedInstance setFrame:CGRectMake(0, 64, ScreenWidth, Screenheight- 64)];
    }else{
        [sharedInstance setFrame:CGRectMake(0, 64, ScreenWidth, Screenheight-64 - 40)];
    }
    self.reloadButton.hidden = NO;

}

- (IBAction)reload:(id)sender {
    if (self.reloadBlock) {
        self.reloadBlock();
    }
}

- (void)dismiss{
    [self removeFromSuperview];
}
@end
