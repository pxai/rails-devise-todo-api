# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  def google_oauth2
    puts "Google Oauth, about to persist #{request.env['omniauth.auth'].inspect}"
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      puts "Google Auth login ok! #{@user.inspect}"
      sign_in_and_redirect @user, event: :authentication
    else
      puts "Google auth fail persisting? #{@user.inspect}"
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
    end
  end
  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  def failure
    puts "FAILURE omniauth"
    redirect_to root_path
  end

  # protected

  # The path used when OmniAuth fails
  def after_omniauth_failure_path_for(scope)
    super(scope)
  end
end
