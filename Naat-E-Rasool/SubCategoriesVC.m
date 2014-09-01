//
//  SubCategoriesVC.m
//  Naat-E-Rasool
//
//  Created by Matloob Hasnain on 28/08/2014.
//  Copyright (c) 2014 terabyteLogixs. All rights reserved.
//

#import "SubCategoriesVC.h"
#import "CategoryCell.h"
#import "ParameterDTO.h"
#import "CategoryCollectionViewCell.h"
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
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.subCategoryArray.count;
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
//    CategoryDTO *cat = [self.subCategoryArray objectAtIndex:indexPath.row];
//    
//    catCell.lblCategoryName.text = cat.categoryName;
//    
//    return catCell;
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CategoryDTO *cat = [self.subCategoryArray objectAtIndex:indexPath.row];
//    ParameterDTO *param = [[ParameterDTO alloc]init];
//    param.sub_CategoryID = cat.categoryID;
//    param.content_Type = @"video";
//    param.offSet = 1;
//    param.language = @"English";
//    [[NetworkLayer sharedNetworkLayer]getAllVideoesForSubCategory:param];
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.subCategoryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellId = @"category";
    CategoryCollectionViewCell* catCell = (CategoryCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    CategoryDTO *cat = [self.subCategoryArray objectAtIndex:indexPath.row];
    
    catCell.lbl_Name.text = cat.categoryName;
    
    return catCell;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryDTO *cat = [self.subCategoryArray objectAtIndex:indexPath.row];
    ParameterDTO *param = [[ParameterDTO alloc]init];
    param.sub_CategoryID = cat.categoryID;
    param.content_Type = @"video";
    param.offSet = 1;
    param.language = @"English";
    [[NetworkLayer sharedNetworkLayer]getAllVideoesForSubCategory:param];
}



@end
