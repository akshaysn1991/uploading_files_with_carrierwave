class AttachmentsController < ApplicationController
  def index
    # @attachments = Attachment.all.order(created_at: :desc)  
    @attachments = Attachment.all.sort_by { |obj| obj.created_at }
    
  end

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachments_params)
    @attachment.data_type = params[:data_type]
    if @attachment.save
      @attachment.update_attribute(:location, @attachment.attachment.url)
      redirect_to attachments_path, notice: "The file #{@attachment.original_filename} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    redirect_to attachments_path, notice:  "The file #{@attachment.original_filename} has been deleted."
  end

private
  def attachments_params
    params.fetch(:attachment, {}).permit(:attachment, :data_type)
  end
end
