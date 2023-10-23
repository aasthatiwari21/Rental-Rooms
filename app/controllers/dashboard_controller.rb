class DashboardController < ApplicationController

	def index
		@property=Property.find_by(params: [:id])

		@property = current_user.success
	end
end
