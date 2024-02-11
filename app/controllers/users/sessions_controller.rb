# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # OmniAuth
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  #def new
    # super
  #end

  # POST /resource/sign_in
  def create
  #   super
  puts "#{'/'*80}\n Me cao go en todo!\n #{'/'*80}\n"
  logged_in(current_user)
 end

  # DELETE /resource/sign_out
  def destroy
     #super
     puts current_user.inspect
     sign_out
     puts current_user.inspect
     render json: {msg: 'Session finished'}
  end

  def logged_in(user)
    session = Session.create(user: current_user)
    render json: { token: session.token }
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
