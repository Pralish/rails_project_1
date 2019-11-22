class Api::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only: [:create], raise: false
  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :json => {:success => true}
  end

  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render :json => {}
  end

  def failure
    render :json => {:success => false, :errors => ["Login Failed"]}
  end
end