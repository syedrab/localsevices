class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
    @service_area = ServiceArea.uniq.pluck(:city)
  end

  # GET /services/1/edit
  def edit
    @service_area = ServiceArea.where(:service_id => @service.id)
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.company_id = current_user.company_id
    respond_to do |format|
      params[:service_area].split(',').each do |s_a|
        @service_area = ServiceArea.new
        @service_area.city = s_a
        @service_area.service_id = @service.id
        @service_area.company_id = @service.company_id
        @service_area.save
      end
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        ServiceArea.destroy_all(service_id: @service.id)
        params[:service_area].split(',').each do |s_a|
          @service_area = ServiceArea.where(:city => s_a, :service_id => @service.id, :company_id => @service.company_id)
          if @service_area.count==0
            @service_area = ServiceArea.new
            @service_area.city = s_a
            @service_area.service_id = @service.id
            @service_area.company_id = @service.company_id
            @service_area.save
          end
        end
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :service_type_id, :description, :price)
    end
end
