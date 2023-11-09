class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show]

  def index
    @developers = Developer.all
    @developers = @developers.search(params[:search]) if params[:search].present?
    respond_to do |format|
      format.html
      format.csv
    end
  end

  def show

  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params_create)
    if @developer.save
      redirect_to @developer, notice: 'Developer was successfully created.'
    else
      render :new
    end
  end
  

  def permitted_params_list
    %i[last_name first_name passport_id address city manager_id]
  end

  def developer_params_update
    params.require(:developer).permit(permitted_params_list)
  end

  def developer_params_create
    params.permit(permitted_params_list)
  end


  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    @developer = Developer.find(params[:id])
    if @developer.update(developer_params_update)
      redirect_to @developer, notice: 'Developer was successfully updated.'
    else
      render :edit
    end
  end  

  def destroy
    @developer = Developer.find(params[:id])
    @developer.destroy
    redirect_to developers_url, notice: 'Developer was successfully destroyed.'
  end

  private

  def set_developer
    @developer = Developer.find(params[:id])
  end
end