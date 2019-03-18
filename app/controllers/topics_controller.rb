class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users,:comments)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @topic=Topic.find_by(id: params[:id])
  end

  def edit
    @topic = Topic.find_by(id: params[:id])

  end

  def update
    @topic = Topic.find_by(id: params[:id])
        @topic.update(topic_params)

        if @topic.save
        redirect_to topics_path, success: '投稿に成功しました'
        else
        flash.now[:danger] = "投稿に失敗しました"
        render :new
        end

  end

  def destroy
      @topic = Topic.find_by(id: params[:id])
      @topic.destroy
      redirect_to topics_path, success: '投稿を削除しました'
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
