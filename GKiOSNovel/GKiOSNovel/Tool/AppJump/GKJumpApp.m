//
//  GKJumpApp.m
//  GKiOSNovel
//
//  Created by wangws1990 on 2019/6/13.
//  Copyright © 2019 wangws1990. All rights reserved.
//

#import "GKJumpApp.h"
#import "GKStartViewController.h"
#import "GKBookDetailController.h"
@implementation GKJumpApp
+ (void)jumpToAppGuidePage:(void(^)(void))completion
{
    BOOL res = [GKUserManager alreadySelect];
    if (!res) {
        [GKJumpApp window].rootViewController = [GKStartViewController vcWithCompletion:completion];
    }else
    {
        !completion ?: completion();
    }
}
+ (void)jumpToBookDetail:(NSString *)bookId{
    UIViewController *nvc = [UIViewController rootTopPresentedController];
    GKBookDetailController *vc = [GKBookDetailController vcWithBookId:bookId];
    vc.hidesBottomBarWhenPushed = YES;
    [nvc.navigationController pushViewController:vc animated:YES];
}
+  (UIWindow *)window
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }else
    {
        return [app keyWindow];
    }
}
@end