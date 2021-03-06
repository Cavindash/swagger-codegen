#import "RVBPetApi.h"
#import "NIKFile.h"
#import "RVBPet.h"



@implementation RVBPetApi
static NSString * basePath = @"http://petstore.swagger.wordnik.com/api";

@synthesize queue = _queue;
@synthesize api = _api;

+(RVBPetApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {
    static RVBPetApi* singletonAPI = nil;

    if (singletonAPI == nil) {
        singletonAPI = [[RVBPetApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

-(id) init {
    self = [super init];
    _queue = [[NSOperationQueue alloc] init];
    _api = [NIKApiInvoker sharedInstance];

    return self;
}

-(void) addHeader:(NSString*) value
           forKey:(NSString*)key {
    [_api addHeader:value forKey:key];
}

-(void) getPetByIdWithCompletionBlock:(NSString*) petId
        completionHandler: (void (^)(RVBPet* output, NSError* error))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet/{petId}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"petId", @"}"]] withString: [_api escapeString:petId]];
    NSString* contentType = @"application/json";


        NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
        if(petId == nil) {
        // error
    }
    [_api dictionary:requestUrl 
              method:@"GET" 
         queryParams:queryParams 
                body:bodyDictionary 
        headerParams:headerParams
         contentType:contentType
     completionBlock:^(NSDictionary *data, NSError *error) {
        if (error) {
            completionBlock(nil, error);return;
        }

        completionBlock( [[RVBPet alloc]initWithValues: data], nil);}];
    

}

-(void) deletePetWithCompletionBlock:(NSString*) petId
        completionHandler: (void (^)(NSError* error))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet/{petId}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"petId", @"}"]] withString: [_api escapeString:petId]];
    NSString* contentType = @"application/json";


        NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
        if(petId == nil) {
        // error
    }
    [_api stringWithCompletionBlock:requestUrl 
                             method:@"DELETE" 
                        queryParams:queryParams 
                               body:bodyDictionary 
                       headerParams:headerParams
                        contentType:contentType
                    completionBlock:^(NSString *data, NSError *error) {
        if (error) {
            completionBlock(error);
            return;
        }
        completionBlock(nil);
    }];
    

}

-(void) addPetWithCompletionBlock:(RVBPet*) body
        completionHandler: (void (^)(NSError* error))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    NSString* contentType = @"application/json";


        NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
        if(body != nil && [body isKindOfClass:[NSArray class]]){
        NSMutableArray * objs = [[NSMutableArray alloc] init];
        for (id dict in (NSArray*)body) {
            if([dict respondsToSelector:@selector(asDictionary)]) {
                [objs addObject:[(NIKSwaggerObject*)dict asDictionary]];
            }
            else{
                [objs addObject:dict];
            }
        }
        bodyDictionary = objs;
    }
    else if([body respondsToSelector:@selector(asDictionary)]) {
        bodyDictionary = [(NIKSwaggerObject*)body asDictionary];
    }
    else if([body isKindOfClass:[NSString class]]) {
        bodyDictionary = body;
    }
    else if([body isKindOfClass: [NIKFile class]]) {
        contentType = @"form-data";
        bodyDictionary = body;
    }
    else{
        NSLog(@"don't know what to do with %@", body);
    }

    if(body == nil) {
        // error
    }
    [_api stringWithCompletionBlock:requestUrl 
                             method:@"POST" 
                        queryParams:queryParams 
                               body:bodyDictionary 
                       headerParams:headerParams
                        contentType:contentType
                    completionBlock:^(NSString *data, NSError *error) {
        if (error) {
            completionBlock(error);
            return;
        }
        completionBlock(nil);
    }];
    

}

-(void) updatePetWithCompletionBlock:(RVBPet*) body
        completionHandler: (void (^)(NSError* error))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    NSString* contentType = @"application/json";


        NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
        if(body != nil && [body isKindOfClass:[NSArray class]]){
        NSMutableArray * objs = [[NSMutableArray alloc] init];
        for (id dict in (NSArray*)body) {
            if([dict respondsToSelector:@selector(asDictionary)]) {
                [objs addObject:[(NIKSwaggerObject*)dict asDictionary]];
            }
            else{
                [objs addObject:dict];
            }
        }
        bodyDictionary = objs;
    }
    else if([body respondsToSelector:@selector(asDictionary)]) {
        bodyDictionary = [(NIKSwaggerObject*)body asDictionary];
    }
    else if([body isKindOfClass:[NSString class]]) {
        bodyDictionary = body;
    }
    else if([body isKindOfClass: [NIKFile class]]) {
        contentType = @"form-data";
        bodyDictionary = body;
    }
    else{
        NSLog(@"don't know what to do with %@", body);
    }

    if(body == nil) {
        // error
    }
    [_api stringWithCompletionBlock:requestUrl 
                             method:@"PUT" 
                        queryParams:queryParams 
                               body:bodyDictionary 
                       headerParams:headerParams
                        contentType:contentType
                    completionBlock:^(NSString *data, NSError *error) {
        if (error) {
            completionBlock(error);
            return;
        }
        completionBlock(nil);
    }];
    

}

