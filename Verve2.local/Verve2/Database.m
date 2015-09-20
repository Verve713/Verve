//
//  DatabaseController.m
//  Verve2
//
//  Created by Verve on 8/29/15.
//  Copyright (c) 2015 MyLife. All rights reserved.
//

#import "Database.h"
#import "Event.h"
#import "User.h"

@interface Database ()

@end

NSString *verveDBString = @"Verve.db";


@implementation Database
/*@synthesize user;
@synthesize email;
@synthesize listNames;
@synthesize ider;*/

- (void)viewDidLoad {
    //[super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    //[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (User *)getUserInfoWithUsername:(NSString *) userName withPassword:(NSString *) userPassword
{
    User *userInfo;
    NSString *paths=[self getWritableDBPath];
    
    [self createEditableCopyOfDatabaseIfNeeded];
    const char *dbpath =  [paths UTF8String];
    sqlite3_stmt    *statement;
    static sqlite3 *database = nil;
    
    if (sqlite3_open_v2(dbpath, &database, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT userid, username, password, email, firstname, lastname FROM users WHERE username='%@' AND password='%@'",userName, userPassword];
        
        const char *query_stmt = [querySQL UTF8String];
        
        //  NSLog(@"Databasae opened = %@", userN);
        
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while(sqlite3_step(statement) == SQLITE_ROW)
            {
                userInfo = [[User alloc] init];
                userInfo.userID = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                userInfo.userName = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                userInfo.userPassword = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                userInfo.userEmail = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                userInfo.userFirstName = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                userInfo.userLastName = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                //userInfo.userPhoto = [[NSData alloc]initWithBytes:sqlite3_column_blob(statement, 6) length:sqlite3_column_bytes(statement, 6)];

            }
            
        }
        else
            NSLog(@"Database returned error %d: %s", sqlite3_errcode(database), sqlite3_errmsg(database));
    }
    return userInfo;
}

- (NSMutableArray *)populateEventsForUser:(NSString *) userID {
    //========================VIEW=========================
    
    /*NSString * eventId;
    NSString * user;*/
    Event *eventInfo;
    NSString *hostID;
    NSString *eventName;
    NSString *myLine=@"";
    NSString *paths=[self getWritableDBPath];
    
    [self createEditableCopyOfDatabaseIfNeeded];
    NSMutableArray *eventArray = [[NSMutableArray alloc] init];
    const char *dbpath =  [paths UTF8String];
    sqlite3_stmt    *statement;
    static sqlite3 *database = nil;
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        /*(const char *) dbpath = 0x00007f90d2450f50 "/Users/Verve/Library/Developer/CoreSimulator/Devices/B963FA7A-D54B-4957-BB3D-FF4BD057513B/data/Containers/Data/Application/EEF3DBF6-9A2A-4E53-B397-93420145B79D/Documents/Verve.db"*/
        /*NSString * sState=@"UPDATE users SET username='";
        NSString * sState2=@"', email='";
        NSString * sState3=@"' WHERE id='";*/
        //userID=@"1";
        //NSString * s=  [NSString stringWithFormat:@"%@%@%@%@%@%@%@",sState,theU,sState2,theE,sState3,theID,sState4];
        NSString *querySQL = [NSString stringWithFormat: @"SELECT id, eventname, location, date, time, type, hostid, photo FROM events WHERE hostid='%@'",userID];
        
        const char *query_stmt = [querySQL UTF8String];
        
        //  NSLog(@"Databasae opened = %@", userN);
        
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while(sqlite3_step(statement) == SQLITE_ROW)
            {
                eventInfo = [[Event alloc] init];
                eventInfo.eventID = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                eventInfo.eventName = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                eventInfo.eventLocation = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                eventInfo.eventDate = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                eventInfo.eventTime = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                eventInfo.eventType = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                eventInfo.eventHost = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                eventInfo.eventPhoto = [[NSData alloc]initWithBytes:sqlite3_column_blob(statement, 7) length:sqlite3_column_bytes(statement, 7)];

                //theID = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                [eventArray addObject:eventInfo];
                myLine= [NSString stringWithFormat:@"%@%@",myLine,eventName];
                
                
            }
            //  username.text=@"No Username";
            
            
            sqlite3_finalize(statement);
        }
        else
        {
            char *errMsg;
            if (sqlite3_exec(database, query_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create table: %s", sqlite3_errmsg(database));
            }
        }
        //  NSLog( @"Save Error: %s", sqlite3_errmsg(database) );
        
        sqlite3_close(database);
    }
    //  NSLog(@"user = %@", userN);
    
    //listNames.text=myLine;
    
    return eventArray;
}

