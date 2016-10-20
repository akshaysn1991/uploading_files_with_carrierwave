class AppConfig
   # APP_YML_CONFIG = YAML::load(((File.open("#{Rails.root}/config/app_config.yml"))))

   APP_YML_CONFIG = YAML::load(File.open("#{Rails.root}/config/app_config.yml")).symbolize_keys

   # APP_YML_CONFIG = Rails.application.config_for(:app_config).symbolize_keys
  
  def self.config
    APP_YML_CONFIG
  end

  def self.data_types
    self.config[:data_types]
  end
 
  
end