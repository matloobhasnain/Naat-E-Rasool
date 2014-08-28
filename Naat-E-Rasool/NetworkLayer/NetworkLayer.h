//
//  NetworkLayer.h
//  XiiaLive
//
//  Created by Mohsin Yaqoob on 26/09/2013.
//  Copyright (c) 2013 SDSol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "MBProgressHUD.h"
#import "ParameterDTO.h"
@interface NetworkLayer : AFHTTPRequestOperationManager 

@property (nonatomic,strong) MBProgressHUD *HUD;

+ (NetworkLayer *)sharedNetworkLayer;

-(void)getAllCategories;
-(void)subCategoriesForSpecificID:(int)catId;
-(void)getAllVideoesForSubCategory:(ParameterDTO*)parameter;




//-(void)getUserProfileWithUserName:(NSString*)userName password:(NSString*)password;
//
//-(void)jobDetail:(int)JobId;
//
//-(void)checkListDetail:(NSString*)checkListType;
//
//-(void)createJobInfo;
//
//-(void)subMitSignatureWithJobId:(int)jobId withImagePath:(NSString*)ImagePath;
//
//-(void)getAllJobListAgainstEmployeeID:(int)employeeID;
//
//
////Parsed but delgate iƒsubmitmplementation remaining
//
//-(void)addJobObjectives:(int)jobId withObjectiveDescription:(NSString*)objective;
//
//-(void)addMeterial:(int)jobId withMaterialID:(int)materialID withMaterialQuantity:(int)quantity;
//
//-(void)addJobNotes:(int)jobID withNotes:(NSString*)notes;
//
//-(void)addJobObjectiveImage:(JobObjectiveImage*)jobObjectiveImage;
//
//-(void)updateJobJobObjective:(int)jobObjectiveID withObjective:(NSString *)objectiveText;
//
//-(void)deleteObjective:(int)jobObjectiveID;
//
//-(void)deleteObjectiveImage:(int)jobObjectiveImageID;
//
//-(void)deleteJobMaterial:(int)jobObMaterialID;
//
//-(void)getAllEmployeesForAttendence;
//
//-(void)markAttendenceWithEmployeeID:(int)employeeID withClockType:(NSString*)clockType withImage:(UIImage*)image;
//
//-(void)createJobWithJobDetailObjective:(JobDetail*)jobDetail;
//
//-(void)updateJobStatus:(int)jobID withStatus:(NSString*)status;
//
////// Listen on any call back with getMyEvaluationDetailResponse and getMyEvaluationDetailResponseError
////// It will insert the evaluations in DB automatically
////-(void)getMyEvaluationDetailWithTherapistID:(NSString*)therapistID;
////
////// Listen on any call back with initialDownloadResponse and initialDownloadResponseError
////// All the data will be downloaded in DB
////-(void)downloadInitialDataForTherapist:(NSString*)therapistID;
////
////// Listen on call back with closeWeekResponse and closeWeekResponseError it return a dictionary as userinfo
////-(void)closeWeekWithClientBillings:(NSMutableArray*)clientBillingObjArray;
////-(void)syncDataWithDictionary:(NSArray*)clientSkillTargetPlaylistsObjArray :(NSArray*)clientIOAsObjArray :(NSArray*)clientSkillDataObjArray :(NSArray*)clientBehaviorDataObjArray :(NSArray*)clientBehaviorEventsObjArray :(NSArray*)clientEvaluationAnswersObjArray :(NSArray*)questionsObjArray;
////
////-(void)getForgottenPasswordForUserName:(NSString*)userName;
////-(void)getForgottenUserNameForEmail:(NSString*)email;
////
////
////-(void)sendUsernameEmail:(NSString*)email userName:(NSString*)userName;
////-(void)sendForgotPasswordEmail:(NSString*)email userName:(NSString*)userName;
////
////// Helper
////-(NSString*)setValidValueForAttribute:(NSString*)attribute;
//
//
//-(void)getVehicleStatus;
//
//-(void)submitJobChecklist:(int)jobId :(int)employeeId :(NSString*)checklistType :(UIImage*)image :(NSArray*)checklistArray;
//
//-(void)submitVehicleChecklist:(int)vehicleId :(int)employeeId :(NSString*)checklistType :(NSArray*)procedureArray;
//
//-(void)forgotpassword:(NSString*)email;
@end
