require "selenium-webdriver"
require 'csv'

#bomの宣言
bom = %w(EF BB BF).map { |e| e.hex.chr }.join
csv_file = CSV.generate(bom) do |csv|
  csv << ["No",  "name", "city", "name_url", "url", "review_user", "review_time", "review"]
end

File.open("result2.csv", "w") do |file|
  file.write(csv_file)
end
# ブラウザの起動
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(timeout: 30) # 最大30秒待つ

begin
  # ページへのアクセス
  driver.get "https://travel.rakuten.co.jp/review/"
  element = driver.find_element(:id, 'searchBox')
  element.send_keys('1歳')
  driver.find_element(:id, 'searchSubmit').click
  driver.find_element(:xpath, '//*[@id="narrow"]/div[1]/ul/li/ul/li[12]/a').click
  driver.find_element(:xpath, '//*[@id="narrow"]/div[2]/ul/li/ul/li[2]/a').click
  




  urls = []
  narrow_section = wait.until { driver.find_element(:id, 'result') }
  
  narrow_section.find_elements(:class, 'more').each do |list_item|
    link = list_item.find_element(:tag_name, 'a')
    urls << link.attribute('href') # href属性の値を取得して配列に追加
  end
  
  data = []
urls.each_with_index do |url, index|
  begin
    driver.get(url)
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { driver.find_element(:id, 'RthNameArea') }
    name_element = driver.find_element(:id, 'RthNameArea')
    name = name_element.text

    city_element = driver.find_element(:xpath, '//*[@id="breadcrumbs-middle"]/span')
    city = city_element.text

    name_url_element = driver.find_element(:tag_name, 'h2').find_element(:tag_name, 'a')
    name_url = name_url_element.attribute("href")


    review_user_element =driver.find_element(:class, 'user')
    review_user = review_user_element.text


    review_time_element = driver.find_element(:xpath, '//*[@id="commentArea"]/div[1]/div[1]/dl[1]/dt/span[2]')
    review_time = review_time_element.text
    
    review_element = driver.find_element(:xpath, '//div[1]/div[1]/dl[1]/dd/p')
    review = review_element.text

    
    data << [name, city, name_url, url, review_user, review_time, review]
    rescue Selenium::WebDriver::Error::TimeoutError
      puts "#{url} の読み込み中にタイムアウトしました。"
    end

    CSV.open("result.csv", "a") do |file|
      file << [index + 2831 , name, city, name_url, url, review_user, review_time, review]
    end
  end

end

