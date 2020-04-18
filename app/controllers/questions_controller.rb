class QuestionsController < ApplicationController

  def show
    @question = Question.includes(:topic, answers: [:user]).friendly.find(params[:id])
  end

  def follow_user
  	@question = Question.includes(:topic, answers: [:user]).friendly.find(params[:id])
  	user = User.friendly.find(params[:user_id])
  	if current_user.following?(user)
      redirect_to question_path(@question), flash: { alert: "Already following" }
  	else
  	  current_user.follow(user)
  	  redirect_to question_path(@question), flash: { notice: "You followed #{user.name}" }
  	end
  end

  def follow_topic
    @question = Question.includes(:topic, answers: [:user]).friendly.find(params[:id])
  	topic = Topic.friendly.find(params[:topic_id])
  	if current_user.following?(topic)
      redirect_to question_path(@question), flash: { alert: "Already following" }
  	else
  	  current_user.follow(topic)
  	  redirect_to question_path(@question), flash: { notice: "You followed #{topic.name}" }
  	end
  end
end
