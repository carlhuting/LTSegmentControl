# LTSegmentControl

A custom segment control,it is a subclass of UIScrollView
![snapshot](https://github.com/carlhuting/LTSegmentControl/blob/master/LTSegmentControl/Resource/shot01.png)
# Features

- Support horizontal scrolling
- Supports selection indicator both on top and bottom
- Supports blocks
- Works with ARC and iOS >= 7
# Usage
The code below will create a segmented control with the default looks:

```  objective-c
LTSegmentControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"One", @"Two", @"Three"]];
segmentedControl.frame = CGRectMake(10, 10, 300, 60);
[self.view addSubview:segmentedControl];
```

Included is a demo project showing how to fully customise the control.
# Installation

## Manully

- Add `LTSegmentControl.h` and `LTSegmentControl.m` to your project.
- `#import "LTSegmentControl.h"` where you want to add the control.

# License

LTSegmentedControl is licensed under the terms of the Apache License. Please see the [LICENSE](LICENSE.md) file for full details.

If this code was helpful, I would love to hear from you.

[@carlhuting](http://weibo.com/u/3283459547)   
[puzzlefun](http://puzzlefun.github.io/)
