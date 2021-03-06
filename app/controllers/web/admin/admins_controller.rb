class Web::Admin::AdminsController < Web::Admin::ApplicationController
  def index
    @search = Admin.ransack(params[:q])
    @pagy, @admins = pagy(@search.result)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(admin_attrs)

    if @admin.save
      redirect_to action: :index
    else
      render action: :new
    end
    authorize @admin
  end

  def show
    @admin = Admin.find(params[:id]).decorate
  end

  def edit
    @admin = Admin.find(params[:id])
    authorize @admin
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.update(admin_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    admin = Admin.find(params[:admin_id])
    admin.del!
    redirect_to action: :index
  end

  def restore
    admin = Admin.find(params[:admin_id])
    admin.restore!
    redirect_to action: :index
  end

  private

  def admin_attrs
    params.require(:admin).permit(:name, :email, :password, :role)
  end
end
