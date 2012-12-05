class SessionsController < ApplicationController
	respond_to :html, :xml, :json 
  def new
	end
	def create

    if not params[:session]
      params[:session] = ActiveSupport::JSON.decode(request.body)
    end
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      respond_to do |format|
          format.html { redirect_to user }
          format.json { render :json => user, :status => :created, :location => user}
          format.xml { render :xml => user }
      end
     # redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      respond_to do |format|
        format.json { render :json => "Not Signed In"}
      end
 #     render 'new'
    end
 #   else
 #     object = ActiveSupport::JSON.decode(request.body)
 #     user = User.find_by_email(object['email'])
 #     if user && user.authenticate(object['password'])
 #       respond_to do |format|
 #         format.html { redirect_to user }
 #         format.json { render :json => user, :status => :created, :location => user}
 #         format.xml { render :xml => user }
 #       end   
 #     else
 #       respond_to do |format|
 #         format.json { render :json => "Not Signed In"}
 #       end
 #     end
 #
 #  end
  end
	def destroy
		user = User.find_by_remember_token(cookies[:remember_token])
		sign_out user
		redirect_to root_path

	end
  def fb
    #render :text => request.env['omniauth.auth'].inspect
    @object = request.env['omniauth.auth']


  end
end
