module Auth
  class LoginController < ApplicationController
    include HTTParty
  
    def new

    end

    def create
      # Retrieve params from the form submission
      unique_id = params[:pseudonym_session][:unique_id]
      password = params[:pseudonym_session][:password]
      remember_me = params[:pseudonym_session][:remember_me]

      # Perform any additional logic if needed

      # Now, make a request to the external URL
      # (You might want to use a HTTP library like 'httparty' or 'faraday' for this)
      response = self.class.post('http://canvas.docker/login/oauth2/token', {
        body: {
          unique_id: unique_id,
          password: password,
          remember_me: remember_me
        }
      })

      # Handle the response as needed

      # Redirect or render based on the response
      if response.success?
        redirect_to some_path, notice: 'Login successful'
      else
        flash.now[:alert] = 'Login failed'
        render :new
      end
    end
  end
end
