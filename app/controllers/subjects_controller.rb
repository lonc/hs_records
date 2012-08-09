class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])
    @assignments = @subject.assignments.all
    @new_assign = @subject.assignments.build
    @subject_id = @subject.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @resources = Resource.order("title")
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
#     @subject.resource_id = params[:subject][:resource_id]
#     @subject.student_id = params[:subject][:student_id]
#     @subject.baseid = params[:subject][:baseid]
#     @subject.attributes = params[:subject]

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, :notice => 'Subject was successfully created.' }
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
        format.html { redirect_to @subject, :notice => 'Subject was successfully updated.' }
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

  # helper method
  def id_helper
    @new_assign.subject_id = @subject.id
  end
end
