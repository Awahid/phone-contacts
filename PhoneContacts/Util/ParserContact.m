//
//  GRParserLeadsContact.m
//  GRDBackOffice
//
//  Created by Abdul Wahid on 6/10/16.
//  Copyright © 2016 Global Rescue. All rights reserved.
//

#import "ParserContact.h"
#import "Contact.h"
#import "Phone.h"
#import "Email.h"

@implementation ParserContact

-(id)parseDataFromArray:(NSArray *)data {
    
    //[super log:[NSString stringWithFormat:@"response data for LEad Contact: %@",data]];
    @try {
        NSMutableArray* contactArray = [NSMutableArray array];
        
        if(data){
            for(NSDictionary *contactDictionary in data){
                
                Contact *contact = [[Contact alloc] init];
                contact.addressBookIdentifier = contactDictionary[@"id"];
                contact.firstName = contactDictionary[@"firstName"];
                contact.lastName = contactDictionary[@"lastName"];
                //contact.contactId = [[NSUserDefaults standardUserDefaults] valueForKey:kUserDefaultsKeyCurrentUserDistributorId];
                contact.source = 1;
                
                NSArray *contactPhones = contactDictionary[@"phones"];
                if(contactPhones){
                    NSMutableArray* contactPhoneArray = [NSMutableArray new];
                    for (NSDictionary* phone in contactPhoneArray) {
                        Phone *contactPhone = [[Phone alloc] init];
                        //leadPhone.leadId = lead.Id;
                        contactPhone.label = phone[@"label"];
                        contactPhone.phoneNumber = phone[@"value"];
                        [contactPhoneArray addObject:contactPhone];
                    }
                    contact.phoneNumbers = contactPhoneArray;
                }
                
                NSDictionary *contactEmails = contactDictionary[@"emails"];
                if(contactEmails){
                    NSMutableArray* contactEmailArray = [NSMutableArray new];
                    for (NSDictionary* email in contactEmails) {
                        Email *contactEmail = [[Email alloc] init];
                        //leadEmail.leadId = lead.Id;
                        contactEmail.email = email[@"value"];
                        contactEmail.label = email[@"label"];
                        [contactEmailArray addObject:contactEmail];
                    }
                    contact.emails = contactEmailArray;
                }
                
                NSDate *updatedAt = contactDictionary[@"updatedAt"];
                contact.updatedAt = updatedAt;
                
                [contactArray addObject:contact];
            }
            return contactArray;
        } else {
            return [NSMutableArray new];
        }
    } @catch (NSException *exception) {
        //[GRUtil grExceptionLog:exception methodSelector:_cmd andClass:[self class]];
        //return [NSMutableArray new];
    } @finally {
        
    }
}

@end
