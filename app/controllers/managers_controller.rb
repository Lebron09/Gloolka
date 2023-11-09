class ManagersController < ApplicationController
  before_action :set_manager, only: [:show]

  def index
    @managers = Manager.all
    @managers = @managers.search(params[:search]) if params[:search].present?
    respond_to do |format|
      format.html
      format.csv
    end
  end

  def show
  end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params_create)
    if @manager.save
      redirect_to @manager, notice: 'Manager was successfully created.'
    else
      render :new
    end
  end

  def permitted_params_list
    %i[last_name first_name passport_id address city]
  end

  def manager_params_update
    params.require(:manager).permit(permitted_params_list)
  end

  def manager_params_create
    params.permit(permitted_params_list)
  end


  def edit
    @manager = Manager.find(params[:id])
  end

  def update
    @manager = Manager.find(params[:id])
    if @manager.update(manager_params_update)
      redirect_to @manager, notice: 'Manager was successfully updated.'
    else
      render :edit
    end
  end  

  def destroy
    @manager = Manager.find(params[:id])
    @manager.developers.update_all(manager_id: nil)
    @manager.destroy
  
    redirect_to managers_url, notice: 'Manager was successfully destroyed.'
  end
  

  private

  def set_manager
    @manager = Manager.find(params[:id])
  end
end
