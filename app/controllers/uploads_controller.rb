class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_questions
    @upload = Upload.find(params[:upload_id])

    @subtopic = Subtopic.find(params[:subtopic_id])

    logger.debug "Loading image file "

    @images = @upload.pictures.path

    logger.debug "compleated Loading image file #{@images}"

    logger.debug "Loading Questions ====>"

    @questions =  table @upload.document.path , @images

    logger.debug "Completed Loading  Questions "

    logger.debug "Loading Answers ====>"

    @answers = table @upload.response.path, @images

    logger.debug "Completed Loading  Answers "

    num = 0;

    @questions.zip(@answers).each do |question, answer|
      # p "#{question}  ::::::::::::: #{answer}"
      logger.debug "Saving Question & Answer #{num}"
       @subtopic.questions.create!(:question => question).build_response(:answer => answer).save
      num +=1
    end

    

  end

  def process_questions

     # if @questions.save
      respond_to do |format|
        format.html { redirect_to get_questions_url, notice: 'Document was successfully processed.' }
      end
    # else
    #     format.html { render :edit }
    #     format.json { render json: @upload.errors, status: :unprocessable_entity }
    # end
  end

  private

  def table path , image_file_path

    image_path = image_file_path
    doc = path
    doc = Nokogiri::HTML(open("#{doc}"))

    ###*******extract images from zipped file**********########
   
  unless image_path.nil?

    Zip::File.open("#{image_path}") do |zipfile|
      zipfile.each do |entry|
        f_path=File.join("#{image_path}destination_path", entry.name )
        FileUtils.mkdir_p(File.dirname(f_path))
        zipfile.extract(entry, f_path) unless File.exist?(f_path)
        logger.debug "Loading image"
      end
    end

        doc.css('img').each do |img, index|

          image_name = img.attributes.first[1].value # img name

          image_file = Ckeditor.picture_model.new #create new Ckeditor asset

          location =  File.expand_path("..", image_path) + "/#{File.basename image_path}destination_path" #get location for the unziped image.

    # byebug
          file = File.open(location + "/#{image_name}") #open the file

          ##*****upload and save it!)*****#####
          image_file.data = file
          image_file.save!

           ##***Update image url****#####
          img.attributes.first[1].value = image_file.url
            
        end

  end

  ##*********Find  all images in the document and upload them to the DB and update their paths as well.********###

    
  

    # tags = %w[p ul li h6 h5 h4 h3 h2 h1 em strong i b table thead tbody th tr td]
    tags = %w[p ul li font b h6 h5 h4 h3 h2 h1 em table thead tbody th tr td]

    nodes = doc.css(tags.join(', '))

    question = []
    extra = []
    info = []
    regex =/\b^(QUESTION)\b\s\d+$/
    index = []
    temp = []
    space = " "
    img = []
    even_temp = []

  doc.css('p').each_with_index do |par, index|
    next_paragraph_counter = 0
    
    if regex.match(par.text.squish)
      puts "found a QUESTION!! #{par.text}"
      next_paragraph_counter +=1
      temp << par.to_html + space
      next_par = doc.css('p')[index+next_paragraph_counter]
      next_par_in_qn = next_par
      loop do
        
        if next_par_in_qn.nil? ||regex.match(next_par_in_qn.text.squish)  
          break
        else
          
            if regex.match(next_par_in_qn.text.squish)
              break
            else
              # p "The current paragraph #{index}"
              # p "THE current par counter = #{next_paragraph_counter}"
              # p "THE CURRENT PARA #{par.to_s}"
              # p "nxt par in this question itself XXXXX #{next_par_in_qn.to_s} XXXXXX "
              # p "OOOOOOOOOOOOOOOOOOO"
              # p "Unsquished text #{next_par_in_qn.inner_html}"
              # p "squished text #{next_par_in_qn.content.squish}"
              # p "OOOOOOOOOOOOOOOOOOO"
              # p " " 
              # p " adding next par to array "

              # if par.content == ""
              #     p "#{par.to_s}"
              # end
              if next_par_in_qn.parent.parent.parent.name == 'table'
                # even_temp.clear
                # break if next_par_in_qn.parent.parent.parent.name != 'table' 
                # next_paragraph_counter +=1
                # next_par_in_qn = doc.css('p')[index+next_paragraph_counter]
                
                # even_temp << next_par_in_qn.parent.parent.parent.to_html
                  loop { 

                    p "next item in table #{next_par_in_qn.content.squish}"
                    even_temp << next_par_in_qn.parent.parent.parent.to_html

                    # break if next_par_in_qn.parent.parent.parent.name != 'table' 
                    # next_paragraph_counter +=1
                    next_par_in_qn = doc.css('p')[index+next_paragraph_counter]
                    next_paragraph_counter +=1
                    break if next_par_in_qn.parent.parent.parent.name != 'table' 
                   }
                  p "EVEN TEMP LAST  #{even_temp.length}"
                # temp << even_temp.last
              else
                if even_temp.last.nil?
                  temp << next_par_in_qn.to_html #+ even_temp.last
                else
                  p "EVEN TEMP LAST#{even_temp.length-1}"
                  temp << even_temp.last + next_par_in_qn.to_html 
                  even_temp.clear
                end
              end
              # next_par_in_qn.content = next_par_in_qn.content.squish!
              
              # p " going to the next paragraph within a question"
              # next_paragraph_counter +=1
              # next_par_in_qn = doc.css('p')[index+next_paragraph_counter]
              # p " " 
              # p " " 
              break if next_par_in_qn.text.squish == "END" || next_paragraph_counter == doc.css('p').count || regex.match(next_par_in_qn.text.squish )
              next_paragraph_counter +=1
              next_par_in_qn = doc.css('p')[index+next_paragraph_counter]
              
              
            end
        end
      end
      question << temp.join + space
      temp.clear

    else
      # p "I'm going to the next question"
      #   if par.content == ""
      #             p "#{par.to_s}"
      #   end
      next
    end
  end
  return question
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:subtopic_id, :document, :response, :pictures)
    end
end
