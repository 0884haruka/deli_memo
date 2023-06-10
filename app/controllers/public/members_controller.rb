class Public::MembersController < ApplicationController

  def sign_up
  end

  def show
    # @member = Member.find(params[:id])
    # @members = @member.images
    @reviews = Review.order('id DESC').limit(5)
    @current_time = Time.current
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if@member.update(member_params)
      flash[:notice] = "You have update."
      redirect_to  mypage_path
    else
      render :edit
    end
  end

  def confirm
  end

  def withdraw
    member = current_member
    member.is_deleted = true
    member.save
    session.clear
    redirect_to root_path
  end

private

  def member_params
    params.require(:member).permit(:name, :nick_name, :profile_image, :introduction)
  end

end
