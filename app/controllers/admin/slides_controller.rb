module Admin
  class SlidesController < AdminController
    before_action :set_slide, only: [:show, :edit, :update, :destroy, :show, :destroy_image]

    def index
      @slides = Slide.all
    end

    def edit
    end

    def show
    end

    def create
      @slide = Slide.new(slide_params)
      respond_to do |format|
        if @slide.save
          format.html { redirect_to admin_slides_path, notice: 'Banner creado exitosamente' }
          format.json { render :show, status: :created, location: @slide }
        else
          format.html { render :new }
          format.json { render json: @slide.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @slide.update(slide_params)
          @slide.image.reprocess! if image_edit(params[:slide])
          format.html { redirect_to admin_slides_path, notice: 'Banner actualizado exitosamente' }
          format.json { render :show, status: :ok, location: @slide }
        else
          format.html { render :edit }
          format.json { render json: @slide.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @slide.destroy
      respond_to do |format|
        format.html { redirect_to admin_slides_url, notice: 'Banner eliminado exitosamente' }
        format.json { head :no_content }
      end
    end

    def destroy_image
      if @slide.present?
        @slide.image.destroy
        @slide.save
      end
    end

    private

    def set_slide
      @slide = Slide.find(params[:id])
    end

    def slide_params
      params.require(:slide)
            .permit(:title, :caption, :video_url, :active, :crop_x, :crop_y,
                    :crop_w, :crop_h, :image)
    end
  end
end
