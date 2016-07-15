class MicropostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :edit, :destroy]
  before_action :correct_user,   only: [:edit, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])

    if @micropost.update(micropost_params)
      redirect_to @Micropost
    else
      render 'edit'
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:title, :description, :status, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

end
