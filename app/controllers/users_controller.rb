class UsersController < ApplicationController
  include ActiveStorage::SetCurrent

  def edit
    user = User.first
    render 'edit', locals: { user: }
  end

  def update
    user = User.first
    user.attachments.attach(params.dig(:user, :attachment))
    if user.save
      flash[:info] = user.attachments.last.url(expires_in: 10.minutes)
    else
      flash[:error] = 'Failed to upload file'
    end
    redirect_to root_path
  end
end
