class ApplicationController < ActionController::API
    include ::ActionController::Serialization
    def encode_token(payload)
        JWT.encode(payload,'secret')
    end
    def decode_token
        #Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws
        #auth_header= 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws'
        auth_header =request.headers['Authorization']
        if auth_header
            token= auth_header.split(' ')[1]
            begin
                 JWT.decode(token,'secret',true,algorithm: 'HS256')
            rescue JWT::DecodeError 
                nil
            end
        end
    end
    def authorized_user
        decoded_token =decode_token()
        if decoded_token 
            user_id =decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end
    def authorize
        render json: {masssage: "You have to log in !"},status: :unauthorized unless
        authorized_user
    end
    def isverified
        if current_user.is_varified==1
            true
        else
            false
        end
    end
    def current_user
        decoded_token =decode_token()
        if decoded_token 
            user_id =decoded_token[0]['user_id']
            User.find_by(id: user_id)
        end
    end

end
