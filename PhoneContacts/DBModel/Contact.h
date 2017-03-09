//
//  Contact.h
//  PhoneContacts
//
//  Created by Abdul Wahid on 3/9/17.
//  Copyright © 2017 GLOBAL RESCUE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property NSString* addressBookIdentifier;
@property NSString* contactId;
@property NSString* firstName;
@property NSString* lastName;
@property short source;

@property BOOL isDeleted;

@property NSDate *updatedAt;

@property NSArray* phoneNumbers;
@property NSArray* emails;

//-(NSArray*)getPhoneNumbers;
//-(NSArray*)getEmails;

-(NSString*)displayName;

@end
