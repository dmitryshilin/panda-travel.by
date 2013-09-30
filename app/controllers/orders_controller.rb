class OrdersController < ApplicationController
  def create
    @tour = Tour.friendly.find params[:tour_id]
    @order = @tour.orders.build order_params

    if @order.save
      render json: { success: 'Тур успешно заказан. С вами свяжутся в ближайшее время!' }
    else
      render json: @order.errors, status: :unprocessable_entity
    end

  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :phone, :notation, :tour_id)
  end
end
