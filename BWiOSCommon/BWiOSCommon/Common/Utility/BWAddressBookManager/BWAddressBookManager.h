//
//  BWAddressBookManager.h
//  BWObjective-CResearch-iOS
//
//  Created by BobWong on 16/12/26.
//  Copyright © 2016年 BobWong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^BlockDidSelectPhone)(NSString *phone, NSString *fullName);  // phone：只包含数字的电话号码，fullName：全名

/**
 * 通讯录Manager
 */
@interface BWAddressBookManager : NSObject

/**
 *  选择电话号码
 *
 *  @param viewController 所在的VC
 *  @param blockDidSelect 选择成功后的回调
 */
- (void)selectContactInViewController:(UIViewController *)viewController didSelectPhone:(BlockDidSelectPhone)blockDidSelect;

@end
