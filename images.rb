def table
    doc = Nokogiri::HTML(open("with_table.html"))

    question = []
    extra = []
    info = []
    regex =/\b^(QUESTION)\b\s\d+$/
    index = []
    temp = []
    space = " "
    even_temp =[]
    live = "http://darasa.co.ke"
    local = "localhost:3000"
    folder = "/uploads/ckeditor/pictures/"

    doc.css('img').each_with_index do |img, index|
       
      image = img.attributes.first[1].value # img name
        # question << image

        if Rails.env["development"]
            img.attributes.first[1].value = local + folder + image
        else
            img.attributes.first[1].value = live + folder + image
        end
        question <<   img.attributes.first[1].value
    end
    return question
end