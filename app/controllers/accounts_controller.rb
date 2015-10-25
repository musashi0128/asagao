class AccountsController < ApplicationController
  before_action :login_required
  
  def show
    @member = current_member
  end

  def edit
    @member = current_member
    @member.build_image unless @member.image
  end
  
  private
  def account_params
    attrs = [:number, :name, :full_name, :gender, :birthday, :email,
      :password, :password_confirmation]
    attrs << { image_attributes: [:_destroy, :id, :uploaded_image] }
    params.require(:account).permit(attrs)
  end
  
end
