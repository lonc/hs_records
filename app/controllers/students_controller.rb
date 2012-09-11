class StudentsController < ApplicationController

  respond_to :html 
  @@assignment_list = Array.new

  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/1/select_daily
  def select_daily
   @students = Student.all
   respond_with (@students)
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/1/daily_list
  def daily_list
    @student_list = Array.new
    @students = params[:students]
    date_params = params[:date]
    @date = DateTime.new(date_params["assigned(1i)"].to_i, date_params["assigned(2i)"].to_i, date_params["assigned(3i)"].to_i)
    @students.each do |s|
      stu = Student.find(s)
      @assign_list = Student.daily_assignments stu, @date
      @assign_list.each do |al|
        @@assignment_list.push(al[:id])
      end
      student_h = {:student => stu, :a_list => @assign_list}
      @student_list.push(student_h)
    end
    respond_with(@student_list)
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # GET /students/1/select_subjects
  def select_subjects
    @student = Student.find(params[:id])
    @subns = Subject.where(:student_id => nil).select("name").order("name")
    @subns = @subns.map{|sub| sub.name} 
    @subds = Subject.where(:student_id => nil).select("id").order("name")
    @subds = @subds.map{|sub| sub.id} 
    @subject_hash = Hash[@subds.zip @subns]
  end
 
  # PUT /students/1/select_save
  def select_save
    @class = params[:class]
    @student_id = params[:id]
    start_params = params[:start_date]
    if start_params["start(1i)"] == ""
      @start_date = nil
    else
      @start_date = DateTime.new(start_params["start(1i)"].to_i, start_params["start(2i)"].to_i, start_params["start(3i)"].to_i)
    end
    stop_params = params[:stop_date]
    if stop_params["start(1i)"] == ""
      @stop_date = nil
    else
      @stop_date = DateTime.new(stop_params["stop(1i)"].to_i, stop_params["stop(2i)"].to_i, stop_params["stop(3i)"].to_i)
    end
    @class.each do |id|
      @dest = Subject.find_student_subject id, @student_id
      if @dest.blank?
        src_subject = Subject.find(id)
        new_subject = src_subject.dup
        new_subject.student_id = @student_id
        new_subject.save
        @dest_id = new_subject.id
      else
        @dest_id = @dest.map{|d| d.id}
      end

      @start_date = @start_date - 1 if @start_date
      Subject.dup_assignments id, @dest_id, @start_date, @stop_date
#      src_subject = Subject.find(id)
#      src_assignments = src_subject.assignments.where(:date_assigned => @start_date..@stop_date)
#      src_assignments.each do |assignment|
#        new_assignment = assignment.dup
#        new_assignment.save
#        debugger
#        new_assignment.update_attributes(:subject_id => @dest_id)
#      end
    end

    respond_to do |format|
      format.html { redirect_to students_url, :notice => 'Subject and assignments created.' }
    end
  end


  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, :notice => 'Student was successfully created.' }
        format.json { render :json => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, :notice => 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students
  def update_assigned
    respond_to do |format|
      if Assignment.upd_assign @@assignment_list
        format.html { redirect_to students_url, :notice => 'Assignments were marked as assigned.' }
      else
        format.html { redirect_to students_url, :notice => 'WARNING:: NO ASSIGNMENTS WERE MARKED AS ASSIGNED.' }
      end
    end
  end

    
  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
