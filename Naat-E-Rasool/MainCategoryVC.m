//
//  ViewController.m
//  Naat-E-Rasool
//
//  Created by Matloob Hasnain on 27/08/2014.
//  Copyright (c) 2014 terabyteLogixs. All rights reserved.
//

#import "MainCategoryVC.h"
#import "CategoryCell.h"
#import "SubCategoriesVC.h"
#import "CategoryCollectionViewCell.h"
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
    [self.collection_Categories reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return categoryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        NSString * cellId = @"category";
        CategoryCollectionViewCell* catCell = (CategoryCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
        CategoryDTO *cat = [categoryArray objectAtIndex:indexPath.row];
    
        catCell.lbl_Name.text = cat.categoryName;
    
        return catCell;


}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [ParseResponse sharedParseResponse].selectedValueDelegate = self;
    CategoryDTO *cat  = [categoryArray objectAtIndex:indexPath.row];
    [self getSubcategories:cat.categoryID];
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return categoryArray.count;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString * cellId = @"categoryCell";
//    CategoryCell* catCell = (CategoryCell*)[tableView dequeueReusableCellWithIdentifier:cellId];
//    if(catCell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CategoryCell" owner:self options:nil];
//        catCell = [nib objectAtIndex:0];
//    }
//    CategoryDTO *cat = [categoryArray objectAtIndex:indexPath.row];
//    
//    catCell.lblCategoryName.text = cat.categoryName;
//
//    return catCell;
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [ParseResponse sharedParseResponse].selectedValueDelegate = self;
//    CategoryDTO *cat  = [categoryArray objectAtIndex:indexPath.row];
//    [self getSubcategories:cat.categoryID];
//}

-(void)getSubcategories:(int)catId
{
    [[NetworkLayer sharedNetworkLayer]subCategoriesForSpecificID:catId];
}

#pragma mark - subCategories return Delegate
-(void)allSubcategoriesReturning:(NSString *)status WithJobDetail:(NSMutableArray *)subCategoryArray
{
    SubCategoriesVC *subCategoryVC = (SubCategoriesVC*)[self.storyboard instantiateViewControllerWithIdentifier:@"subcategory"];
    subCategoryVC.subCategoryArray = subCategoryArray;
    [self.navigationController pushViewController:subCategoryVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
