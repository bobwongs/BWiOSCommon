//
//  BWObjective-CCodeSnippets.m
//  BWCodeSnippets
//
//  Created by BobWong on 16/8/19.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "BWObjective-CCodeSnippets.h"

/*---------------------
 BWInterfaceExtensionTemplate
 ---------------------*/
@interface <#ClassName#> () <#<>#>

<#Code#>

@end

@implementation BWObjective_CCodeSnippets

- (void)utility_code_snippets {
    
    /*----------------------------------
       GCD
     ---------------------------------*/
    
    // Dispatch Once
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        <#code to be executed once#>
    });
    
    // Dispatch After
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(<#delayInSeconds#> * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        <#code to be executed after a specified delay#>
    });
    
    
    /*----------------------------------
        NSNotificationCenter
     ---------------------------------*/

    // BWNSNotificationCenterAddObserverTemplate
    [[NSNotificationCenter defaultCenter] addObserver:<#(nonnull id)#> selector:@selector(<#selector#>) name:<#(nullable NSString *)#> object:<#(nullable id)#>];
    
    // BWNSNotificationCenterRemoveObserverTemplate
    [[NSNotificationCenter defaultCenter] removeObserver:<#(nonnull id)#> name:<#(nullable NSString *)#> object:<#(nullable id)#>];
    
    // BWNSNotificationCenterPostNotificationWithUserInfoTemplate
    [[NSNotificationCenter defaultCenter] postNotificationName:<#(nonnull NSNotificationName)#> object:<#(nullable id)#> userInfo:<#(nullable NSDictionary *)#>];
    
    // BWNSNotificationCenterPostNotificationTemplate
    [[NSNotificationCenter defaultCenter] postNotificationName:<#(nonnull NSNotificationName)#> object:<#(nullable id)#>];
    
}

/*----------------------------------
 BWCommentMethodTemplate
 ---------------------------------*/
/**
 *  <#Description#>
 */
- (void)objective_c_comment {
    
    // BWCommentWith-
    /*----------------------------------
     <#Comment#>
     ---------------------------------*/
    
    
    // BWCommentMultiLine
    /*
     <#Comment#>
     */
    
    
    // BWCommentManyLinesCode
    // ---------- <#Comment In Complex Multiline Code#> ----------
    
}

/*----------------------------------
 BWDeallocTemplate
 ---------------------------------*/
- (void)dealloc {
    <#Code#>
}

/*----------------------------------
 BWMethodReturnTypeOfVoidTemplate
 ---------------------------------*/
- (void)<#MethodName#> {
    <#Code#>
}

@end
