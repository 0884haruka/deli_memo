class Public::MembersController < ApplicationController

  def sign_up
  end

  def show
    # @review = Review.find(params[:id])
    @member = Member.find(params[:id])
    # @member = menber.reviews
    @member_reviews = @member.reviews.page(params[:page])
    @current_time = Time.current

  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if@member.update(member_params)
      flash[:notice] = "情報を更新しました"
      redirect_to  mypage_path(current_member)
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

  def destroy
    member = current_member
    member.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root #削除に成功すればrootページに戻る
  end

private

  def member_params
    params.require(:member).permit(:name, :nick_name, :profile_image, :introduction)
  end

end
