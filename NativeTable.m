//
//  NativeTable.m
//  NativeTableExample
//
//  Created by Spartak B
//  Copyright (c) 2011 Develocorp Inc. All rights reserved.
//

#import "NativeTable.h"

@implementation NativeTable
@synthesize mainTableView = _mainTableView;

-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
{
    self = (NativeTable*)[super initWithWebView:theWebView];
    if (self)
	{
		//NSLog(@"NativeTable Initialized!");
        
    }
    return self;
}

- (void)dealloc
{
	[_mainTableView release];
	[_mainTableData release];
    [super dealloc];
}



#pragma mark - JS interface methods

/**
 * Create a nativeTable.
 * @brief creates a tab bar
 * @param arguments (height)
 * @param options unused
 */
- (void)createTable:(NSArray*)arguments withDict:(NSDictionary*)options
{
	[_mainTableView release];
	_mainTableView = [UITableView new];
	[_mainTableView setHidden:YES];
	[_mainTableView setDataSource:self];
	[_mainTableView setDelegate:self];
	
    _mainTableHeight = [[options objectForKey:@"height"] floatValue];
	
	self.webView.superview.autoresizesSubviews = YES;
	[self.webView.superview addSubview:_mainTableView];
	//NSLog(@"createTable Called! %i", [options  count]);
}

/**
 * Sets table title.
 * @brief creates a tab bar
 * @param arguments (title)
 * @param options unused
 */
- (void)setTableTitle:(NSArray*)arguments withDict:(NSDictionary*)options
{
	
	[_mainTableTitle release];
	_mainTableTitle = [[arguments objectAtIndex:0] copy];
	[_mainTableView reloadData];
}


/**
 * Sets table data.
 * @brief creates a tab bar
 * @param arguments unused
 * @param options unused
 */
- (void)setTableData:(NSArray*)arguments withDict:(NSDictionary*)options
{
	
	[_mainTableData release];
	_mainTableData = [[arguments objectAtIndex:0] copy];
	[_mainTableView reloadData];
	
}


/**
 * Show the nativeTable on the display.
 * @brief creates a tab bar
 * @param arguments unused
 * @param options unused
 */
- (void)showTable:(NSArray*)arguments withDict:(NSDictionary*)options
{
	if(nil == _mainTableView){
        [self createTable:nil withDict:nil];
	}
	
	if(NO == [_mainTableView isHidden]){
		return;
	}
		
	
	_originalWebViewFrame = self.webView.frame;
	
	CGRect mainTableFrame, CDWebViewFrame;
	
	CDWebViewFrame = CGRectMake(
								 _originalWebViewFrame.origin.x,
								 _originalWebViewFrame.origin.y,
								 _originalWebViewFrame.size.width,
								 _originalWebViewFrame.size.height - _mainTableHeight
								 );
	
	mainTableFrame = CGRectMake(
								 CDWebViewFrame.origin.x,
								 CDWebViewFrame.origin.y + CDWebViewFrame.size.height,
								 CDWebViewFrame.size.width,
								 _mainTableHeight
								 );
	
    [self.webView setFrame:CDWebViewFrame];
	[_mainTableView setFrame:mainTableFrame];
	[_mainTableView setHidden:NO];
	
	//NSLog(@"ShowTable Called!");

}



/**
 * Hide the nativeTable on the display.
 * @brief creates a tab bar
 * @param arguments unused
 * @param options unused
 */
- (void)hideTable:(NSArray*)arguments withDict:(NSDictionary*)options
{
	if(nil == _mainTableView){
        return;
	}
	
	if(YES == [_mainTableView isHidden]){
		return;
	}
	
	[_mainTableView setHidden:YES];
	[self.webView setFrame:_originalWebViewFrame];
	
	
	//NSLog(@"HideTable Called!");
	
	
}


#pragma mark - tableView delegate and datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    if(nil != _mainTableData){
        return [_mainTableData count];
    }
    else {
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(nil != _mainTableTitle)
        return _mainTableTitle;
    else
        return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
        
    }
	
    
	cell.textLabel.text = [[_mainTableData objectAtIndex:indexPath.row] valueForKey:@"textLabel"]; 
	cell.textLabel.textColor = [UIColor blackColor];
	cell.textLabel.font = [UIFont systemFontOfSize:15];
	
	cell.detailTextLabel.text = [[_mainTableData objectAtIndex:indexPath.row] valueForKey:@"detailTextLabel"];
	cell.detailTextLabel.textColor = [UIColor grayColor];
	cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
	
	cell.accessoryType = UITableViewCellAccessoryNone;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	
    NSString * jsCallBack = [NSString stringWithFormat:@"window.plugins.nativeTable._onTableViewRowSelect(%d);", indexPath.row];
    [self.webView stringByEvaluatingJavaScriptFromString:jsCallBack];
    
}


@end
