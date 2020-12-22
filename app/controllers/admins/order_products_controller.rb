class Admins::OrderProductsController < ApplicationController
  def update
    order_product = OrderProduct.find(params[:id])
    order = Order.find_by(id: order_product.order_id)
    order_product.update(order_product_params)
    if order_product.making_status == "製作中"
      order.status = "製作中"
      order.save
    end

    if OrderProduct.where(order_id: order_product.order_id, making_status: "製作完了" ).count == OrderProduct.where(order_id: order_product.order_id).count
     order.status = "発送準備中"
     order.save
    end
    redirect_to admins_order_path(order_product.order_id)
  end

 private
  def order_product_params
    params.require(:order_product).permit(:making_status)
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
