# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Lab.delete_all


Lab.create([{ name: "Anatomy" }, { name: "Physiology" }, { name: "Biochemistry" }, { name: "Microbiology" }, { name: "Histology" }, { name: "Pathology" }])
User.create({ email: "test@gmail.com", password: "111111", password_confirmation: "111111"})

#================Anatomy======================================================================
#Section 1-------------------------------------------------------------------
anatomy = Lab.find_by_name("Anatomy").lab_sections.build(name: "3rd Year Anatomy")
anatomy.save
anatomy.logo.attach(io: File.open(Rails.root.join("public/logo.png")), filename: "logo.png")

#sub section 1
anat = anatomy.lab_sub_sections.build(name: "cardiovascular anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/cardiovascular anatomy/1.png")), filename: "1.png")

Dir.each_child(Rails.root.join("public/anatomy_images/3rd Year Anatomy/cardiovascular anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/cardiovascular anatomy/" + filename)), filename: filename)
end

#sub section 2
anat = anatomy.lab_sub_sections.build(name: "central nervous system anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/central nervous system anatomy/24.png")), filename: "24.png")

Dir.each_child(Rails.root.join("public/anatomy_images/3rd Year Anatomy/central nervous system anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/central nervous system anatomy/" + filename)), filename: filename)
end

#sub section 3
anat = anatomy.lab_sub_sections.build(name: "neck anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/neck anatomy/70.png")), filename: "70.png")

Dir.each_child(Rails.root.join("public/anatomy_images/3rd Year Anatomy/neck anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/neck anatomy/" + filename)), filename: filename)
end

#sub section 4
anat = anatomy.lab_sub_sections.build(name: "respiratory system anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/respiratory system anatomy/81.png")), filename: "81.png")

Dir.each_child(Rails.root.join("public/anatomy_images/3rd Year Anatomy/respiratory system anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/respiratory system anatomy/" + filename)), filename: filename)
end

#sub section 5
anat = anatomy.lab_sub_sections.build(name: "breast and genitourinary anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/breast and genitourinary anatomy/94.png")), filename: "94.png")

Dir.each_child(Rails.root.join("public/anatomy_images/3rd Year Anatomy/breast and genitourinary anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/breast and genitourinary anatomy/" + filename)), filename: filename)
end

#sub section 6
anat = anatomy.lab_sub_sections.build(name: "urinary system anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/urinary system anatomy/110.png")), filename: "110.png")

Dir.each_child(Rails.root.join("public/anatomy_images/3rd Year Anatomy/urinary system anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/urinary system anatomy/" + filename)), filename: filename)
end

#sub section 7
anat = anatomy.lab_sub_sections.build(name: "gastrointestinal system anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/gastrointestinal system anatomy/119.png")), filename: "119.png")

Dir.each_child(Rails.root.join("public/anatomy_images/3rd Year Anatomy/gastrointestinal system anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/gastrointestinal system anatomy/" + filename)), filename: filename)
end

#sub section 8
anat = anatomy.lab_sub_sections.build(name: "ear anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/ear anatomy/144.png")), filename: "144.png")

Dir.each_child(Rails.root.join("public/anatomy_images/3rd Year Anatomy/ear anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/ear anatomy/" + filename)), filename: filename)
end

#sub section 9
anat = anatomy.lab_sub_sections.build(name: "eye anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/eye anatomy/149.png")), filename: "149.png")

Dir.each_child(Rails.root.join("public/anatomy_images/3rd Year Anatomy/eye anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/3rd Year Anatomy/eye anatomy/" + filename)), filename: filename)
end

#Section 2---------------------------------------------------------------------------
anatomy = Lab.find_by_name("Anatomy").lab_sections.build(name: "Upper and Lower")
anatomy.save
anatomy.logo.attach(io: File.open(Rails.root.join("public/logo.png")), filename: "logo.png")

#sub section 1
anat = anatomy.lab_sub_sections.build(name: "Upper Limb Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Upper Limb Anatomy/1.png")), filename: "1.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Upper Limb Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Upper Limb Anatomy/" + filename)), filename: filename)
end

#sub section 2
anat = anatomy.lab_sub_sections.build(name: "Shoulder Girdle Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Shoulder Girdle Anatomy/12.png")), filename: "12.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Shoulder Girdle Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Shoulder Girdle Anatomy/" + filename)), filename: filename)
end

#sub section 3
anat = anatomy.lab_sub_sections.build(name: "Arm Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Arm Anatomy/39.png")), filename: "39.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Arm Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Arm Anatomy/" + filename)), filename: filename)
end

