class DemandAndProductReturnsController < ApplicationController

  before_filter :signed_in_user

  def new
    @demand_and_product_return = DemandAndProductReturn.new
  end

  def index
    @demand_and_product_returns = DemandAndProductReturn.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @demand_and_product_returns }
    end
  end

  def update
    @demand_and_product_return = DemandAndProductReturn.find(params[:id])

    if @demand_and_product_return.update_attributes(params[:demand_and_product_return])
      flash[:success] = "Update successful!"
      redirect_to(demand_and_product_returns_path)
    else
      render 'edit'
    end
  end

  def destroy
    @demand_and_product_return = DemandAndProductReturn.find(params[:id])
    @demand_and_product_return.destroy
    flash[:success] = "Demand and Returns destroyed."
    redirect_to demand_and_product_returns_path
  end

  def edit
    @demand_and_product_return = DemandAndProductReturn.find(params[:id])
  end

  def show
    @demand_and_product_return = DemandAndProductReturn.find(params[:id])
  end

  def create
    @demand_and_product_return = DemandAndProductReturn.new(params[:demand_and_product_return])

    if @demand_and_product_return.save
      flash[:success] = "Demand and Returns saved!"
      redirect_to demand_and_product_returns_path
    else
      render 'new'
    end
  end



  def delete_solution

    if File.exist?("Produktionsprogramm.txt")
      File.delete("Produktionsprogramm.txt")
    end

    @demand_and_product_returns = DemandAndProductReturn.all
    @demand_and_product_returns.each { |li|
      li.production_quantity=0.0
      li.remanufacturing_quantity=0.0
      li.serviceable_inventory=0.0
      li.recoverable_inventory=0.0
      li.save
    }
    @objective_function_value=nil
    flash[:success] = "Solution destroyed!"
    redirect_to current_user
  end



  def optimize
    if File.exist?("CLSP_RM_SS_Input.inc")
      File.delete("CLSP_RM_SS_Input.inc")
    end

    f=File.new("CLSP_RM_SS_Input.inc", "w")

    printf(f, "Set t / \n")
    @periods = Period.all
    @periods.each { |ssi| printf(f, "t" + ssi.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "k / \n")
    @products = Product.all
    @products.each { |dsi| printf(f, "k" + dsi.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, ";\n")

    printf(f, "\n\n")

    printf(f, "Parameter\n  pc(k) /\n")
    @production_parameters = ProductionParameter.all
    @production_parameters.each { |so| printf(f, "k" + so.product_id.to_s + "  " + so.production_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\npcr(k) /\n")
    @remanufacturing_parameters = RemanufacturingParameter.all
    @remanufacturing_parameters.each { |si| printf(f, "k" + si.product_id.to_s + "  " + si.remanufacturing_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nsc(k) /\n")

    @production_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.setup_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nscr(k) /\n")

    @remanufacturing_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.setup_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nhc(k) /\n")

    @production_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.holding_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nhcr(k) /\n")

    @remanufacturing_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.holding_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ntp(k) /\n")

    @production_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.production_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ntpr(k) /\n")

    @remanufacturing_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.remanufacturing_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nts(k) /\n")

    @production_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.setup_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ntsr(k) /\n")

    @remanufacturing_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.setup_time.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nc(t) /\n")
    @periods = Period.all
    @periods.each { |li| printf(f, "t" + li.id.to_s + "  " + li.capacity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\ncr(t) /\n")

    @periods.each { |li| printf(f, "t" + li.id.to_s + "  " + li.remanufacturing_capacity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nY0(k) /\n")

    @production_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.initial_inventory.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nY0r(k) /\n")

    @remanufacturing_parameters.each { |li| printf(f, "k" + li.product_id.to_s + "  " + li.initial_inventory.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nd(k,t) /\n")
    @demand_and_product_returns = DemandAndProductReturn.all
    @demand_and_product_returns.each { |li| printf(f, "k" + li.product_id.to_s + "." + "t" + li.period_id.to_s + "  " + li.demand.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nr(k,t) /\n")

    @demand_and_product_returns.each { |li| printf(f, "k" + li.product_id.to_s + "." + "t" + li.period_id.to_s + "  " + li.return.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, ";\n")

    f.close


    if File.exist?("Produktionsprogramm.txt")
      File.delete("Produktionsprogramm.txt")
    end

    system "C:\\GAMS\\win64\\23.9\\gams CLSP_RM_SS"

    flash[:success] = "Optimization started!"
    redirect_to current_user

  end

  def read_solution

    if File.exist?("Produktionsprogramm.txt")

      fi=File.open("Produktionsprogramm.txt", "r")
      line=fi.readline
      sa=line.split(" ")
      @objective_function_value=sa[1]
      fi.each { |line| # printf(f,line)
        sa=line.split(";")
        sa0=sa[0].delete "t "
        sa1=sa[1].delete "k "
        sa2=sa[2].delete " \n"
        sa3=sa[3].delete " \n"
        sa4=sa[4].delete " \n"
        sa5=sa[5].delete " \n"
        al=DemandAndProductReturn.find_by_period_id_and_product_id(sa0, sa1)
        al.production_quantity=sa2
        al.remanufacturing_quantity=sa3
        al.serviceable_inventory=sa4
        al.recoverable_inventory=sa5
        al.save
      }
      fi.close

      @demand_and_product_returns = DemandAndProductReturn.all

      render "demand_and_product_returns/index"

    else
      flash.now[:not_available] = "Problem not solved!"
      @demand_and_product_returns = DemandAndProductReturn.all
      redirect_to demand_and_product_returns_url
    end


  end


  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Bitte melden Sie sich an."
    end
  end

end