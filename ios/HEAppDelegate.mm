// Copyright (c) 2017 Olli Wang
//
// ---
// Author: olliwang@ollix.com (Olli Wang)

#import "HEAppDelegate.h"

#include "boost/filesystem.hpp"

@implementation HEAppDelegate

- (BOOL)application:(UIApplication *)application
    willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  ::boost::filesystem::path path = "/";
  path = path / "test" / "boost" / "filesystem" / "path";
  printf("PATH: %s\n", path.c_str());
  return YES;
}

@end
