//
//  PdPlaceholderView.h
//  jmsg
//
//  Created by jimushiguang on 16/10/14.
//  Copyright © 2016年 jmsg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PlaceHolderType_dynamic = 0,//动态
    PlaceHolderType_fan = 1,//粉丝
    PlaceHolderType_contribute = 2,//贡献榜
    PlaceHolderType_focus = 3,//关注
    PlaceHolderType_group = 4,//群
    PlaceHolderType_black = 5,//拉黑
    PlaceHolderType_search = 6,//搜索
    PlaceHolderType_message = 7,//消息
    PlaceHolderType_netWork = 8,//网络
    PlaceHolderType_normal = 9,//default
}PlaceHolderType;



@interface PdPlaceholderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *statusImageView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *reloadButton;
@property (nonatomic, copy) void(^reloadBlock)();

+ (id)sharedInstance;
- (void)creatUiWithType:(PlaceHolderType)type;
- (void)networkErrorWithTabBarHiden:(BOOL)hiden;
- (void)dismiss;

@end
