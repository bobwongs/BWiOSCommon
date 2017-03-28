//
//  BWObjective-CCodeSnippets.h
//  BWCodeSnippets
//
//  Created by BobWong on 16/8/19.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Objective-C Comment
 */
@interface BWObjective_CCodeSnippets : NSObject

// BWPropertyPointerTypeStrongTemplateCode
@property (strong, nonatomic) <#DataType#> *<#member#>;  ///< <#Comments#>
// BWPropertyPointerTypeCopyTemplateCode
@property (copy, nonatomic) <#DataType#> *<#member#>;  ///< <#Comments#>

// BWPropertyValueTypeTemplateCode
@property (assign, nonatomic) <#DataType#> <#member#>;  ///< <#Comments#>

// BWPropertyBlockTypeTemplateCode
@property (copy, nonatomic) <#ReturnType#>(^<#BlockName#>)(<#Parameters#>);  ///< <#Comments#>

// BWPropertyBlockTypeDefinitionTemplate
@property (copy, nonatomic) <#BlockType#> <#block#>;  ///< <#Comments#>

@end
