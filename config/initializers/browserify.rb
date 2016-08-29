# Configure Browserify to use babelify to compile ES6
Rails.application.config.browserify_rails.commandline_options = "-t [ babelify --presets [ react es2015 stage-1 ] ]"

unless Rails.env.production?
  # Work around sprockets+teaspoon mismatch:
  Rails.application.config.assets.precompile += %w(spec_helper.js)

  # Make sure Browserify is triggered when
  # asked to serve javascript spec files
  Rails.application.config.browserify_rails.paths << lambda { |p|
    p.start_with?(Rails.root.join("spec/javascripts").to_s)
  }
end
