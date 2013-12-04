class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    #@tasks = Task.all
    @tasks = Task.all(:order => 'created_at')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @task.user = User.find(params[:user]) if !params[:user].nil?

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @task }
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to :back }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to :back }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
      format.json { head :no_content }
    end
  end
  
#  def sort
#    # first get all tasks given in params['task'] (should be all tasks of a user)
#    @tasks = Task.select{|task| params['task'].include? task.id.to_s } #Task.all
#    
#    @tasks.each do |task|
#      task.position = params['task'].index(task.id.to_s) + 1
#      task.save 
#    end  
#    render :nothing => true  
#  end
end
