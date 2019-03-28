class ApplicationController < ActionController::API
    before_action :authenticate

    private

    def authenticate
        if request.headers['X-Token'].present?
            Okta::Jwt.logger = Logger.new(STDOUT) # set optional logger
            verified_access_token = Okta::Jwt.verify_token(
                request.headers['X-Token'],
                issuer: ENV['OKTA_ISSUER'],
                audience: 'pets/v1',
                client_id: ENV['OKTA_CLIENT_ID']
            )
            if verified_access_token['scp'].include? 'pets_api'
                return true
            else 
                render :json => {:message => 'Forbidden'}, :status => 403
            end
        else
            render :json => {:message => 'Bad Request'}, :status => 400
        end
    end
end
