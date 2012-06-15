class InresourcesController < ApplicationController
  
  def index #/outresources/2/inresources
    @outresource = Outresource.find(params[:outresource_id])
    @inresources = @outresource.inresources.all #tutte le risorse interne a quella esterna
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inresources }
     end 
  end
  
  def new #/outresources/2/inresources/new
    @outresource = Outresource.find(params[:outresource_id])
    @inresource = @outresource.inresources.new
    
    #redirect_to new_outresource_inresource(@outresource)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inresources }
    end
  end
  
  def create
    @outresource = Outresource.find(params[:outresource_id])
    @inresource = @outresource.inresources.create(params[:inresource])
    redirect_to outresource_inresources_path(@outresource)
  end
  
  def show
    #@outresource = Outresource.find(params[:outresource_id])
    #@inresource = @outresource.inresources.find(params[:id])
    @inresource = Inresource.find(params[:id]) #questa riga sostituisce le due sopra
    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @inresource }
    end
  end

  def edit
    @inresource = Inresource.find(params[:id])
  end
  
  def update
    @inresource = Inresource.find(params[:id])

    respond_to do |format|
      if @inresource.update_attributes(params[:inresource])
        format.html { render 'show', notice: 'Risorsa Interna was successfully updated.' }
        format.json { render json: @inresource }
      else
        format.html { render action: "edit" }
        format.json { render json: @inresource.errors, status: :unprocessable_entity }
      end
    end
  end
    
  
  def destroy
    @outresource = Outresource.find(params[:outresource_id])
    @inresource = @outresource.inresources.find(params[:id])
    @inresource.destroy
    redirect_to outresource_inresources_path(@outresource)
  end
  
  
end
