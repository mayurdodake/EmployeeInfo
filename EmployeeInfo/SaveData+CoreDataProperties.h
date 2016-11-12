//
//  SaveData+CoreDataProperties.h
//  EmployeeInfo
//
//  Created by apple on 10/11/16.
//  Copyright © 2016 felix-its. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SaveData.h"

NS_ASSUME_NONNULL_BEGIN

@interface SaveData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *eid;
@property (nullable, nonatomic, retain) NSString *fname;
@property (nullable, nonatomic, retain) NSString *lname;
@property (nullable, nonatomic, retain) NSNumber *salary;

@end

NS_ASSUME_NONNULL_END
