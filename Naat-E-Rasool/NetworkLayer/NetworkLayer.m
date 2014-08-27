//
//  NetworkLayer.m
//  XiiaLive
//
//  Created by Mohsin Yaqoob on 26/09/2013.
//  Copyright (c) 2013 SDSol. All rights reserved.
//

#import "NetworkLayer.h"
#import "AFHTTPRequestOperation.h"
#import "ParseResponse.h"
#import "AppDelegate.h"




@implementation NetworkLayer


+ (NetworkLayer *)sharedNetworkLayer
{
    NSString *urlStr = BASE_URL;
    
    static dispatch_once_t pred;
    static NetworkLayer *_sharedNetworkLayer = nil;
    dispatch_once(&pred, ^{ _sharedNetworkLayer = [[self alloc] initWithBaseURL:[NSURL URLWithString:urlStr]]; });
    return _sharedNetworkLayer;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    
    //[self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    //    [self registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    //    [self setDefaultHeader:@"Accept" value:@"text/xml"];
    
    return self;
}
-(void)getAllCategories
{
        [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [self showHUD];
        NSString *URL = [NSString stringWithFormat:@"%@all_Cat",BASE_URL];
        [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
            NSDictionary *responseDictionary = (NSDictionary*)responseObject;
            NSLog(@"signIn response: %@", responseObject);
    
            [[ParseResponse sharedParseResponse] parseAllCategories:responseDictionary];
            // Notify Listner
           // [[NSNotificationCenter defaultCenter] postNotificationName:signInAPIResponse object:nil userInfo:nil];
            [self removeHUD];
        }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              // Notify Listner
              [self removeHUD];
//              [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//              [[NSNotificationCenter defaultCenter] postNotificationName:signInAPIResponseError object:nil userInfo:nil];
              NSLog(@"%@",error);
              
          }];
}

-(void)subCategoriesForSpecificID:(int)catId
{

    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [self showHUD];
    NSString *URL = [NSString stringWithFormat:@"%@sub_Cat?cat_id=%d",BASE_URL,catId];
    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
        NSLog(@"signIn response: %@", responseObject);
        
        [[ParseResponse sharedParseResponse]subCategories:responseDictionary];
        // Notify Listner
        //[[NSNotificationCenter defaultCenter] postNotificationName:signInAPIResponse object:nil userInfo:nil];
        [self removeHUD];
    }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          // Notify Listner
          [self removeHUD];
          //              [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
          //              [[NSNotificationCenter defaultCenter] postNotificationName:signInAPIResponseError object:nil userInfo:nil];
          NSLog(@"%@",error);
          
      }];
}

