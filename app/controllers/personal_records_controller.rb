class PersonalRecordsController < ApplicationController
  before_action :set_personal_record, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_admin, only: %i[new create edit update destroy]

  def check_admin
    unless current_user.is_admin
      redirect_to root_path, alert: "You don't have permission to perform this action."
    end
  end

  # GET /personal_records or /personal_records.json
  def index
    @personal_records = PersonalRecord.all
  end

  # GET /personal_records/1 or /personal_records/1.json
  def show
  end

  # GET /personal_records/new
  def new
    @personal_record = PersonalRecord.new
  end

  # GET /personal_records/1/edit
  def edit
  end

  # POST /personal_records or /personal_records.json
  def create
    @personal_record = PersonalRecord.new(personal_record_params)

    respond_to do |format|
      if @personal_record.save
        format.html { redirect_to personal_record_url(@personal_record), notice: "Personal record was successfully created." }
        format.json { render :show, status: :created, location: @personal_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_records/1 or /personal_records/1.json
  def update
    respond_to do |format|
      if @personal_record.update(personal_record_params)
        format.html { redirect_to personal_record_url(@personal_record), notice: "Personal record was successfully updated." }
        format.json { render :show, status: :ok, location: @personal_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_records/1 or /personal_records/1.json
  def destroy
    @personal_record.destroy

    respond_to do |format|
      format.html { redirect_to personal_records_url, notice: "Personal record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_record
      @personal_record = PersonalRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personal_record_params
      params.require(:personal_record).permit(:last_name, :middle_name, :first_name, :education, :contacts, :description)
    end
end
