class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    @user = current_user
    @groups = current_user.groups.all
  end

  # GET /groups/1 or /groups/1.json
  def show; end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @user = current_user
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:success] = 'Category created successfully.'
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon.name, :author_id)
  end
end