//-(void)getUserProfileWithUserName:(NSString*)userName password:(NSString*)password {
//    
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@signin?Username=%@&Password=%@",BASE_URL,userName,password];
//    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"signIn response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseSignInResponse:responseDictionary];
//        // Notify Listner
//        [[NSNotificationCenter defaultCenter] postNotificationName:signInAPIResponse object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//          [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          [[NSNotificationCenter defaultCenter] postNotificationName:signInAPIResponseError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//      }];
//}
//
//-(void)getAllJobListAgainstEmployeeID:(int)employeeID;
//{
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@GetJobsList?EmployeeId=%d",BASE_URL,employeeID];
//    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"signIn response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseSignInResponse:responseDictionary];
//        // Notify Listner
//        [[NSNotificationCenter defaultCenter] postNotificationName:signInAPIResponse object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//           [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          [[NSNotificationCenter defaultCenter] postNotificationName:signInAPIResponseError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//      }];
//
//
//}
//
//
//-(void)jobDetail:(int)JobId
//{
//    
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@GetJobDetail?JobId=%d",BASE_URL,JobId];
//    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseJobDetailResponse:responseDictionary];
//        // Notify Listner
//        [[NSNotificationCenter defaultCenter] postNotificationName:jobDetailSuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//           [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          [[NSNotificationCenter defaultCenter] postNotificationName:jobDetailError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//      }];
//    
//}
//
//
//-(void)checkListDetail:(NSString*)checkListType
//{
//    
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@GetChecklistDetail?ChecklistType=%@",BASE_URL,checkListType];
//    NSLog(@"%@",URL);
//    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseCheckListResponse:responseDictionary];
//        // Notify Listner
//        [[NSNotificationCenter defaultCenter] postNotificationName:checkListSuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//           [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          [[NSNotificationCenter defaultCenter] postNotificationName:checkListError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//      }];
//    
//}
//
//-(void)createJobInfo
//{
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@GetCreateJobInfo",BASE_URL];
//    NSLog(@"%@",URL);
//    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseCreateJobInfo:responseDictionary];
//        // Notify Listner
//        [[NSNotificationCenter defaultCenter] postNotificationName:createJobInfoScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//           [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          [[NSNotificationCenter defaultCenter] postNotificationName:createJobInfoError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//          
//      }];
//    
//}
//
//-(void)subMitSignatureWithJobId:(int)jobId withImagePath:(NSString*)ImagePath
//{
//    
//    NSString *base64String = [Utilities setValidValueForAttribute:[Utilities encodeToBase64StringImageAtPath:ImagePath]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@SaveSignature",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSDictionary *paramDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:jobId],@"JobId",base64String,@"SignatureImage", nil];
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict
//                                                       options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData
//                                               encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self POST:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseSubmitSignature:responseDictionary];
//        // Notify Listner
//        [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           // Notify Listner
//           [self removeHUD];
//            [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//           [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//           NSLog(@"%@",error);
//           
//           
//       }];
//    
//    
//}
//
//-(void)addJobObjectives:(int)jobId withObjectiveDescription:(NSString*)objective
//{
//    
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@AddJobObjective",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSDictionary *paramDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:jobId],@"JobId",objective,@"Objective", nil];
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict
//                                                       options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData
//                                               encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self POST:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseAddJobObjectives:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           // Notify Listner
//           [self removeHUD];
//            [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//           // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//           NSLog(@"%@",error);
//           
//           
//       }];
//}
//
//
//-(void)addMeterial:(int)jobId withMaterialID:(int)materialID withMaterialQuantity:(int)quantity
//{
//    
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@AddJobMaterial",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSDictionary *paramDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:jobId],@"JobId",[NSNumber numberWithInt:materialID],@"MaterialId", [NSNumber numberWithInt:quantity],@"Quantity" ,nil];
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict
//                                                       options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData
//                                               encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self POST:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseAddMaterials:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           // Notify Listner
//           [self removeHUD];
//            [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//           // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//           NSLog(@"%@",error);
//           
//           
//       }];
//    
//}
//
//-(void)addJobNotes:(int)jobID withNotes:(NSString*)notes
//{
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@AddJobNotes",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSDictionary *paramDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:jobID],@"JobId",notes, @"Notes" ,nil];
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict
//                                                       options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData
//                                               encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self POST:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseAddNotes:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           // Notify Listner
//           [self removeHUD];
//            [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//           // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//           NSLog(@"%@",error);
//           
//           
//       }];
//    
//}
//
//
//-(void)addJobObjectiveImage:(JobObjectiveImage*)jobObjectiveImage
//{
//    //
//    //    jobObjectiveImage.jobObjectiveId = 30 ;
//    //    jobObjectiveImage.imageType = @"Before";
//    //    jobObjectiveImage.latitude = @"36.2514";
//    //    jobObjectiveImage.longitude = @"36.2514";
//    //    jobObjectiveImage.imageLink = @"/Users/Matloob/Library/Developer/CoreSimulator/Devices/42D2DD08-D896-40F4-BE19-19AA6659BF85/data/Containers/Data/Application/DD6EFDEB-C2E1-4E9C-B611-7B6F7DCF3651/Documents/5E62BBCA-C0A1-40DE-AA0E-5A9843C66167-1984-000004D0946BF4E2";
//    
//    NSString *base64String = [Utilities setValidValueForAttribute:[Utilities encodeToBase64StringImageAtPath:jobObjectiveImage.imageLink]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@AddJobObjectiveImages",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSDictionary *paramDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:jobObjectiveImage.jobObjectiveId],@"JobObjectiveId",base64String,@"ObjectiveImage",jobObjectiveImage.imageType ,@"ImageType",jobObjectiveImage.latitude,@"Latitude",jobObjectiveImage.longitude,@"Longitude", nil];
//    
//    
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict
//                                                       options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData
//                                               encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self POST:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseAddJobObjectiveImage:responseDictionary];
//        // Notify Listner
//        //  [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           // Notify Listner
//           [self removeHUD];
//            [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//           // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//           NSLog(@"%@",error);
//           
//           
//       }];
//    
//}
//
//-(void)updateJobJobObjective:(int)jobObjectiveID withObjective:(NSString *)objectiveText
//{
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@UpdateJobObjective",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSDictionary *paramDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:jobObjectiveID],@"JobObjectiveId",objectiveText, @"Objective" ,nil];
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict
//                                                       options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData
//                                               encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self PUT:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseUpdateJobObjectiveImage:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//           [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//          
//      }];
//    
//}
//
//-(void)deleteObjective:(int)jobObjectiveID
//{
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@DeleteJobObjective?JobObjectiveId=%d",BASE_URL,jobObjectiveID];
//    NSLog(@"%@",URL);
//    
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self DELETE:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseDeleteObjective:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             // Notify Listner
//             [self removeHUD];
//              [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//             // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//             NSLog(@"%@",error);
//             
//             
//         }];
//    
//    
//}
//
//-(void)deleteObjectiveImage:(int)jobObjectiveImageID
//{
//    
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@DeleteJobObjectiveImage?JobObjectiveImageId=%d",BASE_URL,jobObjectiveImageID];
//    NSLog(@"%@",URL);
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self DELETE:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseDeleteObjectiveImage:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             // Notify Listner
//             [self removeHUD];
//              [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//             // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//             NSLog(@"%@",error);
//             
//             
//         }];
//}
//
//
//-(void)deleteJobMaterial:(int)jobObMaterialID
//{
//    
//    
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@DeleteJobMaterial?JobMaterialId=%d",BASE_URL,jobObMaterialID];
//    NSLog(@"%@",URL);
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self DELETE:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseDeleteJobMaterial:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             // Notify Listner
//             [self removeHUD];
//             
//             // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//             NSLog(@"%@",error);
//             
//             
//         }];
//    
//}
//
//-(void)getAllEmployeesForAttendence
//{
//    
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@GetAllEmployeesForAttendance",BASE_URL];
//    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseAllEmployeesForAttendence:responseDictionary];
//        // Notify Listner
//        //  [[NSNotificationCenter defaultCenter] postNotificationName:jobDetailSuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//           [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          // [[NSNotificationCenter defaultCenter] postNotificationName:jobDetailError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//      }];
//    
//    
//    
//}
//
//-(void)markAttendenceWithEmployeeID:(int)employeeID withClockType:(NSString*)clockType withImage:(UIImage*)image
//{
//      [self showHUD];
//    
//    
//    UIGraphicsBeginImageContext(CGSizeMake(480,320));
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [image drawInRect: CGRectMake(0, 0, 480, 320)];
//    UIImage   *smallImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    
//     NSString * base64String =  [UIImagePNGRepresentation(smallImage) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    NSString *URL = [NSString stringWithFormat:@"%@MarkAttendance",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSDictionary *paramDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:employeeID],@"EmployeeId",base64String,@"Image",clockType,@"ClockType", nil];
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict
//                                                       options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData
//                                               encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self POST:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseMarkAttendence:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           // Notify Listner
//           [self removeHUD];
//            [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//           
//           //  [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//           NSLog(@"%@",error);
//           
//           
//       }];
//    
//    
//}
//
//
//-(void)createJobWithJobDetailObjective:(JobDetail*)jobDetail
//{
//    
//    
//    
//    if (jobDetail.jobTitle.length < 1 ||jobDetail.firstName.length < 1 || jobDetail.lastName.length < 1 || jobDetail.phoneNumber.length < 1 || jobDetail.address.length < 1 || jobDetail.city.length < 1 || jobDetail.state.length < 1 || jobDetail.zip.length < 1 || jobDetail.email.length < 1 || jobDetail.date.length < 1 ) {
//        [Utilities simpleOkAlertBox:@"Alert" Body:@"Please fill all field" delegate:nil];
//        return;
//    }
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@CreateJob",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
//    
//    NSMutableDictionary *jobdict = [NSMutableDictionary dictionary];
//    [jobdict setValue:[NSNumber numberWithInt:jobDetail.jobID] forKey:@"JobId"];
//    [jobdict setValue:jobDetail.jobTitle forKey:@"JobTitle"];
//    [jobdict setValue:jobDetail.firstName forKey:@"FirstName"];
//    [jobdict setValue:jobDetail.lastName forKey:@"LastName"];
//    [jobdict setValue:jobDetail.phoneNumber forKey:@"Phone"];
//    [jobdict setValue:jobDetail.address forKey:@"Address"];
//    [jobdict setValue:jobDetail.city forKey:@"City"];
//    [jobdict setValue:jobDetail.state forKey:@"State"];
//    [jobdict setValue:jobDetail.zip forKey:@"Zip"];
//    [jobdict setValue:jobDetail.email forKey:@"Email"];
//    [jobdict setValue:jobDetail.notes forKey:@"Notes"];
//    [jobdict setValue:@"2014-07-25 09:15:00" forKey:@"JobDate"];
//    [jobdict setValue:jobDetail.disClaimerName forKey:@"DisclaimerTitle"];
//    [jobdict setValue:jobDetail.disClaimerTitle forKey:@"DisclaimerDescription"];
//    [jobdict setValue:jobDetail.signature forKey:@"Signature"];
//    
//    [paramDict setValue:jobdict forKey:@"Job"];
//    /// employee
//    
//    NSMutableArray *employeeArray = [NSMutableArray array];
//    
//    NSMutableDictionary *dict1  = [NSMutableDictionary dictionary];
//    [dict1 setValue:kEmployeeID forKey:@"EmployeeId"];
//    [dict1 setValue:[NSNumber numberWithInt:0] forKey:@"JobEmployeeId"];
//    [dict1 setValue:kEmployeeName  forKey:@"Name"];
//    [employeeArray addObject:dict1];
//    
//    
//    [paramDict setValue:employeeArray forKey:@"JobEmployees"];
//    
//    // vehical
//    
//    NSMutableArray *vehicalArray = [NSMutableArray array];
//    
//    for( Van *van in jobDetail.vanArray)
//    {
//        NSMutableDictionary *dict  = [NSMutableDictionary dictionary];
//        [dict setValue:[NSNumber numberWithInt:0] forKey:@"JobVehicleId"];
//        [dict setValue:[NSNumber numberWithInt:van.vehicalID]  forKey:@"VehicleId"];
//        [dict setValue:van.name forKey:@"Name"];
//        [vehicalArray addObject:dict];
//    }
//    
//    [paramDict setValue:vehicalArray forKey:@"JobVehicles"];
//    
//    // Material
//    
//    NSMutableArray *materialArray = [NSMutableArray array];
//    
//    for( Material *mat in jobDetail.materialRequiredArray)
//    {
//        NSMutableDictionary *dict  = [NSMutableDictionary dictionary];
//        [dict setValue:[NSNumber numberWithInt:0] forKey:@"JobMaterialId"];
//        [dict setValue:[NSNumber numberWithInt:mat.materialId]forKey:@"MaterialId"];
//        [dict setValue:mat.materialName forKey:@"Name"];
//        [dict setValue:[NSNumber numberWithInt:mat.quantity] forKey:@"Quantity"];
//        [materialArray addObject:dict];
//    }
//    
//    [paramDict setValue:materialArray forKey:@"JobMaterials"];
//    
//    // job objective
//    
//    NSMutableArray *jobObjectiveArray = [NSMutableArray array];
//    
//    for( JobObjective *obj in jobDetail.jobObjectivesArray)
//    {
//        NSMutableDictionary *dict  = [NSMutableDictionary dictionary];
//        [dict setValue:[NSNumber numberWithInt:0] forKey:@"JobObjectiveId"];
//        [dict setValue:[NSNumber numberWithInt:0]forKey:@"JobId"];
//        [dict setValue:obj.objectiveTitle forKey:@"Objective"];
//        [dict setValue:[NSMutableArray array] forKey:@"JobObjectiveImages"];
//        [jobObjectiveArray addObject:dict];
//    }
//    
//    [paramDict setValue:jobObjectiveArray forKey:@"JobObjectives"];
//    
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict
//                                                       options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData
//                                               encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self POST:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseCreateNewJob:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//           [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//          
//      }];
//    
//}
//
//
//
//-(void)getVehicleStatus {
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@GetVehicleStatus",BASE_URL];
//    NSLog(@"%@",URL);
//    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"GetVehicleStatus response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseGetVehicleStatus:responseDictionary];
//        // Notify Listner
//        [[NSNotificationCenter defaultCenter] postNotificationName:getVehicleStatusSuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//           [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          [[NSNotificationCenter defaultCenter] postNotificationName:getVehicleStatusError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//          
//      }];
//}
//
//
//-(void)submitVehicleChecklist:(int)vehicleId :(int)employeeId :(NSString*)checklistType :(NSArray*)procedureArray
//{
//    
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@SubmitVehicleChecklist",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSMutableArray * checklistDictArray = [[NSMutableArray alloc] init];
//    for (MorningProcedure *procedure in procedureArray)
//    {
//        NSDictionary *checklistDict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:procedure.checkListID],@"ChecklistId",procedure.notes,@"AnswerText",[NSNumber numberWithInt:procedure.isChecked],@"IsSelected",nil];
//        [checklistDictArray addObject:checklistDict];
//    }
//    
//    NSDictionary *dailyChecklistDict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:vehicleId],@"VehicleId",[NSNumber numberWithInt:employeeId],@"EmployeeId",checklistType,@"ChecklistType",checklistDictArray,@"DailyChecklistDetail", nil];
//    
//    NSDictionary *paramDict = [[NSDictionary alloc] initWithObjectsAndKeys:dailyChecklistDict,@"DailyChecklist",nil];
//    
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self POST:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseSubmitVehicleChecklist:responseDictionary];
//        // Notify Listner
//        [self removeHUD];
//    }
//       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           // Notify Listner
//           [self removeHUD];
//            [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//           NSLog(@"%@",error);
//           
//           
//       }];
//    
//}
//
//
//-(void)submitJobChecklist:(int)jobId :(int)employeeId :(NSString*)checklistType :(UIImage*)image :(NSArray*)checklistArray{
//    
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@SubmitJobChecklist",BASE_URL];
//    NSLog(@"%@",URL);
//
//    NSMutableArray * checklistDictArray = [[NSMutableArray alloc] init];
//    for (CheckList *checklist in checklistArray) {
//        NSDictionary *checklistDict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:checklist.checkListID],@"ChecklistId",[NSNumber numberWithInt:checklist.isChecked],@"IsSelected",nil];
//        [checklistDictArray addObject:checklistDict];
//    }
//    
//    
//    NSString * base64String =  [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    
//    NSDictionary *jobChecklistDict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:jobId],@"JobId",[NSNumber numberWithInt:employeeId],@"EmployeeId",checklistType,@"ChecklistType",base64String,@"JobImage",checklistDictArray,@"JobChecklistDetail", nil];
//    
//    NSDictionary *paramDict = [[NSDictionary alloc] initWithObjectsAndKeys:jobChecklistDict,@"JobChecklist",nil];
//    
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self POST:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseSubmitJobChecklist:responseDictionary];
//        // Notify Listner
//        [self removeHUD];
//    }
//       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           // Notify Listner
//           [self removeHUD];
//            [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//           NSLog(@"%@",error);
//       }];
//    
//}
//
//
//-(void)updateJobStatus:(int)jobID withStatus:(NSString*)status
//{
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@UpdateJobStatus",BASE_URL];
//    NSLog(@"%@",URL);
//    
//    NSDictionary *paramDict = [[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:jobID],@"JobId",status, @"Status" ,nil];
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:paramDict
//                                                       options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSLog(@"Image :  %@",[[NSString alloc] initWithData:jsonData
//                                               encoding:NSUTF8StringEncoding]);
//    
//    BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:paramDict];
//    NSLog(@"Json Valid : %@", isTurnableToJSON ? @"Yes" : @"No");
//    
//    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:UserName password:Password];
//    
//    [self PUT:URL parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseUpdateJobStatus:responseDictionary];
//        // Notify Listner
//        // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturScuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//           [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          // [[NSNotificationCenter defaultCenter] postNotificationName:submitSignaturError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//          
//      }];
//
//}
//
//-(void)forgotpassword:(NSString*)email
//{
//    
//    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self showHUD];
//    NSString *URL = [NSString stringWithFormat:@"%@ForgotPassword?Email=%@",BASE_URL,email];
//    [self GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"jobDetail response: %@", responseObject);
//        
//        [[ParseResponse sharedParseResponse] parseForgotPassword:responseDictionary];
//        // Notify Listner
//        //  [[NSNotificationCenter defaultCenter] postNotificationName:jobDetailSuccess object:nil userInfo:nil];
//        [self removeHUD];
//    }
//      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          // Notify Listner
//          [self removeHUD];
//          [Utilities simpleOkAlertBox:@"Alert" Body:@"Some thing going wrong please check your internet connectivity and try again" delegate:nil];
//          // [[NSNotificationCenter defaultCenter] postNotificationName:jobDetailError object:nil userInfo:nil];
//          NSLog(@"%@",error);
//          
//      }];
//
//}
//

#pragma mark - MBProgressHUD

-(void)showHUD {
    [self removeHUD];
    UIWindow * window = APP_DELEGATE.window;
    self.HUD = [[MBProgressHUD alloc] initWithWindow:window];
    [window addSubview:self.HUD];
    self.HUD.labelText = @"Loading";
    self.HUD.detailsLabelText = @"Please wait";
    [self.HUD show:YES];
}

-(void)removeHUD {
    
    [self.HUD hide:YES];
    [self.HUD removeFromSuperview];
}

@end