-(void) findPetsByStatusWithCompletionBlock:(NSString*) status
        completionHandler: (void (^)(NSArray* output, NSError* error))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet/findByStatus", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    NSString* contentType = @"application/json";


        NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(status != nil)
        queryParams[@"status"] = status;
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
        if(status == nil) {
        // error
    }
    [_api dictionary: requestUrl 
              method: @"GET" 
         queryParams: queryParams 
                body: bodyDictionary 
        headerParams: headerParams
         contentType: contentType
     completionBlock: ^(NSDictionary *data, NSError *error) {
        if (error) {
            completionBlock(nil, error);return;
        }
        
        if([data isKindOfClass:[NSArray class]]){
            NSMutableArray * objs = [[NSMutableArray alloc] initWithCapacity:[data count]];
            for (NSDictionary* dict in (NSArray*)data) {
                RVBPet* d = [[RVBPet alloc]initWithValues: dict];
                [objs addObject:d];
            }
            completionBlock(objs, nil);
        }
        }];
    

}

-(void) findPetsByTagsWithCompletionBlock:(NSString*) tags
        completionHandler: (void (^)(NSArray* output, NSError* error))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet/findByTags", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    NSString* contentType = @"application/json";


        NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(tags != nil)
        queryParams[@"tags"] = tags;
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
        if(tags == nil) {
        // error
    }
    [_api dictionary: requestUrl 
              method: @"GET" 
         queryParams: queryParams 
                body: bodyDictionary 
        headerParams: headerParams
         contentType: contentType
     completionBlock: ^(NSDictionary *data, NSError *error) {
        if (error) {
            completionBlock(nil, error);return;
        }
        
        if([data isKindOfClass:[NSArray class]]){
            NSMutableArray * objs = [[NSMutableArray alloc] initWithCapacity:[data count]];
            for (NSDictionary* dict in (NSArray*)data) {
                RVBPet* d = [[RVBPet alloc]initWithValues: dict];
                [objs addObject:d];
            }
            completionBlock(objs, nil);
        }
        }];
    

}

-(void) getPetByIdAsJsonWithCompletionBlock :(NSString*) petId 

        completionHandler:(void (^)(NSString*, NSError *))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet/{petId}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@""];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"petId", @"}"]] withString: [_api escapeString:petId]];
    NSString* contentType = @"application/json";

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
    if(petId == nil) {
        // error
    }
    [_api dictionary:requestUrl 
              method:@"GET" 
         queryParams:queryParams 
                body:bodyDictionary 
        headerParams:headerParams
         contentType:contentType
     completionBlock:^(NSDictionary *data, NSError *error) {
        if (error) {
            completionBlock(nil, error);return;
        }

        NSData * responseData = nil;
            if([data isKindOfClass:[NSDictionary class]]){
                responseData = [NSJSONSerialization dataWithJSONObject:data
                                                               options:kNilOptions error:&error];
            }
            else if ([data isKindOfClass:[NSArray class]]){
                responseData = [NSJSONSerialization dataWithJSONObject:data
                                                               options:kNilOptions error:&error];
            }
            NSString * json = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
            completionBlock(json, nil);
        

    }];


}

-(void) deletePetAsJsonWithCompletionBlock :(NSString*) petId 

        completionHandler:(void (^)(NSError *))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet/{petId}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@""];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"petId", @"}"]] withString: [_api escapeString:petId]];
    NSString* contentType = @"application/json";

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
    if(petId == nil) {
        // error
    }
    [_api dictionary:requestUrl 
              method:@"DELETE" 
         queryParams:queryParams 
                body:bodyDictionary 
        headerParams:headerParams
         contentType:contentType
     completionBlock:^(NSDictionary *data, NSError *error) {
        if (error) {
            completionBlock(error);return;
        }

        completionBlock(nil);

    }];


}

