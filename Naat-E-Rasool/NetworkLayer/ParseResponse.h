
//  ParseResponse.h
//  XiiaLive
//
//  Created by Mohsin Yaqoob on 26/09/2013.
//  Copyright (c) 2013 SDSol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryDTO.h"
//#import "GenreStation.h"
//#import "Genre.h"
//#import "LocalStation.h"
//#import "StationNowPlaying.h"
//#import "StationURL.h"
//#import "ShowOnNow.h"
//#import "SecurityQuestions.h"

//#import "jobDetail.h"
//#import "CreateJobInfoDetail.h"
//#import "JobObjective.h"
@protocol MyCustomeDelegateForReturningLoginDetail;

@interface ParseResponse : NSObject


@property (nonatomic, assign) id <MyCustomeDelegateForReturningLoginDetail> selectedValueDelegate;


+ (ParseResponse *)sharedParseResponse;
- (id)init;
-(void)parseAllCategories:(NSDictionary*)dictionary;
-(void)subCategories:(NSDictionary*)dictionary;
//-(void)parseSignInResponse:(NSDictionary*)dictionary;
//-(void)parseJobDetailResponse:(NSDictionary*)dictionary;
//-(void)parseCheckListResponse:(NSDictionary*)dictionary;
//-(void)parseCreateJobInfo:(NSDictionary*)dictionary;
//-(void)parseSubmitSignature:(NSDictionary*)dictionary;
//
///// delegate remaining
//-(void)parseAddJobObjectives:(NSDictionary*)dictionary;
//-(void)parseAddMaterials:(NSDictionary*)dictionary;
//-(void)parseAddNotes:(NSDictionary*)dictionary;
//-(void)parseAddJobObjectiveImage:(NSDictionary*)dictionary;
//-(void)parseUpdateJobObjectiveImage:(NSDictionary*)dictionary;
//-(void)parseDeleteObjective:(NSDictionary*)dictionary;
//-(void)parseDeleteObjectiveImage:(NSDictionary*)dictionary;
//-(void)parseDeleteJobMaterial:(NSDictionary*)dictionary;
//-(void)parseAllEmployeesForAttendence:(NSDictionary*)dictionary;
//-(void)parseMarkAttendence:(NSDictionary*)dictionary;
//
//-(void)parseCreateNewJob:(NSDictionary*)dictionary;
//-(void)parseUpdateJobStatus:(NSDictionary*)dictionary;
//-(void)parseForgotPassword:(NSDictionary*)dictionary;
//
//
//
//
////
////-(void)parseMyEvaluationDetailResponse:(NSDictionary*)dictionary;
////-(void)parseDownloadInitialDataResponse:(NSDictionary*)dictionary;
////-(NSMutableArray*)parseForgotPasswordResponse:(NSDictionary*)dictionary;
////-(NSMutableArray*)parseForgotUserNameResponse:(NSDictionary*)dictionary;
//// helper
////-(NSString*)validateAttribute:(NSString*)attribute;
//
//-(void)parseGetVehicleStatus:(NSDictionary*)dictionary;
//-(void)parseSubmitVehicleChecklist:(NSDictionary*)dictionary;
//-(void)parseSubmitJobChecklist:(NSDictionary*)dictionary;


@end


@protocol MyCustomeDelegateForReturningLoginDetail <NSObject>

@optional
-(void)allcategoriesReturning:(NSString *)status WithJobDetail:(NSMutableArray *)jobDetailArray;

@optional
-(void)allSubcategoriesReturning:(NSString *)status WithJobDetail:(NSMutableArray *)subCategoryArray;


//
//@optional
//-(void)selectedJobDetail:(JobDetail *)jobDetailObj withStatus:(NSString*)status;
//
//@optional
//-(void)selectedJobDetailAfterSubmitSignature:(JobDetail *)jobDetailObj withStatus:(NSString*)status;
//
//@optional
//-(void)checkListData:(NSMutableArray *)checkListArray withStatus:(NSString*)status;
//
//@optional
//-(void)returningCreateJobInfoDetail:(CreateJobInfoDetail *)createJobInfoDetail withStatus:(NSString*)status;
//
//@optional
//-(void)jobObjectiveAddImageAfter:(NSMutableArray*)afterImageArray afterImages:(NSMutableArray*)beforeImageArray withStatus:(NSString*)status;
//
//@optional
//-(void)deleteJobObjectiveImageWithStatus:(NSString*)status;
//
//@optional
//-(void)deleteJobObjectiveWithStatus:(NSString*)status;
//
//@optional
//-(void)deleteJobMeterialWithStatus:(NSString*)status;
//
//@optional
//-(void)addJobObjective:(NSArray*)refreshedObjectiveArray withStatus:(NSString*)status;
//
//@optional
//-(void)addJobMaterial:(NSArray*)refreshedMaterialArray withStatus:(NSString*)status;
//
//@optional
//-(void)addJobNotes:(JobDetail*)job withStatus:(NSString*)status;
//
//@optional
//-(void)updateJobObjectiveWithStatus:(NSString*)status;
//
//@optional
//-(void)submitCheckListResponse:(NSString*)status;
//
//@optional
//-(void)createJobReturningStatus:(NSString*)status;
//
//@optional
//-(void)allEmployee:(NSMutableArray*)EmployeeArray WithStatus:(NSString*)status;
//
//@optional
//-(void)clockInResponseWithStatus:(NSString*)status;
//
//@optional
//-(void)updateJobStatusTimeSpent:(int)timeSpent withStatus:(NSString*)status withJobStatus:(NSString *)jobStatus;
//
//@optional
//-(void)allVehicalStatus:(NSMutableArray*)vehicalArray WithStatus:(NSString*)status;
@end