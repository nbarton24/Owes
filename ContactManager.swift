//
//  ContactManager.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import Foundation
import ContactsUI

class ContactManager {
    
// MARK - Variables
    lazy var contacts: [CNContact] = {
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName),
            CNContactPhoneNumbersKey]
        
        // Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containersMatchingPredicate(nil)
        } catch {
            print("Error fetching containers")
        }
        
        var results: [CNContact] = []
        
        // Iterate all containers and append their contacts to our results array
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainerWithIdentifier(container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContactsMatchingPredicate(fetchPredicate, keysToFetch: keysToFetch)
                results.appendContentsOf(containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }
        
        return results
    }()
    
// MARK - Functions
    func loadContacts() -> [Person]{
        var people = [Person]()
        for c in contacts{
            let first = c.givenName
            let last = c.familyName
            
            let person = Person(fName: first, lName: last)
            
            for pn in c.phoneNumbers{
                let type = CNLabeledValue.localizedStringForLabel(pn.label)
                let num = String((pn.value as! CNPhoneNumber).valueForKey("digits")!)
                let phone = PhoneNumber(tp: type, num: num)
                
                //ADD PHONE NUMBER TO PERSON OBJECT
                person.phoneNums.append(phone)
            }
            people.append(person)
        }
        return people
    }

    
    
}