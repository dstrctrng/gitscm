class PageController < ApplicationController
  before_filter :get_version, :only => [:index, :download]
  
  def index
  end
  
  def get_version
    version_file = File.expand_path(File.dirname(__FILE__) + "/../../config/app_config.yml")
    config = YAML.load(File.read(version_file))
    @version = config['latest_version']['version']
    @date = Time.at(config['latest_version']['ts'].to_i).strftime("%Y-%m-%d")
  end
end