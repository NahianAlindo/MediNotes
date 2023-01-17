class DosagesController < ApplicationController
  before_action :set_patient
  before_action :set_dosage, only: %i[ show edit update destroy ]

  # GET /dosages or /dosages.json
  def index
    @dosages = @patient.dosages
  end

  # GET /dosages/1 or /dosages/1.json
  def show

  end

  # GET /dosages/new
  def new
    @dosage = @patient.dosages.build
    # @dosage = Dosage.new
  end

  # GET /dosages/1/edit
  def edit
  end

  # POST /dosages or /dosages.json
  def create
    @dosage = @patient.dosages.build(dosage_params)
    # @dosage = Dosage.new(dosage_params)

    respond_to do |format|
      if @dosage.save
        format.html { redirect_to [@patient, @dosage], notice: "Dosage was successfully created." }
        format.json { render :show, status: :created, location: @dosage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dosage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dosages/1 or /dosages/1.json
  def update
    respond_to do |format|
      if @dosage.update(dosage_params)
        format.html { redirect_to dosage_url(@dosage), notice: "Dosage was successfully updated." }
        format.json { render :show, status: :ok, location: @dosage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dosage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dosages/1 or /dosages/1.json
  def destroy
    @dosage.destroy

    respond_to do |format|
      format.html { redirect_to patient_dosages_url, notice: "Dosage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_dosage
    @dosage = Dosage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dosage_params
    params.require(:dosage).permit(:timestamp, :blood_sugar_level, :prescribed_insulin, :applied_insulin, :patient_id, :comments)
  end
end
