class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy assign_task]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result
  end

  def show
  end

  def new
    @task = Task.new
  end

  def assign_task
    user_id = params[:user_id]
    if @task.present?
      @task.update(user_id: user_id)
      format.html { redirect_to task_url(@task), notice: "user assigned successfully." }
      format.json { render :show, status: :ok, location: @task }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @task.errors, status: :unprocessable_entity }
    end
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title , :description, :due_date,:level)
    end
end
