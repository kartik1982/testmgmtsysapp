class DevicesController < ApplicationController
  def index
    @devices = Device.all
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      flash[:notice]="Device Added successfully"
      redirect_to device_path(@device)
      # redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @device = Device.new

  end

  def show
    @device= Device.find(params[:id])
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      flash[:notice]="Device Updated successfully"
      redirect_to device_path(@device)
    else
      render 'edit'
    end
  end

  def destroy
    @device= Device.find(params[:id])
    if @device.destroy
      flash[:danger]="Device Deleted successfully"
      redirect_to devices_path
    else

    end
end
private
def device_params
  params.require(:device).permit(:title, :description, :serial, :active, :device_real, :device_type, :device_telnet)
end

end