#sub section 4
anat = anatomy.lab_sub_sections.build(name: "Forearm Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Forearm Anatomy/54.png")), filename: "54.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Forearm Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Forearm Anatomy/" + filename)), filename: filename)
end

#sub section 5
anat = anatomy.lab_sub_sections.build(name: "Hand Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Hand Anatomy/71.png")), filename: "71.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Hand Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Hand Anatomy/" + filename)), filename: filename)
end

#sub section 6
anat = anatomy.lab_sub_sections.build(name: "Torso Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Torso Anatomy/102.png")), filename: "102.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Torso Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Torso Anatomy/" + filename)), filename: filename)
end

#sub section 7
anat = anatomy.lab_sub_sections.build(name: "Lower Limb Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Lower Limb Anatomy/111.png")), filename: "111.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Lower Limb Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Lower Limb Anatomy/" + filename)), filename: filename)
end

#sub section 8
anat = anatomy.lab_sub_sections.build(name: "Pelvis and Hip Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Pelvis and Hip Anatomy/114.png")), filename: "114.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Pelvis and Hip Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Pelvis and Hip Anatomy/" + filename)), filename: filename)
end

#sub section 9
anat = anatomy.lab_sub_sections.build(name: "Thigh Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Thigh Anatomy/139.png")), filename: "139.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Thigh Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Thigh Anatomy/" + filename)), filename: filename)
end

#sub section 10
anat = anatomy.lab_sub_sections.build(name: "Knee Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Knee Anatomy/154.png")), filename: "154.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Knee Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Knee Anatomy/" + filename)), filename: filename)
end

#sub section 11
anat = anatomy.lab_sub_sections.build(name: "Leg Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Leg Anatomy/165.png")), filename: "165.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Leg Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Leg Anatomy/" + filename)), filename: filename)
end


#sub section 12
anat = anatomy.lab_sub_sections.build(name: "Foot Anatomy")
anat.save
anat.logo.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Foot Anatomy/188.png")), filename: "188.png")

Dir.each_child(Rails.root.join("public/anatomy_images/Upper and Lower/Foot Anatomy")) do |filename|
    anat.images.attach(io: File.open(Rails.root.join("public/anatomy_images/Upper and Lower/Foot Anatomy/" + filename)), filename: filename)
end


#===============Microbiology===================================================
#Section 1---------------------------------------------------------
microbiology = Lab.find_by_name("Microbiology").lab_sections.build(name: "Microbiology 1")
microbiology.save
microbiology.logo.attach(io: File.open(Rails.root.join("public/logo.png")), filename: "logo.png")

#sub section 1
micro = microbiology.lab_sub_sections.build(name: "Microbiology 1 slides")
micro.save
micro.logo.attach(io: File.open(Rails.root.join("public/logo.png")), filename: "logo.png")

Dir.each_child(Rails.root.join("public/microbiology_images/Microbiology 1 slides")) do |filename|
    micro.images.attach(io: File.open(Rails.root.join("public/microbiology_images/Microbiology 1 slides/" + filename)), filename: filename)
end

#Section 2---------------------------------------------------------
microbiology = Lab.find_by_name("Microbiology").lab_sections.build(name: "Microbiology 2")
microbiology.save
microbiology.logo.attach(io: File.open(Rails.root.join("public/logo.png")), filename: "logo.png")

#sub section 1
micro = microbiology.lab_sub_sections.build(name: "Microbiology 2 slides")
micro.save
micro.logo.attach(io: File.open(Rails.root.join("public/logo.png")), filename: "logo.png")

Dir.each_child(Rails.root.join("public/microbiology_images/Microbiology 2 slides")) do |filename|
    micro.images.attach(io: File.open(Rails.root.join("public/microbiology_images/Microbiology 2 slides/" + filename)), filename: filename)
end


#===============Histology===========================================================================
# Add sections
hist = Lab.find_by_name("Histology").lab_sections.build(name: "Histology slides")
hist.save
hist.logo.attach(io: File.open(Rails.root.join("public/histology_images/Intro/1.png")), filename: "1.png")

#Add Sub Sections
#1--------------------------------------------------------
hist_intro = hist.lab_sub_sections.build(name: "Intro")
hist_intro.save
hist_intro.logo.attach(io: File.open(Rails.root.join("public/histology_images/Intro/1.png")), filename: "1.png")

Dir.each_child(Rails.root.join("public/histology_images/Intro")) do |filename|
    hist_intro.images.attach(io: File.open(Rails.root.join("public/histology_images/Intro/" + filename)), filename: filename)
end

