require 'twitter'

class UsersController < ApplicationController
	before_action :authenticate_user!

 #  named_scope :without_user, lambda{|user| user ? {:conditions => ["id != ?", user.id]} : {} }
  # GET /users
 def index
    
        @conversations = Conversation.involving(current_user).order("created_at DESC")


    @filterrific = initialize_filterrific(
    User.where.not("id = ?",current_user.id),
      params[:filterrific],
      :select_options => {
        sorted_by: User.options_for_sorted_by
      }
    ) or return
    @users = @filterrific.find.page(params[:page])


    respond_to do |format|
      format.html
      format.js
    end
  end
  


  # GET /users/1
  def show
    @users = User.all

  end

  # GET /users/new
  def new
    @user = User.new

    @all_skills = Skill.all? 
    @users_skills = @user.users_have_skills.build

      end

  # GET /users/1/edit
  def edit
  @user = current_user
  
  end

def profile
    @user = current_user
    render 'users/profile'
  end



  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end




  # PATCH/PUT /users/1
  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user = current_user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end





def twitter_news

  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'BUsYh9qYnmESuqESatiIXKt3A'
  config.consumer_secret     = '4Ad3svU2bGvGrQ45OWwyAvF7pviv0ikTb1o0q5QS791oAV8ulk'
  config.access_token        = '368995232-Rwvgpz7LVtpqQ9HGY1Z7ux1cAOtlVmB3ji9Vo1RS'
  config.access_token_secret = 'wlW5zhC2N7t9es0vIz9TiPDXZr6mhqQAXM9qo8TJQcU1Z'
end

  @tweet_news = client.user_timeline("pinchito", {count: 5}) 


end





  private
  

    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name, :country_code, :city, :company, :position, :intro, :avatar, :filterrific, :search_query, {:skill => []}, {:need => []})


    end
end






