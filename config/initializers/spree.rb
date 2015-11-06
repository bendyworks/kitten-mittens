# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
end

Spree::Ability.register_ability(Marketer)


Spree.user_class = "Spree::User"

Spree::Admin::RootController.class_eval do
  alias_method :gem_root_redirect_path, :admin_root_redirect_path

  def admin_root_redirect_path
    if spree_current_user.has_spree_role?('Marketer')
      admin_taxonomies_path
    else
      gem_root_redirect_path
    end
  end
end
