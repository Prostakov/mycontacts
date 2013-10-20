class MainController < ApplicationController

  def index
    redirect_to new_user_session_path unless user_signed_in?
    @contacts = current_user.contacts.length
    @groups = current_user.groups.length
  end
end
