class SubjectsController < ApplicationController

  respond_to :html 
  
  # GET /subjects
  # GET /subjects.json
  $nday = "M"
  $day = "M"

  def index
    @subjects = Subject.order("name")
    @student_names = Hash.new
    @student_names.store(NIL, "_____")
    @subjects.each do |s|
      if (s.student_id != NIL)
        stu = Student.find(s.student_id)
        @student_names.store(s.student_id, stu.name)
      end
    end
    respond_with(@subjects, @student_names)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])
    @view_all = params[:view_all]
    @assignments = @subject.assignments.all
    @new_assign = @subject.assignments.build
    @subject_id = @subject.id
    @adate = @subject.get_next_assignment_date

    respond_with(@assignments, @new_assign, @subject_id, @adate)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def view
    @subject = Subject.find(params[:id])
      @assignments = @subject.assignments.limit(10).reverse_order
    @new_assign = @subject.assignments.build
    @subject_id = @subject.id
    @adate = @subject.get_next_assignment_date

    respond_with(@assignments, @new_assign, @subject_id, @adate)
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @resources = Resource.order("title")
    # Don't want to be able to select student here, but not sure how to disable it
    @students = Student.where(:name => "xxxx")
    @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
    @resources = Resource.order("title")
    @students = Student.order("name")
    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
     @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        format.html { redirect_to :subjects, :notice => 'Subject was successfully created.' }
        format.json { render :json => @subject, :status => :created, :location => @subject }
      else
        format.html { render :action => "new" }
        format.json { render :json => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])

        format.html { redirect_to subjects_url, :notice => 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end
end
