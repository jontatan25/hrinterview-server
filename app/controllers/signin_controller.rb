class SigninController < ApplicationController
    before_action :authorize_access_request!, only: [:destroy]

    def create
        user = User.find_by(email: params[:email]) # Removed space between params and [:email]
        
        if user && user.authenticate(params[:password]) # Added if condition for user existence
            payload = { user_id: user.id }
            session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
            tokens = session.login
            response.set_cookie(JWTSessions.access_cookie,
                                value: tokens[:access],
                                httponly: true,
                                secure: Rails.env.production?)
            render json: { csrf: tokens[:csrf]} # Corrected the spelling of csrf
        else
            not_found # Changed to not_found to match the method name
        end
    end

    def destroy
        session = JWTSessions::Session.new(payload: payload)
        session.flush_by_access_payload
        render json: :ok
    end

    private
    def not_found
        render json: { error: "Cannot find email/password combination" }, status: :not_found # Added quotes around error message
    end
end
