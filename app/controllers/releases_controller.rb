class ReleasesController < ApplicationController
def index
  @releases = Release.all
end

def create
  @release = Release.new(release_params)
  if @release.save
    flash[:notice]="Release Added successfully"
    redirect_to release_path(@release)
    # redirect_to root_path
  else
    render 'new'
  end
end

def new
  @release = Release.new

end

def show
  @release= Release.find(params[:id])
end

def edit
  @release = Release.find(params[:id])
end

def update
  @release = Release.find(params[:id])
  if @release.update(release_params)
    flash[:notice]="Release Updated successfully"
    redirect_to release_path(@release)
  else
    render 'edit'
  end
end

def destroy
  @release= Release.find(params[:id])
  if @release.destroy
    flash[:danger]="Release Deleted successfully"
    redirect_to releases_path
  else

  end
end
private
def release_params
  params.require(:release).permit(:title, :description, :active)
end
end
