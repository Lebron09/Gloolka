class ChartsController < ApplicationController
    before_action :check_developers

    def check_developers
        @chart1 = {
            Developers_without_managers: @developers_with_managers = Developer.where.not(manager_id: nil).count,
            Developers_with_managers:@developers_without_managers = Developer.where(manager_id: nil).count
        }
    end

end