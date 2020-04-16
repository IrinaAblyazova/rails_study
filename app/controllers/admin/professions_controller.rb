class Admin::ProfessionsController < Admin::ApplicationController
  def index
    @professions = Profession.all
  end

  def new
    @profession = Profession.new
  end

  def create
    @profession = Profession.new(profession_attrs)

    if @profession.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @profession = Profession.find(params[:id])
  end

  def edit
    @profession = Profession.find(params[:id])
  end

  def update
    @profession = Profession.find(params[:id])

    if @profession.update(profession_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    profession = Profession.find(params[:id])
    profession.destroy
    redirect_to action: :index
  end

  private

  def profession_attrs
    params.require(:profession).permit(:title, :description)
  end
end
