class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit edit_task_title update destroy ]

  # GET /tasks or /tasks.json
  def index
    complete = params[:complete]

    case complete
    when "true"
      @tasks = Task.where(complete: true)
      @view = "closed"
    when "false"
      @tasks = Task.where(complete: false)
      @view = "open"
    else
      @tasks = Task.all
      @view = "all"
    end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # GET /tasks/:id/edit
  def edit_task_title
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      if turbo_frame_request?
        # render partial: "task_table", locals: { tasks: Task.all }
        # @tasks = Task.all
        
        logger.debug "#{@task.complete}"
        logger.debug "#{@task.complete}"
        logger.debug "#{@task.complete}"
        logger.debug "#{@task.complete}"
        logger.debug "#{@task.complete}"

        @view = params[:task][:view]
        case @view
        when "open"
          @tasks = Task.where(complete: false)
        when "closed"
          @tasks = Task.where(complete: true)
        else
          @tasks = Task.all
        end
        render :index
      else
        redirect_to @task, notice: "Task updated."
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "Task was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.expect(task: [ :title, :due_date, :description, :project_id, :priority, :complete ])
    end
end
