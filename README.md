# テーブル設計

## usersテーブル

｜ Colum              ｜ Type       ｜ Option                         ｜
｜ ------------------ ｜ ---------- ｜ ------------------------------ ｜
｜ nickname           ｜ string     ｜ null: false                    ｜
｜ email              ｜ string     ｜ null: false, unique: true      ｜
｜ encrypted_password ｜ string     ｜ null: false                    ｜
｜ first_name         ｜ string     ｜ null: false                    ｜
｜ last_name          ｜ string     ｜ null: false                    ｜
｜ first_name_ruby    ｜ string     ｜ null: false                    ｜
｜ last_name_ruby     ｜ string     ｜ null: false                    ｜
｜ birthday           ｜ date       ｜ null: false                    ｜

### Association

- has_many :items
- has_many :buys

## itemsテーブル

｜ Colum            ｜ Type       ｜ Option                         ｜
｜ ---------------- ｜ ---------- ｜ ------------------------------ ｜
｜ item_name        ｜ string     ｜ null: false                    ｜
｜ info             ｜ text       ｜ null: false                    ｜
｜ price            ｜ integer    ｜ null: false                    ｜
｜ category_id      ｜ strings    ｜ null: false                    ｜
｜ sales_status_id  ｜ strings    ｜ null: false                    ｜
｜ shipping_fee_id  ｜ strings    ｜ null: false                    ｜
｜ prefecture_id    ｜ strings    ｜ null: false                    ｜
｜ schedule_id      ｜ strings    ｜ null: false                    ｜
｜ user             ｜ references ｜ null: false, foreign_key: true ｜

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

｜ Colum         ｜ Type       ｜ Option                         ｜
｜ ------------- ｜ ---------- ｜ ------------------------------ ｜
｜ post_code     ｜ string     ｜ null: false                    ｜
｜ prefecture_id ｜ strings    ｜ null: false                    ｜
｜ city          ｜ string     ｜ null: false                    ｜
｜ addresses     ｜ string     ｜                                ｜
｜ building      ｜ string     ｜ null: false                    ｜
｜ phone         ｜ integer    ｜ null: false                    ｜
｜ buy           ｜ references ｜ null: false, foreign_key: true ｜

### Association

- belongs_to :buy