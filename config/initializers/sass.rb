Sass::Engine::DEFAULT_OPTIONS[:load_paths].tap do |load_paths|
  load_paths << "#{Rails.root}/app/assets/stylesheets"
  load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/compass/stylesheets"
end

if Rails.configuration.respond_to?(:sass)
  Rails.configuration.sass.tap do |config|
    # Prefer SASS, 'cause that's what real men use :)
    config.preferred_syntax = :sass
  end
end