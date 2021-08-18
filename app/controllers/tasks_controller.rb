class TasksController < ApplicationController
  before_action :required_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @tasks = pagy(current_user.tasks)
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: "タスクを登録しました。"
    else
      render :new
    end
  end

  def show
   # @task = current_user.tasks.order(id: "asc").find_by(params[:id])
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_url, notice: "タスクを更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスクを削除しました。"
  end

  private

    def task_params
      params.require(:task).permit(:content, :status)
    end

    def set_task
      @task = current_user.tasks.find(params[:id])
    end
end