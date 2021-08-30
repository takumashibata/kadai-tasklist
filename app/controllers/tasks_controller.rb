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
      flash[:success] = "タスクを登録しました。"
      redirect_to tasks_url
    else
      flash.now[:danger] = "タスクに失敗しました。"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "タスクを更新しました！"
      redirect_to tasks_url
    else
      flash.now[:danger] =  "タスクの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to tasks_url
  end

  private

    def task_params
      params.require(:task).permit(:content, :status)
    end

    def set_task
      @task = current_user.tasks.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    flash[:danger] = 'タスクが見つかりません' 
    redirect_to root_url
    end
end