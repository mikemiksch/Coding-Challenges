# iOS Questions

* **What’s the difference between frame and bounds?**

The bounds of a UIView are the coordinates and size (x & y, width & height values) relative to its own coordinate system starting at (0,0). The frame is the location and size relative to the superview containing it. 

* **What’re the 5 lifecycle states of an iOS application?**

Not Running, Inactive, Active, Background, Suspended

* **What can be done in NSOperation that you can’t do in GCD?**

NSOperation allows for dependencies, allowing developers to execute tasks in a specified order. NSOperation is also subject to Key Value Observing. NSOperation allows for tasks to be paused, resumed, or canceled. It also gives control over the maximum number of queued operations that can run simultaneously.

* **What’s an unwind segue used for? How do you set it up?**

An Unwind segue is used to navigate back through multiple push, popover, or modal segues to a designated View Controller (as opposed to going back through multiple popViewController or dissmissViewController.

If your segue has an identifier (and why wouldn't it)? This could be implemented in code as:

Objective C:
[self performSegueWithIdentifier:@"identifier" sender:self];

Swift:
performSegueWithIdentifier("identifier", sender: self)

By overriding prepareForSegue, you can specify your destination view controller as well as pass along any data that you need to.
