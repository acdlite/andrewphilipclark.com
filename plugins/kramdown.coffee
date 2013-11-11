async = require 'async'
url = require 'url'
exec = require('child_process').exec

parseMarkdownSync = (content, baseUrl, options) ->
  html = ''

  async.waterfall [
    (callback) ->
      exec "kramdown <<< #{content}", (error, stdout, stderr) ->
        html = stdout
        if error? then console.log('exec error: ' + error)
      callback null, html
  ], (err, result) -> html = result

  return html

module.exports = (env, callback) ->

  class KramdownPage extends env.plugins.MarkdownPage

    getHtml: (base=env.config.baseUrl) ->
      ### parse @markdown and return html. also resolves any relative urls to absolute ones ###
      options = env.config.markdown or {}
      return parseMarkdownSync @markdown, @getLocation(base), options

  # register the plugins
  env.registerContentPlugin 'pages', '**/*.*(markdown|mkd|md)', KramdownPage

  # done!
  callback()