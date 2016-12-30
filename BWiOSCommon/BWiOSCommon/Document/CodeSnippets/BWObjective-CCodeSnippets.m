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
    
    /*---------------------
        Dispatch Once
     ---------------------*/
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        <#code to be executed once#>
    });
    
    /*---------------------
        Dispatch After
     ---------------------*/
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(<#delayInSeconds#> * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        <#code to be executed after a specified delay#>
    });
    
    /*---------------------
        NSNotificationCenter
     ---------------------*/
    [[NSNotificationCenter defaultCenter] addObserver:<#(nonnull id)#> selector:<#(nonnull SEL)#> name:<#(nullable NSString *)#> object:<#(nullable id)#>];
    [[NSNotificationCenter defaultCenter] removeObserver:<#(nonnull id)#> name:<#(nullable NSString *)#> object:<#(nullable id)#>];
    
}

@end
