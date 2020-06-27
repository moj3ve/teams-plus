#import "Tweak.h"

/**
 * Load Preferences
 */
BOOL enable;

static void reloadPrefs() {
  NSDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH] ?: [@{} mutableCopy];

  enable = [[settings objectForKey:@"enable"] ?: @(YES) boolValue];
}

%group Enable
  %hook CMARConditionalLaunchManager
    - (BOOL)requiresInteractiveRemediationForIdentity:(id)arg1 {
      return FALSE;
    }
  %end
%end

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) reloadPrefs, CFSTR(PREF_CHANGED_NOTIF), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  reloadPrefs();

  if (enable) {
    %init(Enable);
  }
}

