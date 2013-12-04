class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @task }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.destroy
        format.html { redirect_to users_url }
        format.js
        format.json { head :no_content }
      else
        flash[:error] = "User could not be destroyed: #{@user.errors[:base].to_s}"
        format.js { render 'common/flash_error.js.erb' }
      end
    end
  end

  def save_sequence_of_tasks
    @user = User.find(params[:id])
    @tasks = @user.tasks

    @tasks.each do |task|
      task.position = params['task'].index(task.id.to_s) + 1
      task.save 
    end  
    render :nothing => true  
  end
end
