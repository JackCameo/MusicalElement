class LibrariesController < ApplicationController

  def new
        @library = Library.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @track }
    end
  end

  def index
    @libraries = Library.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @libraries }
    end
  end

  def show
    @library = Library.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @library }
    end
  end

  def destroy
  end

  def create
    @library = Library.new(params[:library])
    respond_to do |format|
      # binding.pry
      if @library.save
        format.html { redirect_to @library, notice: 'Library was successfully created.' }
        format.json { render json: @library, status: :created, location: @library }
      else
        format.html { render action: "new" }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end


end
