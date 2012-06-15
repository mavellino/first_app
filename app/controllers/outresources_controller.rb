class OutresourcesController < ApplicationController
  
  def index
    @outresources= Outresource.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outresources }
     end 
  end

  
  def new
    @outresource = Outresource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outresource }
    end
  end
  
  def edit
    @outresource = Outresource.find(params[:id])
  end
  
  def create
    @outresource = Outresource.new(params[:outresource])

    respond_to do |format|
      if @outresource.save
        format.html { redirect_to @outresource, notice: 'Risorsa Esterna was successfully created.' }
        format.json { render json: @outresource, status: :created, location: @outresource }
      else
        format.html { render action: "new" }
        format.json { render json: @outresource.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @outresource = Outresource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outresource }
    end
  end
  
  def update
    @outresource = Outresource.find(params[:id])

    respond_to do |format|
      if @outresource.update_attributes(params[:outresource])
        format.html { redirect_to @outresource, notice: 'Risorsa Esterna was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @outresource.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @outresource = Outresource.find(params[:id])
    @outresource.destroy

    respond_to do |format|
      format.html { redirect_to outresources_url }
      format.json { head :no_content }
    end
  end
end
