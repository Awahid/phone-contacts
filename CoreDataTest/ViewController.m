//
//  ViewController.m
//  CoreDataTest
//
//  Created by Abdul Wahid on 3/8/17.
//  Copyright © 2017 GLOBAL RESCUE. All rights reserved.
//

#import "ViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController ()


@end

@implementation ViewController

bool isAddressBookAccessable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self getAddressbookAccessiblity]) {
        [self getAllContacts];
    }
    isAddressBookAccessable = false;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma - mark private methods

-(void)getAllContacts{
    
    ABAddressBookRef addressBook = ABAddressBookCreate();
    NSMutableArray *contactsList = [(__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook) mutableCopy];
    
    [contactsList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
    
    
    
    
    
    
    NSMutableArray *contactArray = [NSMutableArray new];
    ABAddressBookRef addressBook = ABAddressBookCreate();
    
    CFArrayRef contacts = ABAddressBookCopyArrayOfAllPeople(addressBook);
    
    for (CFIndex i=0; i<CFArrayGetCount(contacts); i++) {
        
        NSMutableDictionary *contactDictionary = [NSMutableDictionary new];
        ABRecordRef contact = CFArrayGetValueAtIndex(contacts, i);
        CFStringRef firstName = ABRecordCopyValue(contact, kABPersonFirstNameProperty);
        CFStringRef lastName  = ABRecordCopyValue(contact, kABPersonLastNameProperty);
        [contactDictionary setObject:[NSString stringWithFormat:@"%@ %@", firstName, lastName] forKey:@"name"];
        
        //For Phone number
        ABMultiValueRef phones = ABRecordCopyValue(contact, kABPersonPhoneProperty);
        if(phones) {
            for(int ix = 0; ix < ABMultiValueGetCount(phones); ix++){
                CFStringRef typeTmp = ABMultiValueCopyLabelAtIndex(phones, ix);
                CFStringRef numberRef = ABMultiValueCopyValueAtIndex(phones, ix);
                CFStringRef typeRef = ABAddressBookCopyLocalizedLabel(typeTmp);
                
                NSString *phoneNumber = (__bridge NSString *)numberRef;
                NSString *phoneType = (__bridge NSString *)typeRef;
                
                [contactDictionary setObject:[NSString stringWithFormat:@"%@ - %@", phoneType, phoneNumber] forKey:@"Phone"];
                
                if(typeTmp) CFRelease(typeTmp);
                if(numberRef) CFRelease(numberRef);
                if(typeRef) CFRelease(typeRef);
            }
            CFRelease(phones);
        }
        [contactArray addObject:contactDictionary];
        //CFRelease(firstName);
        //CFRelease(lastName);
    }
    NSLog(@"array is %@",contactArray);
}

-(bool) getAddressbookAccessiblity{
    if(ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        isAddressBookAccessable = true;
    }
    else{
        ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error) {
            isAddressBookAccessable = granted ? true: false;
        });
    }
    return isAddressBookAccessable;
}


@end
