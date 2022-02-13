class UserAuthenticator
    
    GITHUB_CLIENT_ID = '988f9d48d6f8fef31618'
    GITHUB_CLIENT_SECRET = 'af7c6fcac39b3739ef8ecfb15087e01ab1be2e32'
    
    class AuthenticationError < StandardError; end
    class AuthorizationError  < StandardError; end

    attr_reader :authenticator, :access_token
  
    def initialize(code: nil, login: nil, password: nil)
      @authenticator = if code.present?
        Oauth.new(code)
      else 
        Standard.new(login, password)
      end
      
    end
  
    def perform
      @authenticator.perform
      set_access_token
    end

    def user 
      authenticator.user
    end

    def set_access_token
      @access_token = if user.access_token.present?
        user.access_token
      else
        user.create_access_token
      end
    end
end