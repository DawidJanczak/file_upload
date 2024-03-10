class UsersController < ApplicationController
  def edit
    user = User.first_or_create
    render 'edit', locals: { user: }
  end

  def update
    user = User.first_or_create
    p params
    user.attachments.attach(params.dig(:user, :attachment))
    if user.save
      flash[:notice] = 'Flie uploaded'
    else
      flash[:error] = 'Failed to upload file'
    end
    redirect_to root_path
  end
end
