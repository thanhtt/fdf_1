Config.setup do |config|
  # Name of the constat exposing loaded settings
  config.const_name = "Settings"

  # Ability to remove elements of the array set in earlier loaded settings file. Default: nil
  # config.knockout_prefix = "--"
  ICONS = {google_oauth2: "google plus", facebook: "facebook"}
  COLOR = {google_oauth2: "blue", facebook: "facebook"}
end
