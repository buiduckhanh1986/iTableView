//
//  ViewController.m
//  iTableView
//
//  Created by Bui Duc Khanh on 11/24/16.
//  Copyright © 2016 Bui Duc Khanh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
{
    NSArray* data;
}

- (void)viewDidLoad {
    data = @[ @{@"Title" : @"Taylor Swift", @"SubTitle" : @"85-60-90", @"Image" : @"taylor.jpg"}
              ,@{@"Title" : @"Adele", @"SubTitle" : @"75-58-85", @"Image" : @"adele.jpg"}
              ,@{@"Title" : @"Adriana Lima", @"SubTitle" : @"80-63-85", @"Image" : @"lima.jpg"}];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Beautiful Girls";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 70;
}


// Trả về số row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}


// Thiết lập dữ liệu cho các cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary* menuItem = data[indexPath.row];
    
    cell.textLabel.text = [menuItem objectForKey:@"Title"];
    cell.detailTextLabel.text = [menuItem objectForKey:@"SubTitle"];
    cell.imageView.image = [UIImage imageNamed:[menuItem objectForKey:@"Image"]];
    
    return cell;
}

@end
