# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    def update
      self.resource = resource_class.to_adapter.get(current_user)

      resource_updated = update_resource(resource, account_update_params)
      if resource_updated
        success_response(resource, 'Successfully changed password')
      else
        clean_up_passwords resource
        set_minimum_password_length
        failed_response resource
      end
    end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    protected

    def respond_with(resource, _opts = {})
      if resource.persisted?
        success_response(resource, 'Signed up successfully')
      else
        failed_response resource
      end
    end

    def success_response(resource, msg)
      render json: {
        status: { code: 200, message: msg },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    end

    def failed_response(resource)
      render json: {
        status: { code: 422, message: resource.errors.full_messages.to_sentence }
      }, status: :unprocessable_entity
    end
  end
end
