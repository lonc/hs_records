class AssignmentsController < ApplicationController

  respond_to :html
  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @assignment }
    end
  end

  # GET /assignments/tc
  def teachers_notes 
    @notes1 = Array.new
    @notes2 = Array.new
    date_params = params[:date]
    @tmp = DateTime.new(date_params["selected(1i)"].to_i, date_params["selected(2i)"].to_i, date_params["selected(3i)"].to_i)
    @date = @tmp.to_date
    @t1 = Assignment.where("date_assigned = ? and watchfor != ?", @date, '')
    @t1.each do |t|
      @sb = t.subject_id
      @subject = Subject.find(@sb).name
      @hsh = {:subject => @subject, :comments => t.watchfor}
      @notes1.push(@hsh)
    end
    @t2 = Assignment.where(:notify_by => @date)
    @t2.each do |t|
      @sb = t.subject_id
      @subject = Subject.find(@sb).name
      @hsh = {:subject => @subject, :date => t.date_assigned, :materials => t.materialsrequired}
      @notes2.push(@hsh)
    end
    @notes1 = @notes1.uniq
    @notes2 = @notes2.uniq

    respond_with(@notes1, @notes2)
    
  end
  # GET /assignments/new
  # GET /assignments/new.json
  def new
    @new_assign = Assignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to :back, :notice => 'Assignment was successfully created.' }
        format.json { render :json => @assignment, :status => :created, :location => @assignment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # POST /students_assign
  # POST /students_assign.json
  def add_assign

    @assign = @subject.assignment.create(params[:assignment])

    respond_to do |format|
      if @assign.save
        format.html # _new_assign.html.erb
        format.json { render :json => @assign }
        end
     end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])
    if params.has_key?(:return_subject)
      @subject = Subject.find(params[:return_subject])
    end

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        if @subject
          format.html { redirect_to @subject, :notice => 'Assignment was successfully updated.' }
        else
          format.html { redirect_to @assignment, :notice => 'Assignment was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render :action => "edit" }
        format.json { render :json => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    if params.has_key?(:return_subject)
      @subject = Subject.find(params[:return_subject])
    end
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
        if @subject
          format.html { redirect_to @subject }
        else
          format.html { redirect_to assignments_url }
        end
      format.json { head :no_content }
    end
  end
end
