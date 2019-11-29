
class Api::BaseController < ActionController::API
    # protect_from_forgery
   
    # before_action :authenticate_request
    
    # attr_reader :current_user
    
    # private
    
    # def json_request
    #     request.format.json?
    # end
    
    # def authenticate_request
    #     @current_user = AuthorizeApiRequest.call(request.headers).result
    #     render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    # end
    def not_found
        render json: {error: 'not_found'}
    end

    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: {errors: e.message}, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: {error: e.message}, status: :unauthorized
        end
    end
end