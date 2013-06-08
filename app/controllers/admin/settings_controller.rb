class Admin::SettingsController < Admin::ApplicationController
  def index
  end

  def save
    params[:settings].each do |name, value|
      setting = Setting.where(name: name).first
      setting.value = value
      setting.save
    end

    redirect_to admin_settings_path
  end
end
