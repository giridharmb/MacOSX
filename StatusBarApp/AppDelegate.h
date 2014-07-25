//
//  AppDelegate.h
//  StatusBarApp
//
//  Created by Giridhar Bhujanga on 7/25/14.
//  Copyright (c) 2014 Walmart. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem *statusItem;
    IBOutlet NSMenu *menu;
    IBOutlet NSTextField *loadAverageTextField;
    NSButton *getLoadButton;
}
- (IBAction)getLoad:(id)sender;
- (void) setLoad;

@property (assign) IBOutlet NSWindow *window;

@end
