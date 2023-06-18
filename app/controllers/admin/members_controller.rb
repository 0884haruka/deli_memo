class Admin::MembersController < ApplicationController
  
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(admin_member_params)
      flash[:notice] = "登録情報を更新しました。"
      redirect_to admin_member_path
    else
      render :edit
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admin_members_path
  end
  
  private
  
  def admin_member_params
    params.require(:member).permit(:name, :nick_name, :email, :is_deleted, :introduction)
  end
  
end
