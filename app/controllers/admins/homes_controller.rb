class Admins::HomesController < ApplicationController
    before_action :authenticate_admin!

    def top
     @order = Order.where("created_at >= ?", Date.today).count
    end

end
