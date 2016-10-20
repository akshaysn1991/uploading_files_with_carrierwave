class DocumentsController < ApplicationController
  protect_from_forgery
  def index
    @documents = Document.all
    @document = Document.new
  end

  def new
    @document = Document.new
  end

  def create
  	  # byebug
       
      @document = Document.new(document_params)
     # @document.save
      

      respond_to do |format|
      if @document.save
         flash[:notice] = "Comment successfully created"
        format.html { redirect_to documents_path, notice: 'File was successfully created.' }
        format.js   { flash.now[:notice] = "Here is my flash notice" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
        format.js   { }
      end


end
      
    # if @document.save
    #   redirect_to documents_path, notice: "The document #{@document.name} has been uploaded."
    # else
    #   render "new"
    # end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path, notice:  "The document #{@document.name} has been deleted."
  end

private
  def document_params

     params.fetch(:document, {}).permit(:attachment, :name)
    # params.require(:document).permit(:name, :attachment)
  end
end
