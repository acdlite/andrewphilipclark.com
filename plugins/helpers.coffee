url = require 'url'
path = require 'path'

module.exports = (env, callback) ->

  setExt = (p, newExt) ->
    oldExt = path.extname p
    newExt = if newExt[0] is '.' then newExt else '.' + newExt # Add dot to extension if it doesn't already start with one
    p.replace(new RegExp(oldExt + '$'), newExt)

  helpers =

    # Resolve url relative to site root 
    url: (p) ->
      url.resolve env.locals.url, p

    # Resolve url relative to image directory
    image_url: (p) ->
      thePath = path.join env.locals.image_dir, p
      helpers.url thePath
    
    # Resolve url relative to script directory
    javascript_url: (p) ->
      thePath = path.join env.locals.javascript_dir, setExt(p, 'js')
      helpers.url thePath   

    # Resolve url relative to stylesheet directory
    stylesheet_url: (p) ->
      thePath = path.join env.locals.stylesheet_dir, setExt(p, 'css')
      console.log thePath
      helpers.url thePath

  for key, value of helpers
    env.helpers[key] = value

  callback()
