//
//  BWAddressBookManager.m
//  BWObjective-CResearch-iOS
//
//  Created by BobWong on 16/12/26.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWAddressBookManager.h"
#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBook/ABPerson.h>
#import <AddressBookUI/ABPersonViewController.h>
#import <ContactsUI/ContactsUI.h>

@interface BWAddressBookManager () <ABPeoplePickerNavigationControllerDelegate, CNContactPickerDelegate>

@property (nonatomic, copy) BlockDidSelectPhone blockDidSelectPhone;  ///< 选中的Block事件

@end

@implementation BWAddressBookManager

#pragma mark - Public Method

- (void)selectContactInViewController:(UIViewController *)viewController didSelectPhone:(BlockDidSelectPhone)blockDidSelect {
    if (!blockDidSelect)  return ;
    
    _blockDidSelectPhone = blockDidSelect;
    
    if (NSClassFromString(@"CNContactPickerViewController")) {
        // iOS 9, 10, use CNContactPickerViewController
        CNContactPickerViewController *picker = [[CNContactPickerViewController alloc] init];
        picker.delegate = self;
        picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
        picker.predicateForSelectionOfContact = [NSPredicate predicateWithValue:false];
        [viewController presentViewController:picker animated:YES completion:nil];
    } else {
        // iOS 8 Below, use ABPeoplePickerNavigationController
        ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
        picker.peoplePickerDelegate = self;
        if([UIDevice currentDevice].systemVersion.integerValue >= 8) {
            picker.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];  // 在iOS8之后，需要添加nav.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];这一段代码，否则选择联系人之后会直接dismiss，不能进入详情选择电话。
        }
        [viewController presentViewController:picker animated:YES completion:nil];
    }
}

#pragma mark - ABPeoplePickerNavigationControllerDelegate

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person NS_DEPRECATED_IOS(2_0, 8_0)
{
    return YES;
}

// iOS 7
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier NS_DEPRECATED_IOS(2_0, 8_0)
{
    ABMultiValueRef phoneRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    long index = ABMultiValueGetIndexForIdentifier(phoneRef,identifier);
    NSString *phone = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phoneRef, index);
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:@"[^0-9]" options:0 error:NULL];
    NSString *phoneNumber = [regular stringByReplacingMatchesInString:phone options:0 range:NSMakeRange(0, [phone length]) withTemplate:@""];
    
    NSString *firstName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    NSString *lastName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonLastNameProperty));
    NSString *fullName = [NSString stringWithFormat:@"%@%@", lastName, firstName];
    
    if (phone) {
        if (_blockDidSelectPhone) _blockDidSelectPhone(phoneNumber, fullName);
        [peoplePicker dismissViewControllerAnimated:YES completion:nil];
        return NO;
    }
    
    return YES;
}

// iOS 8
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    ABMultiValueRef phoneRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    long index = ABMultiValueGetIndexForIdentifier(phoneRef,identifier);
    NSString *phone = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phoneRef, index);
    NSString *phoneNumber = [[self class] onlyNumberString:phone];
    
    NSString *firstName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    NSString *lastName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonLastNameProperty));
    NSString *fullName = [NSString stringWithFormat:@"%@%@", lastName, firstName];
    
    if (_blockDidSelectPhone) _blockDidSelectPhone(phoneNumber, fullName);
    
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

// iOS 8
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person NS_AVAILABLE_IOS(8_0)
{
    ABPersonViewController *personViewController = [[ABPersonViewController alloc] init];
    personViewController.displayedPerson = person;
    [peoplePicker pushViewController:personViewController animated:YES];
}

#pragma mark - iOS 9以后，CNContactPickerDelegate

- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
    CNPhoneNumber *phoneNum = (CNPhoneNumber *)contactProperty.value;
    NSString *number = phoneNum.stringValue;
    NSString *phoneNumber = [[self class] onlyNumberString:number];
    
    CNContact *contact = contactProperty.contact;
    NSString *fullName = [NSString stringWithFormat:@"%@%@", contact.familyName, contact.givenName];
    
    if (_blockDidSelectPhone) _blockDidSelectPhone(phoneNumber, fullName);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {

}

#pragma mark - Tool

// 只截取数字
+ (NSString *)onlyNumberString:(NSString *)string {
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:@"[^0-9]" options:0 error:NULL];
    NSString *numberString = [regular stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];
    return numberString;
}

@end
