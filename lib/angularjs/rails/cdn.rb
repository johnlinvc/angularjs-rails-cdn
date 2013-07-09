require 'angularjs-rails'
require "angularjs/rails/cdn/version"

module Angularjs
	module Rails
		module Cdn
			module ActionViewExtensions
				ANGULARJS_VERSION = AngularJS::Rails::VERSION
				OFFLINE = (::Rails.env.development? or ::Rails.env.test?)
				URL = {
					:google             => "//ajax.googleapis.com/ajax/libs/angularjs/#{ANGULARJS_VERSION}/angular.min.js",
				}

				def angularjs_url(name)
					URL[name]
				end

				def angularjs_include_tag(name,options = {})
					return javascript_include_tag(:angular, options) if OFFLINE and !options.delete(:force)

					[ javascript_include_tag(angularjs_url(name), options),
						javascript_tag("window.angular || document.write(unescape('#{javascript_include_tag(:angular, options).gsub('<','%3C')}'))", options)
					].join("\n").html_safe
				end

			end
			# Your code goes here...
			class Railtie < ::Rails::Railtie
				initializer 'angularjs_rails_cdn.action_view' do |app|
					ActiveSupport.on_load(:action_view) do
						include Angularjs::Rails::Cdn::ActionViewExtensions
					end
				end
			end
		end
	end
end
