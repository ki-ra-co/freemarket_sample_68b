
.new-listing
  .new-listing__single-container
    = form_with(model: @product, local: true) do |f|
      .new-listing__single-head
        商品の情報を入力
      .new-listing__sell-form
        .new-listing__sell-upload-box
          .new-listing__sell-upload-head
            出品画像
            .new-listing__form-require
              必須
        .new-listing__p
          最大10枚までアップロードできます
        .new-listing__sell-dropbox
          = f.fields_for :images do |i|
            .new-listing__sell-upload-items-container
            %label
              .new-listing__sell-upload-drop-box
                = i.file_field :name, class: "sell-upload-drop-file"
                %pre.visible-pc
                  :preserve
                    ドラッグアンドドロップ
                    またはクリックしてファイルをアップロード
        .new-listing__no-image
          画像がありません

                
      .new-listing__sell-content
        .new-listing__form-group
          .new-listing__sell-upload-head
            = f.label :name,"商品名" 
            %span.new-listing__form-require 
              必須
          = f.text_field :name ,class: "input-default" ,placeholder: "商品名（必須 40文字まで)"
        .new-listing__no-product.no-product-name
        .new-listing__form-group
          .new-listing__sell-upload-head
            = f.label :description, "商品の説明"
            %span.new-listing__form-require
              必須
          = f.text_area :description, class: "textarea-default", placeholder: "商品の説明（必須 1,000文字以内）（色、素材、重さ、定価、注意点など）例）2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。あわせやすいのでおすすめです。"
        .new-listing__no-product.no-product2
        
      .new-listing__content-show
        %h3.show-sub-head
          商品の詳細
        .new-listing__show-form-box
          .new-listing__tk-form-group
            .new-listing__sell-upload-head
              カテゴリー
              %span.new-listing__form-require
                必須
            .new-listing__select-wrap
              -# = f.select :category, [["メンズ",1]]
              .new-listing__no-product
                選択してください
          .new-listing__tk-form-group
            .new-listing__sell-upload-head
              = f.label :ブランド
              %span.new-listing__form-require2
                任意
            .new-listing__select-wrap
              = f.text_field :brand, class: "brand-select", placeholder: "例）シャネル"

          .new-listing__tk-form-group
            .new-listing__sell-upload-head
              = f.label :status,"商品の状態"
              %span.new-listing__form-require
                必須
            .new-listing__select-wrap
              %i.icon-arrow-bottom
                = f.select :condition, [["新品/未使用",0],["未使用に近い",1],["目立った傷や汚れなし",2],["やや傷や汚れなし",3],["傷や汚れあり",4],["全体的に状態が悪い",5]], prompt: "---", class: "select-default"
              .new-listing__no-product.no-product4
                  

      .new-listing__content-show2
        %h3.show-sub-head
          配送について
        %a.form-question{:href => "/jp/help_center/article/68/", :target => "_blank"} 
          ?
        .new-listing__show-form-box
          .new-listing__tk-form-group
            .new-listing__sell-upload-head
              = f.label :send_price,"配送料の負担"
              %apan.new-listing__form-require
                必須
            .new-listing__select-wrap
              = f.select :send_price, [["送料込み(出品者負担)",0],["着払い(購入者負担)",1]], prompt: "---", class: "select-default"
              .new-listing__no-product.no-product5
                  

          .new-listing__tk-form-group
            .new-listing__sell-upload-head
              発送元の地域
              .new-listing__form-require
                必須
            .new-listing__select-wrap
              %i.icon-arrow-bottom
                = f.collection_select(:prefecture_id, Prefecture.all, :id, :name, prompt: "---")
              .new-listing__no-product
                選択してください
          
          .new-listing__tk-form-group
            .new-listing__sell-upload-head
              = f.label :ship_day,"発送までの日数"
              %span.new-listing__form-require
                必須
            .new-listing__select-wrap
              = f.select :ship_day, [["1~2日で発送", 0], ["2~3日で発送", 1], ["4~7日で発送", 2]], class: "select", prompt: "---"
              .new-listing__no-product.no-product7
                  
      .new-listing__settlement
        %p.tk-value
          価格（¥300~9,999,999)
          %a.form-question{:href => "/jp/help_center/article/68/", :target => "_blank"} 
            ?
        .new-listing__tk-selling-price
          .new-listing__input-price
            .new-listing__sell-upload-head2
              = f.label :price,"販売価格"
              %span.new-listing__form-require
                必須
            %span.doll-mark
              ¥
            .new-listing__enter-price
              .new-listing__enter-price2
                = f.number_field :price, placeholder: "0", class: "tk-price"
                .new-listing__no-product.no-product2
                  
          .new-listing__commission
            .new-listing__commision-box
              .new_listing__commission-font{"data-test" => "fee-label"}
                %div 
                  販売手数料（10%）
              %span.money{"data-test" => "fee-value"} 
                —
          .new-listing__commission2
            .new-listing__commision-box
              .new_listing__commission-font{"data-test" => "fee-label"}
                %div 
                  販売利益
              %span.money{"data-test" => "fee-value"} 
                —
        .new-listing__send-boxes
          .new-listing__send-box
            = f.submit "変更を確定する", class: "send-btn"
            %a.return-btn{:href => product_path} 
              商品詳細に戻る
        %p.note
          禁止されている行為および出品物を必ずご確認ください。偽ブランド品や盗品物などの販売は犯罪であり、法律により処罰される可能性があります。また、出品をもちまして加盟店規約に同意したことになります。