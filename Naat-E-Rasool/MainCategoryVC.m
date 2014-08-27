//
//  ViewController.m
//  Naat-E-Rasool
//
//  Created by Matloob Hasnain on 27/08/2014.
//  Copyright (c) 2014 terabyteLogixs. All rights reserved.
//

#import "MainCategoryVC.h"
#import "CategoryCell.h"
@interface MainCategoryVC ()
            

@end

@implementation MainCategoryVC
            
- (void)viewDidLoad {
    categoryArray = [NSMutableArray array];
    [self getAllCategoriesFromServer];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)getAllCategoriesFromServer
{
    [ParseResponse sharedParseResponse].selectedValueDelegate = self;
    [[NetworkLayer sharedNetworkLayer]getAllCategories];
}
#pragma mark - allcategory return delegate
-(void)allcategoriesReturning:(NSString *)status WithJobDetail:(NSMutableArray *)jobDetailArray
{
    categoryArray = jobDetailArray;
    [self.tbl_categories reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return categoryArray.count;
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
    CategoryDTO *cat = [categoryArray objectAtIndex:indexPath.row];
    
    catCell.lblCategoryName.text = cat.categoryName;

    return catCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [ParseResponse sharedParseResponse].selectedValueDelegate = self;
    CategoryDTO *cat  = [categoryArray objectAtIndex:indexPath.row];
    [self getSubcategories:cat.categoryID];
}

-(void)getSubcategories:(int)catId
{
    [[NetworkLayer sharedNetworkLayer]subCategoriesForSpecificID:catId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
