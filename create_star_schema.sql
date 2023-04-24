    -- dim_date table
CREATE TABLE dim_date (
  date_id INT AUTO_INCREMENT PRIMARY KEY,
  gregorian_date DATE NOT NULL,
  day_of_week VARCHAR(10),
  day_of_month INT,
  month INT,
  year INT
);

-- dim_customer table
CREATE TABLE dim_customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer INT NOT NULL,
  account_number VARCHAR(20) NOT NULL,
  account_name VARCHAR(100),
  account_status VARCHAR(20)
);

-- dim_campaign table
CREATE TABLE dim_campaign (
  campaign_id INT AUTO_INCREMENT PRIMARY KEY,
  campaign_name VARCHAR(100) NOT NULL,
  campaign_status VARCHAR(20)
);

-- dim_ad_group table
CREATE TABLE dim_ad_group (
  ad_group_id INT AUTO_INCREMENT PRIMARY KEY,
  ad_group_name VARCHAR(100) NOT NULL,
  ad_group_status VARCHAR(20)
);

-- dim_ad table
CREATE TABLE dim_ad (
  ad_id INT AUTO_INCREMENT PRIMARY KEY,
  ad_description VARCHAR(200),
  ad_distribution VARCHAR(50),
  ad_status VARCHAR(20),
  ad_title VARCHAR(100),
  ad_type VARCHAR(20)
);

-- dim_device table
CREATE TABLE dim_device (
  device_id INT AUTO_INCREMENT PRIMARY KEY,
  device_type VARCHAR(20),
  device_os VARCHAR(20)
);

-- dim_bid table
CREATE TABLE dim_bid (
  bid_id INT AUTO_INCREMENT PRIMARY KEY,
  delivered_match_type VARCHAR(20),
  bid_match_type VARCHAR(20),
  language VARCHAR(20),
  network VARCHAR(50)
);

-- fact_ad_performance table
CREATE TABLE fact_ad_performance (
  fact_id INT AUTO_INCREMENT PRIMARY KEY,
  date_id INT,
  customer_id INT,
  campaign_id INT,
  ad_group_id INT,
  ad_id INT,
  device_id INT,
  bid_id INT,
  currency_code VARCHAR(10),
  impressions INT,
  clicks INT,
  spend DECIMAL(10, 2),
  avg_position DECIMAL(10, 2),
  conversions INT,
  assists INT,
  FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
  FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
  FOREIGN KEY (campaign_id) REFERENCES dim_campaign(campaign_id),
  FOREIGN KEY (ad_group_id) REFERENCES dim_ad_group(ad_group_id),
  FOREIGN KEY (ad_id) REFERENCES dim_ad(ad_id),
  FOREIGN KEY (device_id) REFERENCES dim_device(device_id),
  FOREIGN KEY (bid_id) REFERENCES dim_bid(bid_id)
);