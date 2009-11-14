//
//  Connector.h
//  vidhub-iphone
//
//  Created by Sam Schroeder on 6/17/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//
//  The sole responsibility of the Connector is to communicate with to the web service.
//	It passes on data sent to it from the application or web server.  It does no direct processing
//	on the data.

#import "MultipartForm.h"

@interface Connector : NSObject

/***************************************************************************************
 * Issues an HTTP call to URL with the given HTTPMethod (GET, POST, PUT, DELETE supported)
 * If dataDictionary is non-nil, the JSON representation of it will be sent
 * as the request body.
 ***************************************************************************************/
+ (NSString *) retrieveJSONFromURL:(NSURL *)url 
                    withHTTPMethod:(NSString *)method
                withDataDictionary:(NSDictionary *)dataDictionary;


/***************************************************************************************
 * Sends fileName to URL using the given HTTP method (POST, PUT supported)
 * If dataDictionary is non-nil, the JSON representation is added to a "data" form field
 ***************************************************************************************/
+ (BOOL) sendFile:(NSString *)fileName 
            toURL:(NSURL *)url 
    withFieldName:(NSString *)fieldName
   withHTTPMethod:(NSString *)method withDataDictionary:(NSDictionary *)dataDictionary;

    
@end
