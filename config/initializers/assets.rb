# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
controller_names = Dir[Rails.root.join('app/controllers/*_controller.rb')].map { |path| path.match(/(\w+)_controller.rb/); $1 }.compact
controller_names = controller_names - ['application']
admin_controller_names = Dir[Rails.root.join('app/controllers/admin/*_controller.rb')].map { |path| path.match(/(\w+)_controller.rb/); 'admin/'+$1 }.compact
admin_controller_names = admin_controller_names - ['admin/admin']

(controller_names + admin_controller_names).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js"]
end
