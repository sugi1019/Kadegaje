class Admin::GenresController < ApplicationController

  # ログインしないとアクセスをブロック
  before_action :authenticate_admin_user!

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
