class Admin::MembersController < ApplicationController
  
  def index
    @member = Memberr.find(params[:id])
  end

  def show
    @member = Memberr.find(params[:id])
  end

  def edit
    @member = Memberr.find(params[:id])
  end
  
  def update
    @member = Memberr.find(params[:id])
    if @member.update(admin_member_params)
      flash[:notice] = "登録情報を更新しました。"
      redirect_to admin_reviews_show_path
    else
      render :edit
    end
  end
  
  private
  
  def admin_member_params
    params.require(:member).permit(:name, :nick_name, :email, :is_deleted, :introduction)
  end
  
end
