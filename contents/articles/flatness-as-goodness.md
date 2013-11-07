---
title: "Flatness as goodness"
date: 2013-06-05 02:10:23 -0500
description: "It's no coincidence that flat design and responsive design are concurrent trends."
---

Amidst plausible rumors that iOS 7, set to be unveiled next week at Apple's Worldwide Developers Conference, will receive a 'flatter' user interface, I've been thinking lately about the idea of 'flatness as goodness.'

I [quipped on Twitter][twitter] recently that 'flat' as a design descriptor is quickly approaching meaninglessness. Maybe 'uselessness' would have been a better choice of word. Flat design is a real trend; my point was that rather than being descriptive in a useful way, 'flat' is too often used as shorthand for modern, hip, and inherently good. In this manner it is especially used as a contrast to 'skeuomorphism,' another trendy word whose usefulness has rapidly waned, and which is too often used as a shorthand for old, dated, and inherently bad.

A quick refresher: *skeuomorphism* is design pattern which mimics physical metaphors from the real world, e.g. a reading app with a page curl animation, or a calculator app that looks and works like a pocket calculator. *Flat* design eschews skeuomorphs in favor of a minimalist aesthetic that gives special attention to typography, color, and simple shapes. The most high profile example is Microsoft's don't-call-it-Metro design language used in Windows 8.

It's wrong to say that flat design is superior to skeuomorphism in general, or vice versa. For starters, the two are not mutually exclusive. You can have a design that is both skeuomorphic and flat, or non-skeuomorphic and non-flat. Execution is more important to a design than flatness or lack thereof. While I expect many arguments in the vein of 'flatness as goodness' to be made in the coming weeks, that's not a conversation that interests me.

So if flatness carries no inherent goodness, what accounts for flat design's recent surge in popularity? Is it a fluke? Is it merely a fashion trend? Is it a reaction to the sometimes garish skeuomorphic designs found in Apple's interfaces? That's likely part of it.

However, I think there's another, more practical reason behind flat design's rise. It's a theory I've yet to encounter elsewhere, and it begins with the following observation:

Flat design and responsive design are concurrent trends.

Correlation is not causation, it needn't be said, though I do think it's significant that responsive design and flat design have risen alongside each other.

A *responsive* design is one that adapts to different environments. It's usually used in the context of web design, where websites must be built to work for a variety of browsers, devices, and --- most importantly --- screen sizes. The term can also be applied more broadly to include, say, an iOS app that supports both the iPhone and iPad. The latter case is becoming increasingly important in the post-PC era. For instance, rather than designing apps to fit a fixed pixel grid, Apple encourages developers to use technologies like [Auto Layout][autolayout] so that elements are positioned and sized according to their context.

What does responsiveness have to do with flat design? If you've ever attempted to design an app or website, or if you've ever talked to a designer, you know that one the most tedious aspects a designer must deal with is bitmap artwork. Bitmaps allow for incredible detail, but they don't scale easily, they take up lots of memory (which on the web means they are slow), and they must be created and edited using fancy software like Photoshop. All these things add up to make it difficult, though obviously not impossible, to create responsive designs that rely heavily on bitmap images --- at least compared to the alternative. And since skeuomorphic designs usually rely heavily on bitmap images, responsive skeuomorphic designs can be tough.

By contrast, let's look closer at the hallmarks of flat design:

* *Simple shapes*. Elements are made up of simple lines and contours. Rectangles, roundrects, and circles abound.
* *Minimal ornamentation*. Purely decorative elements are few. The lack of visual fluff places focus squarely on the content.
* *Minimal depth*. The use of shadows, gloss, and other techniques that mimic three-dimensional depth is negligible. This is where 'flat' design gets its name.
* *Focus on typography*. Text and other typographical elements are emphasized.
* *Focus on color*. In lieu of ornamental features and false effects, the careful use of color creates contrast and attracts the eye.

What all of these features have in common is that they don't require the use of bitmap images, and they're easily rendered by computers. That drastically reduces the amount of friction involved in prototyping and iterating on a design. It's way easier to change the value of a CSS property in your text editor than it is to open up Photoshop and adjust the brightness of a toolbar, or create a stretchable background for a button, or output all your artwork at two different sizes to account for high-density screens. And so forth. Even if a flat design does require the use of bitmap images, it's way easier to work with 'flat' bitmaps versus ones filled with intricate details.

Check out the websites at [Polygon][polygon], [Medium][medium], and [Svtble][svbtle] to see what I mean. I don't think it's mere coincidence that these designs are both highly responsive and very flat.

I can speak from personal experience, as well. As of this writing (5 June, 2013), the design of this website uses zero bitmap images. Everything is rendered using either fonts (including a custom font for the logo) or CSS properties (including the rainbow gradient surrounding the page). I made these decisions in part out of an aesthetic preference for simplicity, and to create a pleasing reading experience. But I also did it because I'm lazy! I hate opening up Photoshop if I don't have to. I love that I can do all the work of designing this site using a text editor; indeed, I designed the site specifically to accommodate that desire.

I imagine I'm not the only person who's been influenced by this practical benefit of flat design. Perhaps in this way flat design is inherently well-suited to the post-PC era. 'Flatness as goodness' may be bunk, but there's definitely some goodness in flatness.

[twitter]: https://twitter.com/acdlite/status/337936081255292928
[autolayout]: https://developer.apple.com/library/mac/#documentation/UserExperience/Conceptual/AutolayoutPG/Articles/Introduction.html
[polygon]: http://www.polygon.com
[medium]: https://medium.com
[svbtle]: https://svbtle.com