- (IBAction)deleteName:(id)sender {//==============================DELETE=======================
    
    // Copy the database if needed
    [self createEditableCopyOfDatabaseIfNeeded];
    
    NSString *filePath = [self getWritableDBPath];
    
    sqlite3 *database;
    NSString * theID=@"1111";//ider.text;
    
    
    if(sqlite3_open([filePath UTF8String], &database) == SQLITE_OK) {
        
        NSString * sState=@"DELETE FROM users WHERE id='";
        
        
        NSString * s=  [NSString stringWithFormat:@"%@%@%@",sState,theID,@"';"];
        
        const char *sqlStatement = [s cStringUsingEncoding:NSUTF8StringEncoding];//"DELETE FROM users WHERE id='3';";
        sqlite3_stmt *compiledStatement;
        sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
        
        
        if(sqlite3_step(compiledStatement) != SQLITE_DONE ) {
            NSLog( @"Save Error: %s", sqlite3_errmsg(database) );
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
    
}


- (IBAction)addName:(id)sender {
    //[self saveUserInDatabase];
}

/*- (IBAction)update:(id)sender {//=======================UPDATE=================================
    
    // Copy the database if needed
    [self createEditableCopyOfDatabaseIfNeeded];
    
    NSString *filePath = [self getWritableDBPath];
    
    sqlite3 *database;
    NSString * usernameStr=user.text;
    NSString * emailStr=email.text;
    NSInteger * idInt=ider.text;
    
    if(sqlite3_open([filePath UTF8String], &database) == SQLITE_OK) {
        NSString * sState=@"UPDATE users SET username='";
        NSString * sState2=@"', email='";
        NSString * sState3=@"' WHERE id='";
        NSString * sState4=@"';";
        NSString * s=  [NSString stringWithFormat:@"%@%@%@%@%@%@%@",sState,theU,sState2,theE,sState3,theID,sState4];
        
        const char *sqlStatement =[s cStringUsingEncoding:NSUTF8StringEncoding];
        //"UPDATE users SET username='?', email='?' WHERE id='3';";
        sqlite3_stmt *compiledStatement;
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)    {
            // sqlite3_bind_text( compiledStatement, 1,[theU UTF8String], -1, SQLITE_TRANSIENT);
            // sqlite3_bind_text( compiledStatement, 2,[theE UTF8String], -1, SQLITE_TRANSIENT);
            //sqlite3_bind_text( compiledStatement, 3,[theID UTF8String], -1, SQLITE_TRANSIENT);
            
            
        }
        if(sqlite3_step(compiledStatement) != SQLITE_DONE ) {
            NSLog( @"Save Error: %s", sqlite3_errmsg(database) );
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
    // UPDATE users SET username='?', email='?' WHERE id='1';
}*/



/*-(void)saveUserInDatabase { //========================SAVE==============================
    
    // Copy the database if needed
    [self createEditableCopyOfDatabaseIfNeeded];
    
    NSString *filePath = [self getWritableDBPath];
    
    sqlite3 *database;
    NSString * theU=user.text;
    NSString * theE=email.text;
    
    if(sqlite3_open([filePath UTF8String], &database) == SQLITE_OK) {
        
        //NSString *temp = [NSString stringWithFormat:@"insert into allusers (user_id,user_name) VALUES (%@,%@)",user_id,user_name];
        const char *sqlStatement = "insert into users (username,email) VALUES (?,?)";
        sqlite3_stmt *compiledStatement;
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)    {
            sqlite3_bind_text( compiledStatement, 1,[theU UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text( compiledStatement, 2,[theE UTF8String], -1, SQLITE_TRANSIENT);
            
            
        }
        if(sqlite3_step(compiledStatement) != SQLITE_DONE ) {
            NSLog( @"Save Error: %s", sqlite3_errmsg(database) );
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}*/

- (void) populateEventArray {
    
}
//========================================WRITABLE DATABSE PATH=======================
- (NSString *) getWritableDBPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:verveDBString];
    
}

//================================================Copies database to appropriate location============

-(void)createEditableCopyOfDatabaseIfNeeded
{
    // Testing for existence
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:verveDBString];
    
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success)
        return;
    
    // The writable database does not exist, so copy the default to
    // the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath]
                               stringByAppendingPathComponent:verveDBString];
    success = [fileManager copyItemAtPath:defaultDBPath
                                   toPath:writableDBPath
                                    error:&error];
    if(!success)
    {
        NSAssert1(0,@"Failed to create writable database file with Message : '%@'.",
                  [error localizedDescription]);
    }
}

@end
