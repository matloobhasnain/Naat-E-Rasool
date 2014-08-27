//
//  Constant.h
//  SASHomeAutomation
//
//  Created by Matloob Hasnain on 01/07/2014.
//  Copyright (c) 2014 SDDSol. All rights reserved.
//


#define IS_IOS_7_OR_GREATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#pragma mark - Color
#define topBarColor   [UIColor colorWithRed:43/255.0 green:119/255.0 blue:238/255.0 alpha:1]
#define greenBtnColor   [UIColor colorWithRed:67/255.0 green:213/255.0 blue:82/255.0 alpha:1]
#define greyColor   [UIColor lightGrayColor]

#define orangeColor   [UIColor colorWithRed:253/255.0 green:107/255.0 blue:9/255.0 alpha:1]
#define redColor   [UIColor colorWithRed:252/255.0 green:0/255.0 blue:9/255.0 alpha:1]

#pragma mark - font
#define topBarTille_FONT(s)           [UIFont fontWithName:@"OpenSansLight-Italic" size:s]


#pragma mark - corner radius

#define kCornerRadius 7
#define kBorderWidth 2
#pragma mark - Image

#define kMainBg @"main_topBg.png"

#define kJobStatusScheduled @"Scheduled"
#define kJobStatusPaused @"Paused"
#define kJobStatusInProgress @"InProgress"
#define kJobStatusCompleted @"Completed"

#define APP_DELEGATE ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#define strDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


#define BASE_URL @"http://iuchoice.com/admin/Json/"
#define Image_BASE_URL @"http://iuchoice.com/img/video/"
//
//#define BASE_URL @"http://192.168.1.101/sasservice/sasservice.svc/"
//#define Image_BASE_URL @"http://192.168.1.101/sasportal/images/"



// Basic authentication
#define UserName @"sdsol"
#define Password @"sdsol99"



#define kDisclaimerTitle @"disclaimerTitle"
#define kDisclaimerHTML @"disclaimerHtml"
#define kLoginStatus @"loginStatus"

//#define kEmployeeID @"EmployeeId"
//#define kEmployeeName @"Name"

#define kEmployeeID  [[NSUserDefaults standardUserDefaults]valueForKey:@"EmployeeId"]
#define kEmployeeName [[NSUserDefaults standardUserDefaults]valueForKey:@"EmployeeName"]


#define signInAPIResponse @"singInAPIResponse"
#define signInAPIResponseError @"signInAPIResponseError"
#define jobDetailSuccess @"jobDetailSuccess"
#define jobDetailError @"jobDetailError"
#define checkListSuccess @"CheckListSuccess"
#define checkListError @"CheckListError"
#define createJobInfoScuccess @"CreateJobInfoSuccess"
#define createJobInfoError @"CreateJobInfoError"
#define submitSignaturScuccess @"SubmitSignaturSuccess"
#define submitSignaturError @"SubmitSignaturError"

#define checkListMorning @"Morning"
#define checkListEvening @"DayClose"
#define checkListJobStart @"JobStart"
#define checkListJobEnd @"JobClose"
#define kSignaturePath @"signature"
#define kTimeInClockType @"TimeIn"
#define kTimeOutClockType @"TimeOut"



#define getVehicleStatusSuccess @"GetVehicleStatusSuccess"
#define getVehicleStatusError @"GetVehicleStatusError"