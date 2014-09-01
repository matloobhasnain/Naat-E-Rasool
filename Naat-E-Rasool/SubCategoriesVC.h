//
//  SubCategoriesVC.h
//  Naat-E-Rasool
//
//  Created by Matloob Hasnain on 28/08/2014.
//  Copyright (c) 2014 terabyteLogixs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCategoriesVC : UIViewController
{

}
@property (weak, nonatomic) IBOutlet UITableView *tbl_subCategories;

@property(nonatomic,retain)NSMutableArray *subCategoryArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collection_SubCategory;

@end
