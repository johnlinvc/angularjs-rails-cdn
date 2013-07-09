# angularjs-rails-cdn
Add CDN support to [angularjs-rails](https://github.com/hiravgandhi/angularjs-rails) .

Changelog:
* v0.0.1: Initial release

## Installation

Add this line to your application's Gemfile:

    gem 'angularjs-rails-cdn'

And then execute:

    $ bundle
    
## Usage
This gem add two methods `angularjs_include_tag` and `angularjs_url`

For Rails 3.1+ app with asset pipeline 

- remove `//=require angular` from `application.js`.
- Put the following line to `config/application.rb`.

```
config.assets.precompile += ['angularjs.js']
```

Then in the layout:

```
<%= angularjs_include_tag :google %>
<%= javascript_include_tag 'application' %>
```

Currently only support `:google` CDN, willing to add others if avaliable.

It will generate the following on production:

```
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.6/angular.min.js" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
window.angular || document.write(unescape('%3Cscript src="/assets/angular.js?body=1" type="text/javascript">%3C/script>'))
//]]>
</script>
```
on development:
```
<script src="/assets/angular.js?body=1" type="text/javascript"></script>
```
If you want to check the production URL, you can pass `:force => true` as an option

If you want to delay loading with defer, you can pass `:defer => 'defer'` as an option.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
