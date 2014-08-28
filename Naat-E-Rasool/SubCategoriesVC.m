//
//  SubCategoriesVC.m
//  Naat-E-Rasool
//
//  Created by Matloob Hasnain on 28/08/2014.
//  Copyright (c) 2014 terabyteLogixs. All rights reserved.
//

#import "SubCategoriesVC.h"
#import "CategoryCell.h"
@interface SubCategoriesVC ()

@end

@implementation SubCategoriesVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subCategoryArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellId = @"categoryCell";
    CategoryCell* catCell = (CategoryCell*)[tableView dequeueReusableCellWithIdentifier:cellId];
    if(catCell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CategoryCell" owner:self options:nil];
        catCell = [nib objectAtIndex:0];
    }
    CategoryDTO *cat = [self.subCategoryArray objectAtIndex:indexPath.row];
    
    catCell.lblCategoryName.text = cat.categoryName;
    
    return catCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
