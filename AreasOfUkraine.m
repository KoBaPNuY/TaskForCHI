//
//  AreasOfUkraine.m
//  TaskForCHI
//
//  Created by Zhuravlev Aleksandr on 07.04.15.
//  Copyright (c) 2015 AlexHome. All rights reserved.
//

#import "AreasOfUkraine.h"
#import "RegionOfArea.h"

@interface AreasOfUkraine ()

@end

@implementation AreasOfUkraine
{
    NSArray* arrayList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Areas" ofType:@"plist"]];
    
    
    NSArray *arrayList = [dictRoot objectForKey:@"AreaName"];
   
    NSLog(@"%@", arrayList);
    
    
   // Areas = [NSArray arrayWithObjects:@"Винницкая область",@"Волынская область", @"Днепропетровская область", @"Донецкая область", @"Житомирская область", nil];
    
    
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"AreaTable";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [arrayList objectAtIndex:indexPath.row];
    
    return cell;
}




#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Detail"])
    {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        RegionOfArea* destViewController = segue.destinationViewController;
        destViewController.regionName = [arrayList objectAtIndex:indexPath.row];
        destViewController.title = destViewController.regionName;
    }
}


@end
