class GroupsController < ApplicationController
  respond_to :json

  def index
  	if user_signed_in?
   	  respond_with current_user.groups
   	else
   	  respond_with "Permission denied!"
   	end
  end

  def show
  	group = Group.find(params[:id])
  	if user_signed_in? && current_user == group.user
   	  respond_with group
   	else
   	  respond_with "Permission denied!"
   	end
  end

  def create
  	if user_signed_in?
   	  respond_with current_user.groups.create(params[:group])
   	else
   	  respond_with "Permission denied!"
   	end
  end

  def update
  	group = Group.find(params[:id])
  	if user_signed_in? && current_user == group.user
   	  respond_with group.update(params[:group])
   	else
   	  respond_with "Permission denied!"
   	end
  end

  def destroy
  	group = Group.find(params[:id])
  	if user_signed_in? && current_user == group.user
   	  respond_with group.destroy
   	else
   	  respond_with "Permission denied!"
   	end
  end
end
