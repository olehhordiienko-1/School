class UserSubjectTeachersController < ApplicationController
  before_action :set_user_subject_teacher, only: %i[ show edit update destroy ]
  before_action :check_teacher

  def check_teacher
    unless PersonalRecord.find_by(contacts: current_user.email) != nil
      redirect_to root_path, alert: "You don't have permission to perform this action."
    end
  end
  # GET /user_subject_teachers or /user_subject_teachers.json
  def index
    @user_subject_teachers = UserSubjectTeacher.all
  end

  # GET /user_subject_teachers/1 or /user_subject_teachers/1.json
  def show
  end

  # GET /user_subject_teachers/new
  def new
    @user_subject_teacher = UserSubjectTeacher.new
  end

  # GET /user_subject_teachers/1/edit
  def edit
  end

  # POST /user_subject_teachers or /user_subject_teachers.json
  def create
    @user_subject_teacher = UserSubjectTeacher.new(user_subject_teacher_params)

    respond_to do |format|
      if @user_subject_teacher.save
        format.html { redirect_to user_subject_teacher_url(@user_subject_teacher), notice: "User subject teacher was successfully created." }
        format.json { render :show, status: :created, location: @user_subject_teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_subject_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_subject_teachers/1 or /user_subject_teachers/1.json
  def update
    respond_to do |format|
      if @user_subject_teacher.update(user_subject_teacher_params)
        format.html { redirect_to user_subject_teacher_url(@user_subject_teacher), notice: "User subject teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @user_subject_teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_subject_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_subject_teachers/1 or /user_subject_teachers/1.json
  def destroy
    @user_subject_teacher.destroy

    respond_to do |format|
      format.html { redirect_to user_subject_teachers_url, notice: "User subject teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_subject_teacher
      @user_subject_teacher = UserSubjectTeacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_subject_teacher_params
      params.require(:user_subject_teacher).permit(:user_id, :subject_teacher_id, :score)
    end
end
