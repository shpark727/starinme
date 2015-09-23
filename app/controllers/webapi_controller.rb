class WebapiController < ApplicationController
	def portfolio
		@portfolios = Posting.all
		respond_to do |format|
			format.json { render json: @portfolios }
			format.xml { render xml: @portfolios}
		end
	end

	def showportfolio	
		@portfolio_detail = Posting.find(params[:id])
		respond_to do |format|
			format.json { render json: @portfolio_detail }
			format.xml { render xml: @portfolio_detail }
		end
	end

	def project
		@projects = Posting.all
		respond_to do |format|
			format.json { render json: @projects }
			format.xml { render xml: @projects }
		end
	end
	
	def showproject
		@projects_detail = Posting.find(params[:id])
		respond_to do |format|
			format.json { render json: @project_detail }
			format.xml { render xml: @project_detail }
		end
	end

	def login
		u = User.where(:email => params[:email],
									 :password => params[:password]).take
		@name ="손님" #initialize
		unless u.nil?
			uniquestring = SecureRandom.hex(8)
		 	session[:uniquestring] = u.id
			u.unique = uniquestring
			@name = where(:id =>session[:uniquestring]).take.name
		end
		respond_to do |format|
				format.json { render json: @name}
				format.xml { render xml: @name}
		end

	#	redirect_to "/"
	end

	def logout
		reset_session
	#	redirect_to "/"
	end

	def signup
		u = User.new
		u.email = params[:email]
		u.password = params[:password]
		u.name = params[:name]
		u.gender = params[:gender]
		u.save	
		if u.save
			@response = Hash.new
			@response["success"] = "success"
			respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
			end
		end	
	end

	def loginfacebook
		u = User.omniauth(env['omniauth.auth'])
		session[:user_id] = u.id
		redirect_to root_url
	end

	def logoutfacebook
		session[:user_id] = nil
	end
	
	def user
		unless session[:uniquestring].nil?
			@u = User.where(:id => session[:uniquestring]).take
			respond_to do |format|
				format.json { render json: @u }	
				format.xml { render xml: @u }
			end
		end
	end
	
		
	def showuser
		@u = User.find(params[:id])
		respond_to do |format|
			format.json { render json: @u}
			format.xml { render xml: @u}
		end
	end

	def edituser
		@u = User.where(:id => session[:uniquestring]).take
		@u.password = params[:password]
		@u.user_type = params[:user_type]
		@u.sns_url = params[:sns_url]
		@u.biography = params[:biography]
		@u.profile_image = params[:profile_image]
		@u.gender = params[:gender]
		@u.age = params[:age]
		@u.save
		if @u.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def createposting
		@p = Posting.new
		@p.title = params[:title]
		@p.content = params[:content]
		@p.topic = params[:topic]
		@p.category = params[:category]
		@p.owner_id = params[:owner_id]
		@p.child_category_id = params[:child_category_id]
		@p.root_category_id = params[:root_category_id]
		@p.status = params[:status]
		@p.start_date = params[:start_date]
		@p.end_date = params[:end_date]
		@p.main_image = params[:main_image]
		@p.save
		if @p.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def modifyposting
		@p = Posting.find(params[:id])
		@p.title = params[:title]
		@p.content = params[:content]
		@p.topic = params[:topic]
		@p.category = params[:category]
		@p.owner_id = params[:owner_id]
		@p.child_category_id = params[:child_category_id]
		@p.root_category_id = params[:root_category_id]
		@p.status = params[:status]
		@p.start_date = params[:start_date]
		@p.end_date = params[:end_date]
		@p.main_image = params[:main_image]
		@p.save	
		if @p.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def deleteposting
		@p = Posting.find(params[:id])
		@p.destroy
		if @p.destroy?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def shareposting
		@s = Share.new
		@s.posting_id = params[:posting_id]
		@s.user_id = params[:user_id]
		@s.outer_url = params[:outer_url]
		@s.outer_platform = params[:outer_platform]
		@s.save		
		if @s.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def likeposting
		@l = Like.new
		@l.posting_id = params[:posting_id]
		@l.user_id = params[:user_id]
		@l.save
		if @l.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end
	
	def deletelikeposting
		@l = Like.find(params[:id])
		@l.destroy
		if @l.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def joinlist
		@joinlist = Join.find(params[:id])
		respond_to do |format|
			format.json { render json:@joinlist }
			format.xml { render xml:@joinlist }
		end
	end

	def joinproject
		@joinproject = Join.new
		@joinproject.project_id = params[:id]
		@joinproject.user_id = session[:uniquestring] 
		@joinproject.status = "프로젝트에 참여 신청되었습니다"
		@joinproject.save	
		if @joinproject.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def joincancel
		@joincancel = Join.where(:project_id => params[:id], :user_id = session[:uniquestring]).take
		@joincancel.destroy 
		if @joincancel.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def joinaccept
		@joinaccept = Join.where(:project_id => params[:id], :user_id = session[:uniquestring]).take
		@joinaccept.status = "프로젝트 참여가 승인되었습니다"
		@joinaccept.save 
		if @joinaccept.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def joinrefuse
		@joinrefuse = Join.where(:project_id => params[:id], :user_id = session[:uniquestring]).take
		@joinrefuse.status = "프로젝트 참여가 거절되었습니다"
		@joinrefuse.save 
		if @p.save?
			@response = Hash.new
			@response["success"] = "success"
				respond_to do |format|
				format.json {render json: @response}
				format.xml {rener xml: @response}
		end
	end

	def categorylist
		@categories = Category.all
			respond_to do |format|
			format.json { render json: @categories }
			format.xml { render xml: @categories }
			end	
	end

	def createcategory
	end

	def postimage
	end
	
	def publics
		@publics = Public.where(:topic => params[:type]).take
			respond_to do |format|
			format.json { render json: @publics }
			format.xml { render xml: @publics }
			end
	end

	def version
		@versions = Version.all
			respond_to do |format|
			format.json { render json: @versions }
			format.xml { render xml: @versions }
		end
	end

end
