# README

#ER図
![2020-12-26](https://user-images.githubusercontent.com/72295330/103147332-9b88ce00-4797-11eb-8a36-cb23775bbe0b.png)


## NaganoCake  
**Ruby on Railsを使用したWEBアプリケーション（ECサイト）**  

## 概要
**このアプリケーションは下記の擬似要件を元に作成されたECサイトです。**   
&emsp;長野県にある小さな洋菓子店「ながのCAKE」の商品を通販用に作成  
&emsp;煩雑化しつつあった情報管理の改善のため、管理機能を含んだ当ECサイトの開設に至る 
  
**会員側機能**  
・送料は一配送につき全国一律800円  
・注文者本人の住所以外にも複数の住所登録ができ、それらの住所に対し商品の配送が可能  
・ゲストユーザーはサイトの閲覧が可能だが、商品の購入には会員登録が必要  
・商品は一度に複数種類、複数個購入が可能  
・カート内の商品は削除、個数変更等の編集が可能  

**管理者側機能**    
・商品の新規登録、編集、販売停止などの処理が可能  
・ユーザー情報の閲覧、編集、退会処理が可能   
・商品ジャンルに関して、「有効」・「無効」の切り替えが可能であり、  
&emsp;&emsp;無効の場合は非表示処理を施す    
・注文を受けた商品の制作ステータスが全て「制作完了」の状態に更新された場合、    
&emsp;&emsp;注文ステータスを「発送準備中」に自動更新する  

## 仕様
**使用言語**
* HTML&CSS
* Ruby
* Javascript
* フレームワーク
  * Ruby on Rails version: 5.2.4  

**使用したgem**   
* gem 'devise'  
* gem "refile", require: "refile/rails", github: 'manfe/refile'  
* gem "refile-mini_magick"  
* gem 'kaminari','~> 1.2.1'  
* gem 'bootstrap', '~> 4.5'  
* gem 'jquery-rails'  
* gem 'font-awesome-sass', '~> 5.13'

## 開発者
