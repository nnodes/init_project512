module Admin
  class UsersController < AdminController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :reservations]

    def index
      respond_to do |format|
        format.html
        format.json { render json: UsersDatatable.new(view_context, {action: params[:action]}) }
        format.xlsx { 
          @users = User.all
          filename = 'Usuarios'
          response.headers['Content-Disposition'] = "attachment; filename='#{filename}.xlsx'"
          render
        }
      end
    end

    def show
    end

    def edit
    end

    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to admin_user_path(@user), notice: 'Usuario creado exitosamente' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to admin_user_path(@user), notice: 'Usuario actualizado exitosamente' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_url, notice: 'Usuario eliminado exitosamente' }
        format.json { head :no_content }
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user)
            .permit(:email, :active, :role, :password, :password_confirmation)
    end
  end
end
