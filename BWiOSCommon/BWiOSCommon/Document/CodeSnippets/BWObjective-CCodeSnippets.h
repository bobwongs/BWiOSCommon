//
//  BWObjective-CCodeSnippets.h
//  BWCodeSnippets
//
//  Created by BobWong on 16/8/19.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

// BWImportFileTemplate
#import "<#imported_file#>"

/**
 * Objective-C Comment
 */
@interface BWObjective_CCodeSnippets : NSObject

// BWPropertyPointerTypeTemplateCode
@property (nonatomic, strong) <#DataType#> *<#member#>;  ///< <#Comments#>

// BWPropertyValueTypeTemplateCode
@property (nonatomic, assign) <#DataType#> <#member#>;  ///< <#Comments#>

// BWPropertyBlockTypeTemplateCode
@property (nonatomic, copy) <#ReturnType#>(^<#BlockName#>)(<#Parameters#>);  ///< <#Comments#>

// BWPropertyBlockTypeDefinitionTemplate
@property (nonatomic, copy) <#BlockType#> <#block#>;  ///< <#Comments#>

@end
