# テーブル設計

## usersテーブル

｜ Colum      ｜ Type       ｜ Option                         ｜
｜ ---------- ｜ ---------- ｜ ------------------------------ ｜
｜ nickname   ｜ string     ｜ null: false                    ｜
｜ email      ｜ string     ｜ null: false                    ｜
｜ password   ｜ string     ｜ null: false                    ｜
｜ first_name ｜ string     ｜ null: false                    ｜
｜ last_name  ｜ string     ｜ null: false                    ｜
｜ birthday   ｜ integer    ｜ null: false                    ｜

### Association

- has_many :items
- has_many :buys

## itemsテーブル

｜ Colum         ｜ Type       ｜ Option                         ｜
｜ ------------- ｜ ---------- ｜ ------------------------------ ｜
｜ item_name     ｜ string     ｜ null: false                    ｜
｜ info          ｜ text       ｜ null: false                    ｜
｜ price         ｜ integer    ｜ null: false                    ｜
｜ category      ｜ string     ｜ null: false                    ｜
｜ sales_status  ｜ string     ｜ null: false                    ｜
｜ shipping_fee  ｜ string     ｜ null: false                    ｜
｜ shipping_area ｜ string     ｜ null: false                    ｜
｜ schedule      ｜ string     ｜ null: false                    ｜
｜ user          ｜ references ｜ null: false, foreign_key: true ｜

### Association

- belongs_to :user
- has_one :buy

## buysテーブル

｜ Colum      ｜ Type       ｜ Option                         ｜
｜ ---------- ｜ ---------- ｜ ------------------------------ ｜
｜ item       ｜ references ｜ null: false, foreign_key: true ｜
｜ user       ｜ references ｜ null: false, foreign_key: true ｜

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

｜ Colum      ｜ Type       ｜ Option                         ｜
｜ ---------- ｜ ---------- ｜ ------------------------------ ｜
｜ post_code  ｜ integer    ｜ null: false                    ｜
｜ prefecture ｜ string     ｜ null: false                    ｜
｜ city       ｜ string     ｜ null: false                    ｜
｜ addresses  ｜ string     ｜ null: false                    ｜
｜ building   ｜ string     ｜ null: false                    ｜
｜ phone      ｜ integer    ｜ null: false                    ｜
｜ buy        ｜ references ｜ null: false, foreign_key: true ｜

### Association

- belongs_to :buy