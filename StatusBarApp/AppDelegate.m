//
//  AppDelegate.m
//  StatusBarApp
//
//  Created by Giridhar Bhujanga on 7/25/14.
//  Copyright (c) 2014 Walmart. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (NSString *) getLoadAverage {
    NSURL *url = [NSURL URLWithString:@"http://172.28.140.163:5566/loadaverage"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"ret=%@",ret);
    return ret;
}

- (void) awakeFromNib {
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setMenu:menu];
    [statusItem setTitle:@"Ops"];
    [statusItem setHighlightMode:YES];
    [statusItem setImage:[NSImage imageNamed:@"star18x18.png"]];
    [self getLoadAverage];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(setLoad)
                                   userInfo: nil
                                    repeats:YES];

}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}
- (IBAction)quitApp:(id)sender {
    [NSApp terminate:nil];
}
- (IBAction)showWindow:(id)sender {
    [NSApp activateIgnoringOtherApps:YES];
    [_window makeKeyAndOrderFront:nil];
}

- (void) setLoad {
    [loadAverageTextField setStringValue:[self getLoadAverage]];
    NSLog(@"ret=%@",[self getLoadAverage]);
}
- (IBAction)getLoad:(id)sender {
    [loadAverageTextField setStringValue:[self getLoadAverage]];
}

@end