#2--------------------------------------------------------
hist_epi = hist.lab_sub_sections.build(name: "Epithelium")
hist_epi.save
hist_epi.logo.attach(io: File.open(Rails.root.join("public/histology_images/Epithelium/3.png")), filename: "3.png")

Dir.each_child(Rails.root.join("public/histology_images/Epithelium")) do |filename|
    hist_epi.images.attach(io: File.open(Rails.root.join("public/histology_images/Epithelium/" + filename)), filename: filename)
end
#3--------------------------------------------------------
hist_emb = hist.lab_sub_sections.build(name: "Embyonic Connective Tissue")
hist_emb.save
hist_emb.logo.attach(io: File.open(Rails.root.join("public/histology_images/Embyonic Connective Tissue/15.png")), filename: "15.png")

Dir.each_child(Rails.root.join("public/histology_images/Embyonic Connective Tissue")) do |filename|
    hist_emb.images.attach(io: File.open(Rails.root.join("public/histology_images/Embyonic Connective Tissue/" + filename)), filename: filename)
end

#4--------------------------------------------------------
hist_cnctv = hist.lab_sub_sections.build(name: "Connective Tissue Proper")
hist_cnctv.save
hist_cnctv.logo.attach(io: File.open(Rails.root.join("public/histology_images/Connective Tissue Proper/17.png")), filename: "17.png")

Dir.each_child(Rails.root.join("public/histology_images/Connective Tissue Proper")) do |filename|
    hist_cnctv.images.attach(io: File.open(Rails.root.join("public/histology_images/Connective Tissue Proper/" + filename)), filename: filename)
end

#5--------------------------------------------------------
hist_special = hist.lab_sub_sections.build(name: "Specialized Connective Tissue: Cartilage")
hist_special.save
hist_special.logo.attach(io: File.open(Rails.root.join("public/histology_images/Specialized Connective Tissue: Cartilage/23.png")), filename: "23.png")

Dir.each_child(Rails.root.join("public/histology_images/Specialized Connective Tissue: Cartilage")) do |filename|
    hist_special.images.attach(io: File.open(Rails.root.join("public/histology_images/Specialized Connective Tissue: Cartilage/" + filename)), filename: filename)
end

#6--------------------------------------------------------
hist_special2 = hist.lab_sub_sections.build(name: "Specialized Connective Tissue: Bone")
hist_special2.save
hist_special2.logo.attach(io: File.open(Rails.root.join("public/histology_images/Specialized Connective Tissue: Bone/29.png")), filename: "29.png")

Dir.each_child(Rails.root.join("public/histology_images/Specialized Connective Tissue: Bone")) do |filename|
    hist_special2.images.attach(io: File.open(Rails.root.join("public/histology_images/Specialized Connective Tissue: Bone/" + filename)), filename: filename)
end

#7--------------------------------------------------------
hist_special3 = hist.lab_sub_sections.build(name: "Specialized Connective Tissue: Blood")
hist_special3.save
hist_special3.logo.attach(io: File.open(Rails.root.join("public/histology_images/Specialized Connective Tissue: Blood/32.png")), filename: "32.png")

Dir.each_child(Rails.root.join("public/histology_images/Specialized Connective Tissue: Blood")) do |filename|
    hist_special3.images.attach(io: File.open(Rails.root.join("public/histology_images/Specialized Connective Tissue: Blood/" + filename)), filename: filename)
end

#8--------------------------------------------------------
hist_muscle = hist.lab_sub_sections.build(name: "Muscle Tissue")
hist_muscle.save
hist_muscle.logo.attach(io: File.open(Rails.root.join("public/histology_images/Muscle Tissue/35.png")), filename: "35.png")

Dir.each_child(Rails.root.join("public/histology_images/Muscle Tissue")) do |filename|
    hist_muscle.images.attach(io: File.open(Rails.root.join("public/histology_images/Muscle Tissue/" + filename)), filename: filename)
end


#===============Pathology===================================================
#Section 1--------------------------------------------------
path = Lab.find_by_name("Pathology").lab_sections.build(name: "Pathology slides")
path.save
path.logo.attach(io: File.open(Rails.root.join("public/logo.png")), filename: "logo.png")

#sub section 1--------------------------------------------------------
temp = path.lab_sub_sections.build(name: "pathology")
temp.save
temp.logo.attach(io: File.open(Rails.root.join("public/logo.png")), filename: "logo.png")

Dir.each_child(Rails.root.join("public/pathology_images")) do |filename|
    temp.images.attach(io: File.open(Rails.root.join("public/pathology_images/" + filename)), filename: filename)
end