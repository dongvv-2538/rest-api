class UserAuthenticator::Oauth < UserAuthenticator
    
    GITHUB_CLIENT_ID = '988f9d48d6f8fef31618'
    GITHUB_CLIENT_SECRET = 'af7c6fcac39b3739ef8ecfb15087e01ab1be2e32'
    
    class AuthenticationError < StandardError; end
    class AuthorizationError  < StandardError; end

    attr_reader :user
  
    def initialize(code)
      @code = code
    end
  
    def perform

      raise AuthenticationError if @code.blank?
      raise AuthenticationError if token.try(:error).present?
      
      # register user
      prepare_user

    end

    private 

    def client
      @client ||= Octokit::Client.new(
        client_id: GITHUB_CLIENT_ID,
        client_secret: GITHUB_CLIENT_SECRET
      )
    end
  
    def token
      @token ||= client.exchange_code_for_token(@code)
    end
  
    def user_data
      @user_data ||= Octokit::Client.new(
        access_token: token
      ).user.to_h.slice(:login, :avatar_url, :url, :name)
    end
  
    def prepare_user
      @user = if User.exists?(login: user_data[:login])
        User.find_by(login: user_data[:login])
      else
        User.create(user_data.merge(provider: 'github'))
      end
    end
end