class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  before_filter :authenticate_user!

  # GET /users/sign_up
  def new

    # Override Devise default behaviour and create a profile as well
    build_resource({})
    resource.build_data
    respond_with self.resource
  end

  #def edit
  #end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |user_params|
      user_params.permit(
        :username, :email, :password, :password_confirmation,
        data_attributes: [:id, :name, :cpf]
      )
    }
  end
end
