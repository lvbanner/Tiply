# Pre-work - Tiply

Tiply is a tip calculator application for iOS.

Submitted by: **Your Name Here**

Time spent: 7 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Added split bill equally functionality

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/L4WFM9D.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** I really enjoy working within the iOS app development platform. I have already been coding in Swift for about a year now, but I lack in true textbook knowledge of the language and the nuances within iOS development. I would describe outlets as code references to sepcific elements being used within the storyboard. Actions are functions attached to event listeners on the specific objects on the storyboard. Under the hood, I would assume that each object behaves as an instance of a class. The actions function as an instance method attached to an instance of a class.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** You get a strong reference cycle when you capture self within a closure. This happens when you have a property for a class that has a closure and you reference that instance using self within the body of the closure. This results is a strong memory reference pointing in both directions which means ARC can not get rid of the memory allocated because the reference count cannot hit zero.To avoid creating this cycle, you should use the keyword weak or unowned, these keywords will not make a strong reference to self when you call it within a closure.


## License

    Copyright 2017 Luther Banner III

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
