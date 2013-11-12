---
title: Transform Markdown footnotes into superpowered sidenotes with jQuery.sidenotes
date: 12 November 2013 EST
---

Last night I pushed the initial release of jQuery.sidenotes to GitHub.

jQuery.sidenotes is a new plugin that transforms Markdown-generated footnotes into sidenotes. It works by cloning the original footnote element into a new `aside` element and injecting it into the DOM near its reference in the text. You can then *toggle between footnotes and sidenotes*. This makes it perfect for responsive designs.

Visit the [project page](http://acdlite.github.io/jquery.sidenotes/) for full details.

This is my first ever open source project. As someone who relies heavily on open source projects to do work (and play!) every single day, it's nice to be able to give back to the community even in this smallest of ways. Hopefully someone will find this plugin useful.

In addition to being my first open source project, jQuery.sidenotes is the evolution of my very first programming project *ever*. Back in the summer of 2011, I hacked together a JavaScript "plugin" called Footnotes-to-Sidenotes.js. Although it went about the task in a completely different way, its intended purpose was largely the same: take some footnotes and turn them into sidenotes.

I went on to rewrite the script several times in the following two and a half years, each time improving it to the best of my abilities at that moment. I've managed to save some of the older versions (though not all of them, since they weren't under source control). It's nice to be able to look back and notice the glaring, downright embarrassing mistakes I made at each step along the way. To me it proves how much I've learned since I first started programming. I used to suck a lot, and now I suck much less.