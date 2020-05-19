class Web::Teacher::CoursesController < Web::Teacher::ApplicationController
  def index
    @courses = Course.where(teacher_id: current_teacher.id).decorate
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_attrs)

    if @course.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_attrs)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private

  def course_attrs
    params.require(:course).permit(:title, :description, profession_ids: [], lesson_ids: [])
  end
end