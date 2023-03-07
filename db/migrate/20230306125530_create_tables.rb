class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table "action_text_rich_texts", force: :cascade do |t|
      t.string "name", null: false
      t.text "body"
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
    end
  
    create_table "active_storage_attachments", force: :cascade do |t|
      t.string "name", null: false
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.bigint "blob_id", null: false
      t.datetime "created_at", null: false
      t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
      t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    end
  
    create_table "active_storage_blobs", force: :cascade do |t|
      t.string "key", null: false
      t.string "filename", null: false
      t.string "content_type"
      t.text "metadata"
      t.string "service_name", null: false
      t.bigint "byte_size", null: false
      t.string "checksum"
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    end
  
    create_table "active_storage_variant_records", force: :cascade do |t|
      t.bigint "blob_id", null: false
      t.string "variation_digest", null: false
      t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
    end
  
    create_table "administrators", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_administrators_on_email", unique: true
      t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
    end
  
    create_table "anatomy_images", force: :cascade do |t|
      t.bigint "anatomy_sub_sections_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["anatomy_sub_sections_id"], name: "index_anatomy_images_on_anatomy_sub_sections_id"
    end
  
    create_table "anatomy_sections", force: :cascade do |t|
      t.string "title"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "anatomy_sub_sections", force: :cascade do |t|
      t.string "title"
      t.bigint "anatomy_section_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["anatomy_section_id"], name: "index_anatomy_sub_sections_on_anatomy_section_id"
    end
  
    create_table "articles", force: :cascade do |t|
      t.string "title"
      t.bigint "editor_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["editor_id"], name: "index_articles_on_editor_id"
    end
  
    create_table "biochemistries", force: :cascade do |t|
      t.string "video_url"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "editor_roles", force: :cascade do |t|
      t.bigint "editor_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "role_id"
      t.index ["editor_id"], name: "index_editor_roles_on_editor_id"
      t.index ["role_id"], name: "index_editor_roles_on_role_id"
    end
  
    create_table "editors", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "admin", default: false
      t.index ["email"], name: "index_editors_on_email", unique: true
      t.index ["reset_password_token"], name: "index_editors_on_reset_password_token", unique: true
    end
  
    create_table "images", force: :cascade do |t|
      t.string "title"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "lab_sections", force: :cascade do |t|
      t.string "name"
      t.bigint "lab_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["lab_id"], name: "index_lab_sections_on_lab_id"
    end
  
    create_table "lab_sub_sections", force: :cascade do |t|
      t.string "name"
      t.bigint "lab_section_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["lab_section_id"], name: "index_lab_sub_sections_on_lab_section_id"
    end
  
    create_table "lab_videos", force: :cascade do |t|
      t.string "url"
      t.bigint "lab_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["lab_id"], name: "index_lab_videos_on_lab_id"
    end
  
    create_table "label_types", force: :cascade do |t|
      t.string "name"
      t.string "color"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "labels", force: :cascade do |t|
      t.string "text"
      t.float "x_coord"
      t.float "y_coord"
      t.float "z_coord"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "polygon_id"
      t.index ["polygon_id"], name: "index_labels_on_polygon_id"
    end
  
    create_table "labels_type_join_tables", force: :cascade do |t|
      t.bigint "label_id"
      t.bigint "label_type_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["label_id"], name: "index_labels_type_join_tables_on_label_id"
      t.index ["label_type_id"], name: "index_labels_type_join_tables_on_label_type_id"
    end
  
    create_table "labs", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "polygons", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  end
end
