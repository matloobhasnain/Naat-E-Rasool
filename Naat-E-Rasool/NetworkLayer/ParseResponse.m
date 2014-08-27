//
//  ParseResponse.m
//  XiiaLive
//
//  Created by Mohsin Yaqoob on 26/09/2013.
//  Copyright (c) 2013 SDSol. All rights reserved.
//

#import "ParseResponse.h"
//#import "Therapists.h"
//#import "TherapitsEvaluations.h"
//#import "TherapistQuestions.h"
//#import "Areas.h"
//#import "ClientEvaluations.h"
//#import "ClientEvaluationQuestions.h"
//#import "ClientSkills.h"
@implementation ParseResponse

+ (ParseResponse *)sharedParseResponse
{
    
    static dispatch_once_t pred;
    static ParseResponse *_sharedParseResponse = nil;
    
    dispatch_once(&pred, ^{ _sharedParseResponse = [[self alloc] init]; });
    return _sharedParseResponse;
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

-(void)parseAllCategories:(NSDictionary*)dictionary
{
    NSMutableArray *categoriesArray = [NSMutableArray array];
    NSString *status = [dictionary valueForKey:@"status"];
    if([status isEqualToString:@"success"])
    {
       
        NSDictionary *responseDict = [dictionary valueForKey:@"all_cat"];
        for(NSDictionary *dict in responseDict)
        {
             CategoryDTO *category = [[CategoryDTO alloc]init];
            category.categoryID = [[dict objectForKey:@"id"] integerValue];
            category.categoryName = [dict objectForKey:@"name"];
            [categoriesArray addObject:category];

        }
    
    }
    [self.selectedValueDelegate allcategoriesReturning:status WithJobDetail:categoriesArray];
   
}

-(void)subCategories:(NSDictionary*)dictionary
{


}
//-(void)parseSignInResponse:(NSDictionary*)dictionary {
//    
//    
//    
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//
//    
//    
//    NSMutableArray *jobListArray = [NSMutableArray array];
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        
//        
//        NSDictionary *EmployInfo = [dictionary valueForKey:@"Employee"];
//        if(EmployInfo != nil )
//        {
//            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//            [userDefault setValue:[EmployInfo objectForKey:@"EmployeeId"] forKey:@"EmployeeId"];
//            [userDefault setValue:[EmployInfo objectForKey:@"Name"] forKey:@"EmployeeName"];
//            [userDefault synchronize];
//        }
//        NSMutableArray *jobArray = [dictionary valueForKey:@"JobList"];
//        for(NSDictionary *jobDict in jobArray)
//        {
//            JobDetail *job = [[JobDetail alloc]init];
//            job.status = [jobDict objectForKey:@"JobStatus"];
//            
//            job.jobID  = [[jobDict objectForKey:@"JobId"] integerValue];
//            job.timeSpent  = [[jobDict objectForKey:@"TimeSpent"] integerValue];
//            job.jobTitle  = [jobDict objectForKey:@"JobTitle"];
//            job.firstName  = [jobDict objectForKey:@"FirstName"];
//            job.lastName  = [jobDict objectForKey:@"LastName"];
//            job.phoneNumber  = [jobDict objectForKey:@"Phone"];
//            job.email  = [jobDict objectForKey:@"Email"];
//            job.address  = [jobDict objectForKey:@"Address"];
//            job.city  = [jobDict objectForKey:@"City"];
//            job.state  = [jobDict objectForKey:@"State"];
//            job.zip  = [jobDict objectForKey:@"Zip"];
//            job.date  = [jobDict objectForKey:@"JobDate"];
//            job.notes  = [jobDict objectForKey:@"Notes"];
//            // job.appointmentTime  = [jobDict objectForKey:@""];
//            job.status  = [jobDict objectForKey:@"JobStatus"];
//            job.disClaimerTitle  = [jobDict objectForKey:@"DisclaimerTitle"];
//            job.signature  = [jobDict objectForKey:@"Signature"];
//            job.disClaimerName  = [jobDict objectForKey:@"DisclaimerDescription"];
//            
//            [jobListArray addObject:job];
//            
//        }
//        
//        [self.selectedValueDelegate selectedloginUser:[responseDict objectForKey:@"Message"] WithJobDetail:jobListArray];
//        
//        
//    }
//    else
//    {
//        [self.selectedValueDelegate selectedloginUser:[responseDict objectForKey:@"Message"] WithJobDetail:jobListArray];
//    }
//    
//}
//
//
//
//
//-(void)parseJobDetailResponse:(NSDictionary*)dictionary
//{
//    
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    JobDetail *job = [[JobDetail alloc]init];
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        
//        NSDictionary *jobDict = [dictionary objectForKey:@"Job"];
//
//        job.status  = [jobDict objectForKey:@"JobStatus"];
//        job.jobID  = [[jobDict objectForKey:@"JobId"] integerValue];
//         job.timeSpent  = [[jobDict objectForKey:@"TimeSpent"] integerValue];
//        job.jobTitle  = [jobDict objectForKey:@"JobTitle"];
//        job.firstName  = [jobDict objectForKey:@"FirstName"];
//        job.lastName  = [jobDict objectForKey:@"LastName"];
//        job.phoneNumber  = [jobDict objectForKey:@"Phone"];
//        job.email  = [jobDict objectForKey:@"Email"];
//        job.address  = [jobDict objectForKey:@"Address"];
//        job.city  = [jobDict objectForKey:@"City"];
//        job.state  = [jobDict objectForKey:@"State"];
//        job.zip  = [jobDict objectForKey:@"Zip"];
//        job.date  = [jobDict objectForKey:@"JobDate"];
//        job.notes  = [jobDict objectForKey:@"Notes"];
//        // job.appointmentTime  = [jobDict objectForKey:@""];
//        job.disClaimerTitle  = [jobDict objectForKey:@"DisclaimerTitle"];
//        job.disClaimerName  = [jobDict objectForKey:@"DisclaimerDescription"];
//        job.signature  = [jobDict objectForKey:@"Signature"];
//        /// technician data
//        NSArray * technician = [dictionary valueForKey:@"JobEmployees"];
//        for(NSDictionary *techDict in technician)
//        {
//            
//            Technician *tech = [[Technician alloc]init];
//            tech.employeeID = [[techDict objectForKey:@"EmployeeId"]integerValue];
//            tech.jobEmployeeID = [[techDict objectForKey:@"JobEmployeeId"]integerValue];
//            tech.name = [techDict objectForKey:@"Name"];
//            [job.technicianArray addObject:tech];
//        }
//        
//        
//        // vehicale data
//        NSDictionary * vehical = [dictionary valueForKey:@"JobVehicles"];
//        for(NSDictionary *vehicalDict in vehical)
//        {
//            Van *van = [[Van alloc]init];
//            van.vehicalID = [[vehicalDict objectForKey:@"VehicleId"]integerValue];
//            van.jobVehicalID = [[vehicalDict objectForKey:@"JobVehicleId"]integerValue];
//            van.name = (NSString*)[vehicalDict objectForKey:@"Name"];
//            [job.vanArray addObject:van];
//        }
//        
//        
//        // Job Objective
//        
//        NSDictionary * jobObjective = [dictionary valueForKey:@"JobObjectives"];
//        for(NSDictionary *jobObjDict in jobObjective)
//        {
//            JobObjective *objective = [[JobObjective alloc]init];
//            objective.objectiveID = [[jobObjDict objectForKey:@"JobObjectiveId"]integerValue];
//            objective.jobID = [[jobObjDict objectForKey:@"JobId"]integerValue];
//            objective.objectiveTitle = [jobObjDict objectForKey:@"Objective"];
//            
//            // objective Image
//            NSDictionary * objectiveImage = [jobObjDict valueForKey:@"JobObjectiveImages"];
//            for(NSDictionary *imageDict in objectiveImage)
//            {
//                JobObjectiveImage *images = [[JobObjectiveImage alloc]init];
//                images.jobObjectiveImageId = [[imageDict objectForKey:@"JobObjectiveImageId"]integerValue];
//                NSString *completeImgLink = [NSString stringWithFormat:@"%@%@",Image_BASE_URL,[imageDict objectForKey:@"Image"]];
//                images.imageLink = completeImgLink;//[imageDict objectForKey:@"Image"];
//                images.imageType = [imageDict objectForKey:@"ImageType"];
//                images.latitude = [imageDict objectForKey:@"Latitude"];
//                images.longitude = [imageDict objectForKey:@"Longitude"];
//                images.createdDate = [imageDict objectForKey:@"CreatedDate"];
//                if([images.imageType isEqualToString:@"After"])
//                {
//                    [objective.afterPicsArray addObject:images];
//                }
//                else
//                {
//                    [objective.beforePicsArray addObject:images];
//                }
//            }
//            
//            [job.jobObjectivesArray addObject:objective];
//        }
//        
//        
//        // required Meterial
//        
//        NSDictionary *requiredMeterial = [dictionary objectForKey:@"JobMaterials"];
//        for(NSDictionary *requiredMeterialDict in requiredMeterial)
//        {
//            Material *material = [[Material alloc]init];
//            material.jobMaterialId = [[requiredMeterialDict objectForKey:@"JobMaterialId"]integerValue];
//            material.materialId = [[requiredMeterialDict objectForKey:@"MaterialId"]integerValue];
//            material.materialName = [requiredMeterialDict objectForKey:@"Name"];
//            material.quantity = [[requiredMeterialDict objectForKey:@"Quantity"] integerValue];
//            [job.materialRequiredArray addObject:material];
//        }
//        
//        
//        // All Meterial
//        
//        NSDictionary *allMeterial = [dictionary objectForKey:@"AllMaterials"];
//        for(NSDictionary *allMeterialDict in allMeterial)
//        {
//            Material *material = [[Material alloc]init];
//            material.jobMaterialId = [[allMeterialDict objectForKey:@"JobMaterialId"]integerValue];
//            material.materialId = [[allMeterialDict objectForKey:@"MaterialId"]integerValue];
//            material.materialName = [allMeterialDict objectForKey:@"Name"];
//            material.quantity = [[allMeterialDict objectForKey:@"Quantity"] integerValue];
//            [job.allMaterialArray addObject:material];
//        }
//        
//        [self.selectedValueDelegate selectedJobDetail:job withStatus:[responseDict objectForKey:@"Message"]];
//        
//    }
//    
//    else
//    {
//        
//        [self.selectedValueDelegate selectedJobDetail:job withStatus:[responseDict objectForKey:@"Message"]];
//    }
//    
//    
//}
//
//
//
//-(void)parseCheckListResponse:(NSDictionary*)dictionary
//{
//    
//    
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    
//    NSMutableArray *checkListArray = [NSMutableArray array];
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        NSDictionary * CheckListDict = [dictionary objectForKey:@"Checklist"];
//        for(NSDictionary *dict in CheckListDict)
//        {
//            
//            CheckList  *check  = [[CheckList alloc]init];
//            check.checkListID =  [[dict objectForKey:@"CheckListId"]integerValue];
//            check.checkListtitle = [dict objectForKey:@"Title"];
//            [checkListArray addObject:check];
//        }
//        
//        [self.selectedValueDelegate checkListData:checkListArray withStatus:[responseDict objectForKey:@"Message"]];
//    }
//    
//    else
//    {
//        [self.selectedValueDelegate checkListData:checkListArray withStatus:[responseDict objectForKey:@"Message"]];
//    }
//    
//    
//}
//
//-(void)parseCreateJobInfo:(NSDictionary*)dictionary
//{
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    CreateJobInfoDetail  *createJobDetail = [[CreateJobInfoDetail alloc]init];
//    
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        
//        // All Employee
//        NSDictionary *employeeDict = [dictionary objectForKey:@"AllEmployees"];
//        for(NSDictionary *employe in employeeDict)
//        {
//            Technician *tech = [[Technician alloc]init];
//            tech.employeeID = [[employe objectForKey:@"EmployeeId"]integerValue];
//            tech.name = [employe objectForKey:@"Name"];
//            [createJobDetail.employeeArray addObject:employe];
//            
//        }
//        // All Vehical
//        NSDictionary *vehicalDict = [dictionary objectForKey:@"AllVehicles"];
//        for(NSDictionary *vehical in vehicalDict)
//        {
//            Van *van = [[Van alloc]init];
//            van.vehicalID = [[vehical objectForKey:@"VehicleId"]integerValue];
//            van.name = [vehical objectForKey:@"Name"];
//            [createJobDetail.vanArray addObject:van];
//        }
//        
//        // All Materials
//        NSDictionary *metarialDict = [dictionary objectForKey:@"AllMaterials"];
//        for(NSDictionary *materialDict in metarialDict)
//        {
//            Material *material = [[Material alloc]init];
//            material.materialId = [[materialDict objectForKey:@"MaterialId"]integerValue];
//            material.materialName = [materialDict objectForKey:@"Name"];
//            [createJobDetail.allMaterialArray addObject:material];
//        }
//        // All States
//        NSDictionary *allStateDict = [dictionary objectForKey:@"AllStates"];
//        for(NSDictionary *statelDict in allStateDict)
//        {
//            
//            [createJobDetail.stateArray addObject:[statelDict objectForKey:@"StateName"]];
//        }
//        
//        [self.selectedValueDelegate returningCreateJobInfoDetail:createJobDetail withStatus:[responseDict objectForKey:@"Message"]];
//    }
//    
//    else
//    {
//        [self.selectedValueDelegate returningCreateJobInfoDetail:createJobDetail withStatus:[responseDict objectForKey:@"Message"]];
//    }
//    
//}
//
//-(void)parseGetVehicleStatus:(NSDictionary*)dictionary {
//    
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    NSMutableArray *vehicleArray = [NSMutableArray array];
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        
//        // Daily Checklist
//        NSDictionary *checklistDict = [dictionary objectForKey:@"DailyChecklist"];
//        for(NSDictionary *checklist in checklistDict) {
//            Van *van = [[Van alloc] init];
//            van.vehicalID = [[checklist objectForKey:@"VehicleId"] integerValue];
//            van.model = [checklist objectForKey:@"Model"];
//            van.morning = [[checklist objectForKey:@"Morning"] boolValue];
//            van.dayclose = [[checklist objectForKey:@"DayClose"] boolValue];
//            [vehicleArray addObject:van];
//        }
//        
//        // Success delegate
//        [self.selectedValueDelegate allVehicalStatus:vehicleArray WithStatus:[responseDict objectForKey:@"Message"]];
//        
//    } else {
//        // Error delegate
//         [self.selectedValueDelegate allVehicalStatus:vehicleArray WithStatus:[responseDict objectForKey:@"Message"]];
//    }
//}
//
//-(void)parseSubmitVehicleChecklist:(NSDictionary*)dictionary
//{
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    [self.selectedValueDelegate submitCheckListResponse:[responseDict objectForKey:@"Message"]];
//}
//
//-(void)parseSubmitJobChecklist:(NSDictionary*)dictionary {
//    
//      NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//     [self.selectedValueDelegate submitCheckListResponse:[responseDict objectForKey:@"Message"]];
//    
//}
//
//
//-(void)parseSubmitSignature:(NSDictionary*)dictionary
//{
//    
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    JobDetail *job = [[JobDetail alloc]init];
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        
//        NSDictionary *jobDict = [dictionary objectForKey:@"Job"];
//        // job.status = [jobDict objectForKey:@""];
//         job.status  = [jobDict objectForKey:@"JobStatus"];
//        job.jobID  = [[jobDict objectForKey:@"JobId"] integerValue];
//        job.timeSpent  = [[jobDict objectForKey:@"TimeSpent"] integerValue];
//        job.jobTitle  = [jobDict objectForKey:@"JobTitle"];
//        job.firstName  = [jobDict objectForKey:@"FirstName"];
//        job.lastName  = [jobDict objectForKey:@"LastName"];
//        job.phoneNumber  = [jobDict objectForKey:@"Phone"];
//        job.email  = [jobDict objectForKey:@"Email"];
//        job.address  = [jobDict objectForKey:@"Address"];
//        job.city  = [jobDict objectForKey:@"City"];
//        job.state  = [jobDict objectForKey:@"State"];
//        job.zip  = [jobDict objectForKey:@"Zip"];
//        job.date  = [jobDict objectForKey:@"JobDate"];
//        job.notes  = [jobDict objectForKey:@"Notes"];
//        job.state = [jobDict objectForKey:@"State"];
//        // job.appointmentTime  = [jobDict objectForKey:@""];
//        job.signature  = [jobDict objectForKey:@"Signature"];
//        job.disClaimerTitle  = [jobDict objectForKey:@"DisclaimerTitle"];
//        job.disClaimerName  = [jobDict objectForKey:@"DisclaimerDescription"];
//        [self.selectedValueDelegate selectedJobDetailAfterSubmitSignature:job withStatus:[responseDict objectForKey:@"Message"]];
//    }
//    
//    else
//    {
//        [self.selectedValueDelegate selectedJobDetailAfterSubmitSignature:job withStatus:[responseDict objectForKey:@"Message"]];
//    }
//    
//    
//}
//
//-(void)parseAddJobObjectives:(NSDictionary*)dictionary
//{
//    
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    NSMutableArray *objectiveArray = [NSMutableArray array];
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        
//        NSDictionary * jobObjective = [dictionary valueForKey:@"JobObjectives"];
//        for(NSDictionary *jobObjDict in jobObjective)
//        {
//            JobObjective *objective = [[JobObjective alloc]init];
//            objective.objectiveID = [[jobObjDict objectForKey:@"JobObjectiveId"]integerValue];
//            objective.jobID = [[jobObjDict objectForKey:@"JobId"]integerValue];
//            objective.objectiveTitle = [jobObjDict objectForKey:@"Objective"];
//            
//            // objective Image
//            NSDictionary * objectiveImage = [jobObjDict valueForKey:@"JobObjectiveImages"];
//            for(NSDictionary *imageDict in objectiveImage)
//            {
//                JobObjectiveImage *images = [[JobObjectiveImage alloc]init];
//                images.jobObjectiveImageId = [[imageDict objectForKey:@"JobObjectiveImageId"]integerValue];
//                NSString *completeImgLink = [NSString stringWithFormat:@"%@%@",Image_BASE_URL,[imageDict objectForKey:@"Image"]];
//                images.imageLink = completeImgLink;//[imageDict objectForKey:@"Image"];
//                images.imageType = [imageDict objectForKey:@"ImageType"];
//                images.latitude = [imageDict objectForKey:@"Latitude"];
//                images.longitude = [imageDict objectForKey:@"Longitude"];
//                images.createdDate = [imageDict objectForKey:@"CreatedDate"];
//                if([images.imageType isEqualToString:@"After"])
//                {
//                    [objective.afterPicsArray addObject:images];
//                }
//                else
//                {
//                    [objective.beforePicsArray addObject:images];
//                }
//            }
//            
//            [objectiveArray addObject:objective];
//        }
//        
//        /// set delegate to return objectives
//        [self.selectedValueDelegate addJobObjective:objectiveArray withStatus:[responseDict objectForKey:@"Message"]];
//        
//    }
//    
//    else
//    {
//        /// set delegate to return error
//        [self.selectedValueDelegate addJobObjective:objectiveArray withStatus:[responseDict objectForKey:@"Message"]];
//    
//    }
//    
//    
//}
//
//-(void)parseAddMaterials:(NSDictionary*)dictionary
//{
//    
//    NSMutableArray *jobMaterialArray =[NSMutableArray array];
//     NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        NSDictionary *requiredMeterial = [dictionary objectForKey:@"JobMaterials"];
//        for(NSDictionary *requiredMeterialDict in requiredMeterial)
//        {
//            Material *material = [[Material alloc]init];
//            material.jobMaterialId = [[requiredMeterialDict objectForKey:@"JobMaterialId"]integerValue];
//            material.materialId = [[requiredMeterialDict objectForKey:@"MaterialId"]integerValue];
//            material.materialName = [requiredMeterialDict objectForKey:@"Name"];
//            material.quantity = [[requiredMeterialDict objectForKey:@"Quantity"] integerValue];
//            [jobMaterialArray addObject:material];
//        }
//        
//        // set delgate for return job material
//        [self.selectedValueDelegate addJobMaterial:jobMaterialArray withStatus:[responseDict objectForKey:@"Message"]];
//    }
//    
//    else
//    {
//        // set error delgate
//        [self.selectedValueDelegate addJobMaterial:jobMaterialArray withStatus:[responseDict objectForKey:@"Message"]];    
//    }
//}
//
//-(void)parseAddNotes:(NSDictionary*)dictionary
//{
//
//
//    JobDetail *job = [[JobDetail alloc]init];
//     NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        NSDictionary *jobDict = [dictionary objectForKey:@"Job"];
//        job.timeSpent  = [[jobDict objectForKey:@"TimeSpent"] integerValue];
//        job.status  = [jobDict objectForKey:@"JobStatus"];
//        job.jobID  = [[jobDict objectForKey:@"JobId"] integerValue];
//        job.jobTitle  = [jobDict objectForKey:@"JobTitle"];
//        job.firstName  = [jobDict objectForKey:@"FirstName"];
//        job.lastName  = [jobDict objectForKey:@"LastName"];
//        job.phoneNumber  = [jobDict objectForKey:@"Phone"];
//        job.email  = [jobDict objectForKey:@"Email"];
//        job.address  = [jobDict objectForKey:@"Address"];
//        job.city  = [jobDict objectForKey:@"City"];
//        job.state  = [jobDict objectForKey:@"State"];
//        job.zip  = [jobDict objectForKey:@"Zip"];
//        job.date  = [jobDict objectForKey:@"JobDate"];
//        job.notes  = [jobDict objectForKey:@"Notes"];
//        // job.appointmentTime  = [jobDict objectForKey:@""];
//        job.disClaimerTitle  = [jobDict objectForKey:@"DisclaimerTitle"];
//        job.disClaimerName  = [jobDict objectForKey:@"DisclaimerDescription"];
//        
//        // set delgate for return job material
//        
//        [self.selectedValueDelegate addJobNotes:job withStatus:[responseDict objectForKey:@"Message"]];
//    }
//    
//    else
//    {
//        // set error delgate
//        [self.selectedValueDelegate addJobNotes:job withStatus:[responseDict objectForKey:@"Message"]];
//        
//    }
//
//}
//
//-(void)parseAddJobObjectiveImage:(NSDictionary*)dictionary
//{
//    
////    NSDictionary *returningResponseDict = [NSDictionary dictionary];
////    NSMutableArray *afterPicArray = [NSMutableArray array];
////    NSMutableArray *beforePicArray = [NSMutableArray array];
////    int objectiveId = 0 ;
//    NSMutableArray * refreshedImagesBeforeArray = [[NSMutableArray alloc] init];
//    NSMutableArray * refreshedImagesAfterArray = [[NSMutableArray alloc] init];
//     NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//     if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//     {
//         
//         NSDictionary * objectiveImage = [dictionary valueForKey:@"JobObjectiveImages"];
//         for(NSDictionary *imageDict in objectiveImage)
//         {
//             JobObjectiveImage *images = [[JobObjectiveImage alloc]init];
//             images.jobObjectiveId = [[imageDict objectForKey:@"JobObjectiveId"]integerValue];
//             images.jobObjectiveImageId = [[imageDict objectForKey:@"JobObjectiveImageId"]integerValue];
//             NSString *completeImgLink = [NSString stringWithFormat:@"%@%@",Image_BASE_URL,[imageDict objectForKey:@"Image"]];
//             images.imageLink = completeImgLink;//[imageDict objectForKey:@"Image"];
//             images.imageType = [imageDict objectForKey:@"ImageType"];
//             images.latitude = [imageDict objectForKey:@"Latitude"];
//             images.longitude = [imageDict objectForKey:@"Longitude"];
//             images.createdDate = [imageDict objectForKey:@"CreatedDate"];
//             if([images.imageType isEqualToString:@"After"])
//             {
//                 [refreshedImagesBeforeArray addObject:images];
//             }
//             else
//             {
//                 [refreshedImagesAfterArray addObject:images];
//             }
//             
//         }
//
//         // set delegate for return objective
//         [self.selectedValueDelegate jobObjectiveAddImageAfter:refreshedImagesBeforeArray afterImages:refreshedImagesAfterArray withStatus:[responseDict objectForKey:@"Message"]];
//       
//     }
//    
//    else
//    {
//        [self.selectedValueDelegate jobObjectiveAddImageAfter:refreshedImagesBeforeArray afterImages:refreshedImagesAfterArray withStatus:[responseDict objectForKey:@"Message"]];
//        
//    }
//
//}
//
//-(void)parseUpdateJobObjectiveImage:(NSDictionary*)dictionary
//{
//    
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    [self.selectedValueDelegate updateJobObjectiveWithStatus:[responseDict objectForKey:@"Message"]];
////    JobObjective *objective = [[JobObjective alloc]init];
////    NSMutableArray *objectiveArray  = [NSMutableArray array];
////    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
////    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
////    {
////        NSDictionary * jobObjective = [dictionary valueForKey:@"JobObjectives"];
////        for(NSDictionary *jobObjDict in jobObjective)
////        {
////            
////            objective.objectiveID = [[jobObjDict objectForKey:@"JobObjectiveId"]integerValue];
////            objective.jobID = [[jobObjDict objectForKey:@"JobId"]integerValue];
////            objective.objectiveTitle = [jobObjDict objectForKey:@"Objective"];
////            
////            // objective Image
////            NSDictionary * objectiveImage = [jobObjDict valueForKey:@"JobObjectiveImages"];
////            for(NSDictionary *imageDict in objectiveImage)
////            {
////                JobObjectiveImage *images = [[JobObjectiveImage alloc]init];
////                images.jobObjectiveImageId = [[imageDict objectForKey:@"JobObjectiveImageId"]integerValue];
////                NSString *completeImgLink = [NSString stringWithFormat:@"%@%@",Image_BASE_URL,[imageDict objectForKey:@"Image"]];
////                images.imageLink = completeImgLink;//[imageDict objectForKey:@"Image"];
////                images.imageType = [imageDict objectForKey:@"ImageType"];
////                images.latitude = [imageDict objectForKey:@"Latitude"];
////                images.longitude = [imageDict objectForKey:@"Longitude"];
////                images.createdDate = [imageDict objectForKey:@"CreatedDate"];
////                if([images.imageType isEqualToString:@"After"])
////                {
////                    [objective.afterPicsArray addObject:images];
////                }
////                else
////                {
////                    [objective.beforePicsArray addObject:images];
////                }
////                
////            }
////            
////            [objectiveArray addObject:objective];
////        }
////        
////        /// set delegate for objective for success
////      
////    }
////    
////    else
////    {
////        /// set delegate for objective for not success
////        
////        
////    }
//
//
//}
//
//
//-(void)parseDeleteObjective:(NSDictionary*)dictionary
//{
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    [self.selectedValueDelegate deleteJobObjectiveWithStatus:[responseDict objectForKey:@"Message"]];
////    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
////    {
////        // set succeess
////    }
////    else
////    {
////         // set failure
////    }
//}
//
//
//-(void)parseDeleteObjectiveImage:(NSDictionary*)dictionary
//{
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    [self.selectedValueDelegate deleteJobObjectiveImageWithStatus:[responseDict objectForKey:@"Message"]];
////    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
////    {
////        // set succeess
////    }
////    else
////    {
////        // set failure
////    }
//
//}
//
//
//-(void)parseDeleteJobMaterial:(NSDictionary*)dictionary
//{
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    
//      [self.selectedValueDelegate deleteJobMeterialWithStatus:[responseDict objectForKey:@"Message"]];
////    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
////    {
////        // set succeess
////    }
////    else
////    {
////        // set failure
////    }
//
//}
//
//-(void)parseAllEmployeesForAttendence:(NSDictionary*)dictionary
//{
//
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    NSMutableArray *employeeArray = [NSMutableArray array];
//    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
//    {
//        
//        // All Employee
//        NSDictionary *employeeDict = [dictionary objectForKey:@"EmployeesAttendance"];
//        for(NSDictionary *employe in employeeDict)
//        {
//            Technician *tech = [[Technician alloc]init];
//            tech.employeeID = [[employe objectForKey:@"EmployeeId"]integerValue];
//            tech.name = [employe objectForKey:@"Name"];
//            tech.isCheckedIn = [[employe objectForKey:@"IsCheckedIn"]integerValue];
//            [employeeArray addObject:tech];
//            
//        }
//        [self.selectedValueDelegate allEmployee:employeeArray WithStatus:[responseDict objectForKey:@"Message"]];
//        // set success Delegate
//    }
//    else
//    {
//        [self.selectedValueDelegate allEmployee:employeeArray WithStatus:[responseDict objectForKey:@"Message"]];
//        // set error Delegate
//    }
//}
//
//
//-(void)parseMarkAttendence:(NSDictionary*)dictionary
//{
//
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    [self.selectedValueDelegate clockInResponseWithStatus:[responseDict objectForKey:@"Message"]];
//
////    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
////    if([[responseDict objectForKey:@"Message"]isEqualToString:@"Success"])
////    {
////        // set succeess
////    }
////    else
////    {
////        // set failure
////    }
//    
//}
//
//-(void)parseCreateNewJob:(NSDictionary*)dictionary
//{
//    
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    [self.selectedValueDelegate createJobReturningStatus:[responseDict objectForKey:@"Message"]];
//}
//
//-(void)parseUpdateJobStatus:(NSDictionary*)dictionary
//{
//    NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    int timeSpent = [[dictionary objectForKey:@"TimeSpent"] integerValue];
//    NSString *jobStatus = [dictionary objectForKey:@"JobStatus"];
////    if([[responseDict objectForKey:@"Message"] isEqualToString:@"Success"])
////    {
////    
////    }
//
//    [self.selectedValueDelegate updateJobStatusTimeSpent:timeSpent withStatus:[responseDict objectForKey:@"Message"] withJobStatus:jobStatus];
//
//    
//}
//
//-(void)parseForgotPassword:(NSDictionary*)dictionary
//{
//
//     NSDictionary *responseDict = [dictionary valueForKey:@"Response"];
//    [Utilities simpleOkAlertBox:@"Alert" Body:[responseDict objectForKey:@"Message"] delegate:nil];
//}

@end
