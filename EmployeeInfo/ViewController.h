//
//  ViewController.h
//  EmployeeInfo
//
//  Created by apple on 10/11/16.
//  Copyright © 2016 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *idtf;

@property (weak, nonatomic) IBOutlet UITextField *fnametf;

@property (weak, nonatomic) IBOutlet UITextField *lnametf;
@property (weak, nonatomic) IBOutlet UITextField *saltf;

- (IBAction)savedatabtn:(id)sender;


@end

