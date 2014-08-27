//
//  ViewController.h
//  Naat-E-Rasool
//
//  Created by Matloob Hasnain on 27/08/2014.
//  Copyright (c) 2014 terabyteLogixs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCategoryVC : UIViewController <UITableViewDelegate,UITableViewDataSource,MyCustomeDelegateForReturningLoginDetail>
{
    NSMutableArray *categoryArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl_categories;


@end

