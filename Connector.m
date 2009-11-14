//
//  Connector.m
//  vidhub-iphone
//
//  Created by Sam Schroeder on 6/17/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//
//  The sole responsibility of the Connector is to communicate with to the MobileVidHub web service.
//	It passes on data sent to it from the application or web server.  It does no direct processing
//	on the data.

#import "Connector.h"
#import "MultipartForm.h"

@interface Connector() 
+ (NSMutableURLRequest *) jsonURLRequest:(NSURL *)url 
                          withHTTPMethod:(NSString *)method 
                      withDataDictionary:(NSDictionary *)dictionary;
@end
@implementation Connector

#pragma mark -
#pragma mark Class Methods

+ (NSMutableURLRequest *) jsonURLRequest:(NSURL *) url
                          withHTTPMethod:(NSString *)method
                       withDataDictionary:(NSDictionary *)dataDictionary {
  
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                         cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                     timeoutInterval:30.0];
    
    NSAssert(([method compare:@"GET"] == NSOrderedSame || 
             [method compare:@"POST"] == NSOrderedSame || 
             [method compare:@"PUT"] == NSOrderedSame || 
             [method compare:@"DELETE"] == NSOrderedSame), @"Invalid HTTP method");
    
    [request setHTTPMethod:method];


    if(dataDictionary != nil) {
        // NSDictionary *bodyDictionary = [NSDictionary dictionaryWithObjectsAndKeys: [dataDictionary JSONRepresentation], @"data", nil];
        NSString *jsonString = [dataDictionary JSONRepresentation];
        
        NSData *jsonBody = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];      
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
        [request setHTTPBody:jsonBody];
    }
    
    return request;    
}

+ (NSString *) retrieveJSONFromURL:(NSURL *)url 
                    withHTTPMethod:(NSString *)method
                withDataDictionary:(NSDictionary *)dataDictionary{
	
    NSMutableURLRequest *req = [self jsonURLRequest:url
                                     withHTTPMethod:method
                                 withDataDictionary:dataDictionary];
    
	NSData *urlData;
	NSURLResponse *response;
	NSError *error = nil;
	
	urlData = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];
    
    if(error != nil) {
        NSLog(@"error retrieving JSON:%@", [error localizedDescription]);
        return [NSString stringWithFormat:@"ERROR: %@", [error localizedDescription]];
    }
    if([response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *)response;
        if([httpResp statusCode] >= 400) { // mayday
            NSLog(@"server returned error code: %d", [httpResp statusCode]);
            return FALSE;
        } 
    }
	NSString *str = [[[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding] autorelease];
	
	DevLog3(@"Retrieved JSON from URL: %@ \n%@", url, str);

	return str;

}
+ (BOOL) sendFile:(NSString *)fileName 
            toURL:(NSURL *)url 
    withFieldName:(NSString *)fieldName
   withHTTPMethod:(NSString *)method withDataDictionary:(NSDictionary *)dataDictionary {
    
    // Create multipart form
    MultipartForm *form = [[[MultipartForm alloc] initWithURL:url] autorelease];
    if(dataDictionary != nil) {
        [form addFormField:@"data" withStringData:[dataDictionary JSONRepresentation]];
    }
    
    [form addFormField:@"_method" withStringData:method];
    [form addFile:fileName withFieldName:fieldName];
    NSMutableURLRequest *request = [form mpfRequest];
   
    
    NSData *urlData;
	NSURLResponse *response;
	NSError *error = nil;
	
    NSLog(@"posting file to:%@", [url absoluteString]);
    NSLog(@"with dataDictionary:%@", [dataDictionary JSONRepresentation]);
	urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	
    if(error != nil) {
        NSLog(@"error sending file: %@", [error localizedDescription]);
        return FALSE;
    }
    if([response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *)response;
        if([httpResp statusCode] >= 400) { // mayday
            NSLog(@"server returned error code: %d", [httpResp statusCode]);
            return FALSE;
        } 
    }
    NSString *resp = [[[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding] autorelease];
	NSLog(@"post URL response: %@", resp);
    return TRUE;
}

@end
