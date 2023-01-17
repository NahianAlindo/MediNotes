class PrescriptionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_patient
  before_action :set_prescription, only: %i[ show edit update destroy ]

  # GET /prescriptions or /prescriptions.json
  def index
    @prescriptions = @patient.prescriptions
  end

  # GET /prescriptions/1 or /prescriptions/1.json
  def show
  end

  # GET /prescriptions/new
  def new
    @prescription = @patient.prescriptions.build
  end

  # GET /prescriptions/1/edit
  def edit
  end

  # POST /prescriptions or /prescriptions.json
  def create
    @prescription = @patient.prescriptions.build(prescription_params)

    respond_to do |format|
      if @prescription.save
        format.html { redirect_to [@patient, @prescription], notice: "Prescription was successfully created." }
        format.json { render :show, status: :created, location: @prescription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescriptions/1 or /prescriptions/1.json
  def update
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to patient_prescription_url(@prescription), notice: "Prescription was successfully updated." }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1 or /prescriptions/1.json
  def destroy
    @prescription.destroy

    respond_to do |format|
      format.html { redirect_to patient_prescriptions_url, notice: "Prescription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
  def set_prescription
    @prescription = Prescription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def prescription_params
    params.require(:prescription).permit(:prescribed_on, :start_date, :end_date, :prescribed_insulin, :comments, :patient_id)
  end
end
