class WashesController < ApplicationController
    def create
        vehicle = Vehicle.find(params[:id])

        cost = 0.0

        status = true
        
        if vehicle.license_plate == '1111111'
            status = false
            redirect_to '/bad_wash'
        end

        if vehicle.vehicle_type == 'Car'
            cost += 5.0
        elsif vehicle.vehicle_type == "Truck"
            cost += 10.0
        end

        if vehicle.bed_status == false
            status = false
            redirect_to '/bad_wash'
        end

        if vehicle.mud == true
            cost += 2.0
        end

        if vehicle.washes > 1
            cost = cost / 2
        end

        if status == true
            Wash.create(vehicle: vehicle, cost: cost)
            Vehicle.update(params[:id], washes: vehicle.washes += 1)
            redirect_to '/success'
        end
    end
end