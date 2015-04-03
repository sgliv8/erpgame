class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #load_and_authorize_resource

  # GET /records
  # GET /records.json
  def index
    @records = Record.where(user_id: current_user).paginate(:page => params[:page], :per_page => 10)

    if(current_user.role.name == "Admin")
      @records = Record.all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = current_user.records.build
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    #@record.user_id = current_user.id
    @record = current_user.records.build(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def begincash
    @begincash  = Record.select("end_cash").where(round: record_params[:round], user_id: record_params[:user_id])

    respond_to do |format|
      format.json { render :json => @begincash }
    end
  end

  def cashposition
    @selection = Record.pluck('DISTINCT round')

    @cashrecords = Record.where(round: 1).order('end_cash DESC');


  end

  def newcashposition
    @cashrecords = Record.select("records.round, records.end_cash, users.name, users.last_name").where(round: params[:round]).joins(:user).order('end_cash DESC');

    respond_to do |format|
      format.json { render :json => @cashrecords }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:round, :begin_cash, :expenses, :revenue, :inventory_penalty, :order_penalty, :end_cash, :user_id)
    end
end
