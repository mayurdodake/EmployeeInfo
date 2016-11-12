//
//  TableViewController.m
//  EmployeeInfo
//
//  Created by apple on 10/11/16.
//  Copyright © 2016 felix-its. All rights reserved.
//

#import "TableViewController.h"
#import "SaveData.h"
#import "AppDelegate.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array=[[NSMutableArray alloc]init];
    
    
    
    UIApplication *myapplication=[UIApplication sharedApplication];
    
    AppDelegate *mydelegate=(AppDelegate *)myapplication.delegate;
    
    NSManagedObjectContext *context=mydelegate.managedObjectContext;
    
    NSFetchRequest *req=[NSFetchRequest fetchRequestWithEntityName:@"SaveData"];
    
    NSArray *result=[context executeFetchRequest:req error:nil];
    
    for(SaveData *temp in result)
    {
        [_array addObject:temp];
        NSLog(@"%@",temp);
        
    }
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell=[cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    // Configure the cell...
    SaveData *temp=[_array objectAtIndex:indexPath.row];
    
    cell.textLabel.text=[NSString stringWithFormat:@"%@ %@",temp.fname,temp.lname];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@ %i",temp.eid,[temp.salary intValue]];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view=[[UIView alloc]init];
    
    
    _max=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _max.frame=CGRectMake(120, 10, 100, 30);
    [_max setTitle:@"Max" forState:UIControlStateNormal];
    _max.tintColor=[UIColor blueColor];
    
    [_max addTarget:self action:@selector(maxbtnclick) forControlEvents:UIControlEventTouchUpInside];
    
    
    _sort=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sort.frame=CGRectMake(230, 10, 50, 30);
    [_sort setTitle:@"Sort" forState:UIControlStateNormal];
    
    _sort.tintColor=[UIColor blueColor];
    
    [_sort addTarget:self action:@selector(sortbtnclick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_sort];
    [self.view addSubview:_max];
    
    return view;

}


-(void)maxbtnclick
{
    NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"salary" ascending:false selector:@selector(compare:)];
    
    NSArray *sortedarray=[self.array sortedArrayUsingDescriptors:@[sort]];
    
    self.array=[[NSMutableArray alloc]initWithObjects:[sortedarray objectAtIndex:0], nil];
    
    [self.tableView reloadData];

}

-(void)sortbtnclick
{
   // NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"fname" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"fname" ascending:false selector:@selector(caseInsensitiveCompare:)];
    
    NSArray *sortedarray=[self.array sortedArrayUsingDescriptors:@[sort]];
    
    self.array=[[NSMutableArray alloc]initWithArray:sortedarray];
    
    [self.tableView reloadData];

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
