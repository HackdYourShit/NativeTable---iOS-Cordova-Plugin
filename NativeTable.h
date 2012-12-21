//
//  NativeTable.h
//  NativeTableExample
//
//  Created by Spartak B 
//  Copyright (c) 2011 Develocorp Inc. All rights reserved.
//

#import <Cordova/CDVPlugin.h>
#import <UIKit/UIKit.h>


@interface NativeTable : CDVPlugin <UITableViewDelegate,UITableViewDataSource>{

	CGRect _originalWebViewFrame;
	NSArray* _mainTableData;
	NSString* _mainTableTitle;
	CGFloat _mainTableHeight;
	
}


@property (nonatomic, assign) UITableView *mainTableView;

- (void)createTable:(NSArray*)arguments withDict:(NSDictionary*)options;
- (void)setTableTitle:(NSArray*)arguments withDict:(NSDictionary*)options;
- (void)setTableData:(NSArray*)arguments withDict:(NSDictionary*)options;
- (void)showTable:(NSArray*)arguments withDict:(NSDictionary*)options;
- (void)hideTable:(NSArray*)arguments withDict:(NSDictionary*)options;

@end
