---
title: How to remove the boilerplate from Wintersmith blog posts
date: 8 November 2013 EST
---

[Wintersmith](http://wintersmith.io) is a really great static site generator for Node.js. I use it to build this site. It's similar in spirit to [Jekyll](http://jekyllrb.com), the Ruby-based generator that powers GitHub Pages. One of the biggest reasons why Jekyll is so popular is that it's very simple to set up out of the box without imposing too many constraints. You can modify it to fit your needs. But what I like about Wintersmith is that, if you can believe it, it's even more amenable to hacking. Although it requires a bit more set-up than Jekyll, what you get in return is increased flexibility.

One of the things I've worked to do in my Wintersmith set-up is reduce the amount of boilerplate required to write blog posts. By default, a Wintersmith Markdown page looks like this:

```text
---
title: Removing the boilerplate from Wintersmith blog posts
date: 8 November 2013 EST
template: article.jade
---

[Wintersmith](http://wintersmith.io) is a really great static site generator for Node.js...
```

Not bad... except I don't want to have to put `article.jade` at the top of every one of my posts. But by default, Wintersmith doesn't let you omit that piece of information. If you do, the page simply won't render.

Similarly, if I want to customize the permalink for a blog post, I have two options: add an additional `filename` metadata property to the top of every post, or set a global default `filenameTemplate` in the site's config. The former option is obviously out of the question, and the latter isn't quite right for me either, since I don't necessarily want all my pages to conform to the same permalink structure as my blog posts.

You might think this is a flaw of Wintersmith, but it's really more a consequence of its get-out-of-your-way philosophy.

Indeed, extending the Wintersmith core to support this set-up is fairly simple. We can create a custom ContentPlugin, like so:

```coffeescript
class BlogpostPage extends env.plugins.MarkdownPage
  # Set default template
  getTemplate: ->
    @metadata.template or env.config.blog.template or super()
  
  # Set default filename template
  getFilenameTemplate: ->
    @metadata.filenameTemplate or env.config.blog.filenameTemplate or super()

# Register the plugin
prefix = if env.config.blog.postsDir then env.config.blog.postsDir + '/' else ''
env.registerContentPlugin 'posts', prefix + '**/*.*(markdown|mkd|md)', BlogpostPage
```

The new class `BlogpostPage` is a subclass of `MarkdownPage`, which means it takes advantage of all Wintersmith's built in functionality for Markdown pages. It overrides two methods, `getTemplate` and `getFilenameTemplate`, to add support for new options in the Wintersmith configuration. So, if I add this section to `config.json`...

```javascript
{
  "blog": {
    "postsDir": "articles",
    "template": "article.jade",
    "filenameTemplate": "/:year/:month/:day/:file/index.html"
  }
}
```

...every Markdown post within my `articles` directory will use the template `article.jade` and a permalink based on its date and filename. Now I can write posts like this:

```text
---
title: Removing the boilerplate from Wintersmith blog posts
date: 8 November 2013 EST
---

[Wintersmith](http://wintersmith.io) is a really great static site generator for Node.js...

```

It's a small change, but a practical one in my opinion.

If you're curious, you can check see the full source at the site [repo](https://github.com/acdlite/andrewphilipclark.com).

***

A quick story related to this post: until last week, the above snippets wouldn't have worked in Wintersmith, because the methods `getFilename` and `getFilenameTemplate` didn't exist. To make this work, I forked the project on GitHub, made the necessary patches, and submitted a pull request. A few days later, the changes were merged into the main repository.

I mention this rather mundane detail because this was my first ever pull request. Though it was a small contribution, I found the process to be extremely satisfying, like a rite of passage on my way to becoming a *real* programmer. I look forward to making more contributions to the open source community whenever I can.