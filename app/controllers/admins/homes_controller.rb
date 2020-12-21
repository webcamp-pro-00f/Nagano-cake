class Admins::HomesController < ApplicationController
    def top
     @order = Order.where("created_at >= ?", Date.today).count
    end
end