-(void) addPetAsJsonWithCompletionBlock :(RVBPet*) body 

        completionHandler:(void (^)(NSError *))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@""];

    NSString* contentType = @"application/json";

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
    if(body != nil && [body isKindOfClass:[NSArray class]]){
        NSMutableArray * objs = [[NSMutableArray alloc] init];
        for (id dict in (NSArray*)body) {
            if([dict respondsToSelector:@selector(asDictionary)]) {
                [objs addObject:[(NIKSwaggerObject*)dict asDictionary]];
            }
            else{
                [objs addObject:dict];
            }
        }
        bodyDictionary = objs;
    }
    else if([body respondsToSelector:@selector(asDictionary)]) {
        bodyDictionary = [(NIKSwaggerObject*)body asDictionary];
    }
    else if([body isKindOfClass:[NSString class]]) {
        bodyDictionary = body;
    }
    else{
        NSLog(@"don't know what to do with %@", body);
    }

    if(body == nil) {
        // error
    }
    [_api dictionary:requestUrl 
              method:@"POST" 
         queryParams:queryParams 
                body:bodyDictionary 
        headerParams:headerParams
         contentType:contentType
     completionBlock:^(NSDictionary *data, NSError *error) {
        if (error) {
            completionBlock(error);return;
        }

        completionBlock(nil);

    }];


}

-(void) updatePetAsJsonWithCompletionBlock :(RVBPet*) body 

        completionHandler:(void (^)(NSError *))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@""];

    NSString* contentType = @"application/json";

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
    if(body != nil && [body isKindOfClass:[NSArray class]]){
        NSMutableArray * objs = [[NSMutableArray alloc] init];
        for (id dict in (NSArray*)body) {
            if([dict respondsToSelector:@selector(asDictionary)]) {
                [objs addObject:[(NIKSwaggerObject*)dict asDictionary]];
            }
            else{
                [objs addObject:dict];
            }
        }
        bodyDictionary = objs;
    }
    else if([body respondsToSelector:@selector(asDictionary)]) {
        bodyDictionary = [(NIKSwaggerObject*)body asDictionary];
    }
    else if([body isKindOfClass:[NSString class]]) {
        bodyDictionary = body;
    }
    else{
        NSLog(@"don't know what to do with %@", body);
    }

    if(body == nil) {
        // error
    }
    [_api dictionary:requestUrl 
              method:@"PUT" 
         queryParams:queryParams 
                body:bodyDictionary 
        headerParams:headerParams
         contentType:contentType
     completionBlock:^(NSDictionary *data, NSError *error) {
        if (error) {
            completionBlock(error);return;
        }

        completionBlock(nil);

    }];


}

-(void) findPetsByStatusAsJsonWithCompletionBlock :(NSString*) status 

        completionHandler:(void (^)(NSString*, NSError *))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet/findByStatus", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@""];

    NSString* contentType = @"application/json";

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(status != nil)
        queryParams[@"status"] = status;
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
    if(status == nil) {
        // error
    }
    [_api dictionary:requestUrl 
              method:@"GET" 
         queryParams:queryParams 
                body:bodyDictionary 
        headerParams:headerParams
         contentType:contentType
     completionBlock:^(NSDictionary *data, NSError *error) {
        if (error) {
            completionBlock(nil, error);return;
        }

        NSData * responseData = nil;
            if([data isKindOfClass:[NSDictionary class]]){
                responseData = [NSJSONSerialization dataWithJSONObject:data
                                                               options:kNilOptions error:&error];
            }
            else if ([data isKindOfClass:[NSArray class]]){
                responseData = [NSJSONSerialization dataWithJSONObject:data
                                                               options:kNilOptions error:&error];
            }
            NSString * json = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
            completionBlock(json, nil);
        

    }];


}

-(void) findPetsByTagsAsJsonWithCompletionBlock :(NSString*) tags 

        completionHandler:(void (^)(NSString*, NSError *))completionBlock{

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/pet/findByTags", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@""];

    NSString* contentType = @"application/json";

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(tags != nil)
        queryParams[@"tags"] = tags;
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    id bodyDictionary = nil;
    if(tags == nil) {
        // error
    }
    [_api dictionary:requestUrl 
              method:@"GET" 
         queryParams:queryParams 
                body:bodyDictionary 
        headerParams:headerParams
         contentType:contentType
     completionBlock:^(NSDictionary *data, NSError *error) {
        if (error) {
            completionBlock(nil, error);return;
        }

        NSData * responseData = nil;
            if([data isKindOfClass:[NSDictionary class]]){
                responseData = [NSJSONSerialization dataWithJSONObject:data
                                                               options:kNilOptions error:&error];
            }
            else if ([data isKindOfClass:[NSArray class]]){
                responseData = [NSJSONSerialization dataWithJSONObject:data
                                                               options:kNilOptions error:&error];
            }
            NSString * json = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
            completionBlock(json, nil);
        

    }];


}


@end
