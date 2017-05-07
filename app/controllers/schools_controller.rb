class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :check_login, except: [:new, :create]
  authorize_resource

  def index
    @schools = School.active.alphabetical.map paginate(:page => params[:page]).per_page(7)
  end

  def show

  end

  def new
    @school = School.new
  end

  def edit
    
  end

  def create
    @school = School.new(school_params)
    if @school.save
      session[:school_id] = @school.id
      redirect_to home_path, notice: "Thank you for adding a school!"
    else
      flash[:error] = "This school could not be created."
      render "new"
    end
  end

  def update
    if @school.update_attributes(school_params)
      flash[:notice] = "#{@school.proper_name} is updated."
      redirect_to @school
    else
      render :action => 'edit'
    end
  end

  def destroy
    @school.destroy
    flash[:notice] = "Successfully removed #{@school.proper_name} from Chess Direct."
    redirect_to schools_url
  end

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :street_1, :street_2, :city, :state, :zip, :min_grade, :max_grade, :active)  
    end
end
