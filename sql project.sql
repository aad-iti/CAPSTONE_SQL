CREATE DATABASE CAPSTONE;
USE CAPSTONE;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL unique,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(50) NOT NULL,
    registration_date DATETIME DEFAULT current_timestamp
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT ,
    restaurant_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    rating DECIMAL(2,1) CHECK(rating between 1 and 5),
    OPENING_YEAR INT check(opening_year >+ 1900)
);

CREATE TABLE food_categories (
    category_id INT PRIMARY KEY auto_increment,
    category_name VARCHAR(50) not null
);

CREATE TABLE food_items (
    food_id INT PRIMARY KEY auto_increment,
    restaurant_id INT,
    category_id INT,
    food_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK(PRICE >0),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (category_id) REFERENCES food_categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY auto_increment,
    customer_id INT,
	order_date DATETIME,
    Status VARCHAR(30),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY auto_increment,
    order_id INT,
    food_id INT,
    quantity INT,
    AMOUNT DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (food_id) REFERENCES food_items(food_id)
);

CREATE TABLE delivery_partners (
    delivery_id INT PRIMARY KEY auto_increment,
    delivery_PERSON VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(50) NOT NULL,
    joining_date DATE
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY auto_increment,
    order_id INT,
    payment_date DATETIME,
    payment_modE VARCHAR(30),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    rating INT,
    review_text VARCHAR(500),
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

CREATE TABLE order_deliveries (
    delivery_record_id INT PRIMARY KEY auto_increment,
    order_id INT unique,
    delivery_id INT,
    assigned_date DATETIME,
    pickup_time datetime,
    delivery_time datetime,
    delivery_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (delivery_id)REFERENCES delivery_partners(delivery_id)
);

INSERT INTO customers (customer_id, customer_name, email, phone, city, registration_date) VALUES
(1, 'Aarav Sharma', 'aarav.sharma@example.com', '9820110001', 'Mumbai', '2023-01-10 10:15:00'),
(2, 'Ananya Iyer', 'ananya.iyer@example.com', '9820110002', 'Bengaluru', '2023-01-12 11:30:00'),
(3, 'Rohan Verma', 'rohan.verma@example.com', '9820110003', 'Delhi', '2023-01-15 14:20:00'),
(4, 'Pooja Kulkarni', 'pooja.k@example.com', '9820110004', 'Pune', '2023-01-18 09:45:00'),
(5, 'Vikram Reddy', 'vikram.r@example.com', '9820110005', 'Hyderabad', '2023-01-20 16:10:00'),
(6, 'Neha Patel', 'neha.p@example.com', '9820110006', 'Mumbai', '2023-01-25 18:25:00'),
(7, 'Aditya Malhotra', 'aditya.m@example.com', '9820110007', 'Delhi', '2023-01-28 12:00:00'),
(8, 'Sneha Rao', 'sneha.rao@example.com', '9820110008', 'Bengaluru', '2023-02-01 15:40:00'),
(9, 'Kunal Joshi', 'kunal.j@example.com', '9820110009', 'Pune', '2023-02-05 20:05:00'),
(10, 'Divya Nair', 'divya.nair@example.com', '9820110010', 'Hyderabad', '2023-02-08 13:50:00'),
(11, 'Rahul Saxena', 'rahul.s@example.com', '9820110011', 'Mumbai', '2023-02-12 17:15:00'),
(12, 'Priya Das', 'priya.das@example.com', '9820110012', 'Delhi', '2023-02-15 19:30:00'),
(13, 'Siddharth Sen', 'siddharth.s@example.com', '9820110013', 'Bengaluru', '2023-02-18 10:20:00'),
(14, 'Tanvi Deshmukh', 'tanvi.d@example.com', '9820110014', 'Pune', '2023-02-22 14:05:00'),
(15, 'Varun Chawla', 'varun.c@example.com', '9820110015', 'Delhi', '2023-02-26 16:45:00'),
(16, 'Ishita Roy', 'ishita.roy@example.com', '9820110016', 'Mumbai', '2023-03-01 11:10:00'),
(17, 'Gaurav Bhatia', 'gaurav.b@example.com', '9820110017', 'Hyderabad', '2023-03-05 13:30:00'),
(18, 'Meera Menon', 'meera.m@example.com', '9820110018', 'Bengaluru', '2023-03-08 18:00:00'),
(19, 'Kavya Jain', 'kavya.jain@example.com', '9820110019', 'Pune', '2023-03-12 12:15:00'),
(20, 'Nikhil Gupta', 'nikhil.g@example.com', '9820110020', 'Delhi', '2023-03-15 15:40:00'),
(21, 'Ritu Agarwal', 'ritu.a@example.com', '9820110021', 'Mumbai', '2023-03-19 19:50:00'),
(22, 'Abhishek Pillai', 'abhishek.p@example.com', '9820110022', 'Bengaluru', '2023-03-22 08:30:00'),
(23, 'Deepika Murthy', 'deepika.m@example.com', '9820110023', 'Hyderabad', '2023-03-25 14:15:00'),
(24, 'Prateek Singhania', 'prateek.s@example.com', '9820110024', 'Delhi', '2023-03-28 17:00:00'),
(25, 'Sakshi Bhave', 'sakshi.b@example.com', '9820110025', 'Pune', '2023-04-01 10:45:00'),
(26, 'Manish Kapoor', 'manish.k@example.com', '9820110026', 'Mumbai', '2023-04-04 12:20:00'),
(27, 'Harshita Pandey', 'harshita.p@example.com', '9820110027', 'Delhi', '2023-04-08 16:35:00'),
(28, 'Arjun Nambiar', 'arjun.n@example.com', '9820110028', 'Bengaluru', '2023-04-12 11:55:00'),
(29, 'Shruti Shinde', 'shruti.s@example.com', '9820110029', 'Pune', '2023-04-15 15:10:00'),
(30, 'Karthik Varma', 'karthik.v@example.com', '9820110030', 'Hyderabad', '2023-04-18 20:25:00'),
(31, 'Bhavna Chauhan', 'bhavna.c@example.com', '9820110031', 'Mumbai', '2023-04-22 09:15:00'),
(32, 'Tarun Mehta', 'tarun.m@example.com', '9820110032', 'Delhi', '2023-04-26 13:40:00'),
(33, 'Pallavi Hegde', 'pallavi.h@example.com', '9820110033', 'Bengaluru', '2023-04-30 18:50:00'),
(34, 'Sameer Jadhav', 'sameer.j@example.com', '9820110034', 'Pune', '2023-05-04 12:05:00'),
(35, 'Swati Krishna', 'swati.k@example.com', '9820110035', 'Hyderabad', '2023-05-08 17:30:00'),
(36, 'Akash Chopra', 'akash.c@example.com', '9820110036', 'Mumbai', '2023-05-12 10:10:00'),
(37, 'Simran Anand', 'simran.a@example.com', '9820110037', 'Delhi', '2023-05-15 14:45:00'),
(38, 'Girish Shetty', 'girish.s@example.com', '9820110038', 'Bengaluru', '2023-05-19 19:00:00'),
(39, 'Aniket Mane', 'aniket.m@example.com', '9820110039', 'Pune', '2023-05-23 11:25:00'),
(40, 'Roshni Rao', 'roshni.r@example.com', '9820110040', 'Hyderabad', '2023-05-27 16:15:00'),
(41, 'Mayank Tiwari', 'mayank.t@example.com', '9820110041', 'Mumbai', '2023-05-31 13:50:00'),
(42, 'Komal Sethi', 'komal.s@example.com', '9820110042', 'Delhi', '2023-06-03 18:20:00'),
(43, 'Naveen Kumar', 'naveen.k@example.com', '9820110043', 'Bengaluru', '2023-06-07 10:05:00'),
(44, 'Madhuri Dixit', 'madhuri.d@example.com', '9820110044', 'Pune', '2023-06-11 15:40:00'),
(45, 'Vikas Goud', 'vikas.g@example.com', '9820110045', 'Hyderabad', '2023-06-15 20:10:00'),
(46, 'Alok Mishra', 'alok.m@example.com', '9820110046', 'Mumbai', '2023-06-19 12:35:00'),
(47, 'Chhavi Bajaj', 'chhavi.b@example.com', '9820110047', 'Delhi', '2023-06-22 17:15:00'),
(48, 'Sanjay Somani', 'sanjay.s@example.com', '9820110048', 'Bengaluru', '2023-06-26 11:45:00'),
(49, 'Radhika Apte', 'radhika.a@example.com', '9820110049', 'Pune', '2023-06-30 14:00:00'),
(50, 'Raghavendra Rao', 'raghavendra.r@example.com', '9820110050', 'Hyderabad', '2023-07-04 18:25:00'),
(51, 'Ashwin Khurana', 'ashwin.k@example.com', '9820110051', 'Mumbai', '2023-07-08 09:30:00'),
(52, 'Preeti Kaushik', 'preeti.k@example.com', '9820110052', 'Delhi', '2023-07-12 13:10:00'),
(53, 'Hemanth Gowda', 'hemanth.g@example.com', '9820110053', 'Bengaluru', '2023-07-16 16:55:00'),
(54, 'Sonali Patil', 'sonali.p@example.com', '9820110054', 'Pune', '2023-07-20 21:05:00'),
(55, 'Shiva Teja', 'shiva.t@example.com', '9820110055', 'Hyderabad', '2023-07-24 10:40:00'),
(56, 'Mohit Suri', 'mohit.s@example.com', '9820110056', 'Mumbai', '2023-07-28 15:20:00'),
(57, 'Natasha Sehgal', 'natasha.s@example.com', '9820110057', 'Delhi', '2023-08-01 19:35:00'),
(58, 'Vinay Prasad', 'vinay.p@example.com', '9820110058', 'Bengaluru', '2023-08-05 12:10:00'),
(59, 'Mrunal Thakur', 'mrunal.t@example.com', '9820110059', 'Pune', '2023-08-09 17:00:00'),
(60, 'Sravani Naidu', 'sravani.n@example.com', '9820110060', 'Hyderabad', '2023-08-13 11:15:00'),
(61, 'Rupesh Solanki', 'rupesh.s@example.com', '9820110061', 'Mumbai', '2023-08-17 14:40:00'),
(62, 'Ankita Sood', 'ankita.s@example.com', '9820110062', 'Delhi', '2023-08-21 18:50:00'),
(63, 'Chetan Kumar', 'chetan.k@example.com', '9820110063', 'Bengaluru', '2023-08-25 10:25:00'),
(64, 'Sayali Gokhale', 'sayali.g@example.com', '9820110064', 'Pune', '2023-08-29 15:05:00'),
(65, 'Harish Chandra', 'harish.c@example.com', '9820110065', 'Hyderabad', '2023-09-02 19:15:00'),
(66, 'Nandita Das', 'nandita.d@example.com', '9820110066', 'Mumbai', '2023-09-06 13:00:00'),
(67, 'Yogesh Rawat', 'yogesh.r@example.com', '9820110067', 'Delhi', '2023-09-10 16:30:00'),
(68, 'Aishwarya Raj', 'aishwarya.r@example.com', '9820110068', 'Bengaluru', '2023-09-14 20:45:00'),
(69, 'Dhananjay More', 'dhananjay.m@example.com', '9820110069', 'Pune', '2023-09-18 11:20:00'),
(70, 'Lavanya Devi', 'lavanya.d@example.com', '9820110070', 'Hyderabad', '2023-09-22 15:50:00'),
(71, 'Bhavesh Shah', 'bhavesh.s@example.com', '9820110071', 'Mumbai', '2023-09-26 18:10:00'),
(72, 'Monica Bedi', 'monica.b@example.com', '9820110072', 'Delhi', '2023-09-30 12:40:00'),
(73, 'Sunil Gavaskar', 'sunil.g@example.com', '9820110073', 'Bengaluru', '2023-10-04 17:05:00'),
(74, 'Pranita Salunkhe', 'pranita.s@example.com', '9820110074', 'Pune', '2023-10-08 10:50:00'),
(75, 'Chiranjeevi Rao', 'chiranjeevi.r@example.com', '9820110075', 'Hyderabad', '2023-10-12 14:15:00'),
(76, 'Pankaj Tripathi', 'pankaj.t@example.com', '9820110076', 'Mumbai', '2023-10-16 19:30:00'),
(77, 'Smriti Mandhana', 'smriti.m@example.com', '9820110077', 'Delhi', '2023-10-20 09:20:00'),
(78, 'Raghu Ram', 'raghu.r@example.com', '9820110078', 'Bengaluru', '2023-10-24 13:45:00'),
(79, 'Vaishali Samant', 'vaishali.s@example.com', '9820110079', 'Pune', '2023-10-28 16:50:00'),
(80, 'Sharwanand G', 'sharwanand.g@example.com', '9820110080', 'Hyderabad', '2023-11-01 21:10:00'),
(81, 'Nilesh Sawant', 'nilesh.s@example.com', '9820110081', 'Mumbai', '2023-11-05 11:35:00'),
(82, 'Garima Arora', 'garima.a@example.com', '9820110082', 'Delhi', '2023-11-09 15:25:00'),
(83, 'Kishore Kumar', 'kishore.k@example.com', '9820110083', 'Bengaluru', '2023-11-13 18:40:00'),
(84, 'Kaveri Shinde', 'kaveri.s@example.com', '9820110084', 'Pune', '2023-11-17 12:00:00'),
(85, 'Bala Krishna', 'bala.k@example.com', '9820110085', 'Hyderabad', '2023-11-21 16:15:00'),
(86, 'Manoj Bajpayee', 'manoj.b@example.com', '9820110086', 'Mumbai', '2023-11-25 19:55:00'),
(87, 'Dia Mirza', 'dia.m@example.com', '9820110087', 'Delhi', '2023-11-29 10:10:00'),
(88, 'Prashanth Neel', 'prashanth.n@example.com', '9820110088', 'Bengaluru', '2023-12-03 14:30:00'),
(89, 'Asha Bhosle', 'asha.b@example.com', '9820110089', 'Pune', '2023-12-07 17:45:00'),
(90, 'Mahesh Babu', 'mahesh.b@example.com', '9820110090', 'Hyderabad', '2023-12-11 20:20:00'),
(91, 'Kay Kay Menon', 'kaykay.m@example.com', '9820110091', 'Mumbai', '2023-12-15 11:05:00'),
(92, 'Huma Qureshi', 'huma.q@example.com', '9820110092', 'Delhi', '2023-12-19 15:40:00'),
(93, 'Rishab Shetty', 'rishab.s@example.com', '9820110093', 'Bengaluru', '2023-12-23 18:15:00'),
(94, 'Sai Pallavi', 'sai.p@example.com', '9820110094', 'Pune', '2023-12-27 12:50:00'),
(95, 'Allu Arjun', 'allu.a@example.com', '9820110095', 'Hyderabad', '2023-12-31 16:25:00'),
(96, 'Amol Palekar', 'amol.p@example.com', '9820110096', 'Mumbai', '2024-01-04 19:40:00'),
(97, 'Radhika Madan', 'radhika.m@example.com', '9820110097', 'Delhi', '2024-01-08 10:35:00'),
(98, 'Yash Gowda', 'yash.g@example.com', '9820110098', 'Bengaluru', '2024-01-12 14:00:00'),
(99, 'Shreyas Talpade', 'shreyas.t@example.com', '9820110099', 'Pune', '2024-01-16 17:15:00'),
(100, 'Vijay Deverakonda', 'vijay.d@example.com', '9820110100', 'Hyderabad', '2024-01-20 21:00:00');

INSERT INTO restaurants (restaurant_id, restaurant_name, city, rating, OPENING_YEAR) VALUES
(1, 'Spice Symphony', 'Mumbai', 4.5, 2012), (2, 'The Pizza Corner', 'Pune', 4.2, 2018), (3, 'Dragon Wok', 'Delhi', 3.8, 2015), (4, 'Dosa Kingdom', 'Bengaluru', 4.6, 2008), (5, 'Hyderabadi Darbar', 'Hyderabad', 4.7, 2010),
(6, 'Burger Hub', 'Mumbai', 3.9, 2020), (7, 'Pasta Paradise', 'Pune', 4.1, 2019), (8, 'Tandoori Treats', 'Delhi', 4.3, 2014), (9, 'Sweet Sensations', 'Bengaluru', 4.8, 2016), (10, 'Chai & Snacks Co.', 'Hyderabad', 4.0, 2021),
(11, 'Flavors of Punjab', 'Mumbai', 4.4, 2011), (12, 'Little Italy Bistro', 'Pune', 4.5, 2013), (13, 'Golden Dragon', 'Delhi', 4.1, 2017), (14, 'Udupi Krishna Grand', 'Bengaluru', 4.7, 2005), (15, 'Biryani Junction', 'Hyderabad', 4.6, 2014),
(16, 'Bombay Grill', 'Mumbai', 4.0, 2022), (17, 'Pune Bakeries', 'Pune', 4.3, 2016), (18, 'Delhi Chaat Bhandar', 'Delhi', 4.5, 2009), (19, 'Silicon Bowl', 'Bengaluru', 3.9, 2021), (20, 'Nawab Special', 'Hyderabad', 4.8, 2013),
(21, 'Royal Spice', 'Mumbai', 4.2, 2015), (22, 'Oven Magic', 'Pune', 4.0, 2020), (23, 'Red Lantern', 'Delhi', 3.7, 2018), (24, 'Madras Cafe Express', 'Bengaluru', 4.6, 2010), (25, 'Charminar Kebab', 'Hyderabad', 4.7, 2012),
(26, 'The Marine Deli', 'Mumbai', 4.1, 2019), (27, 'Deccan Tadka', 'Pune', 4.3, 2017), (28, 'Mughal Mahal', 'Delhi', 4.4, 2006), (29, 'Filter Coffee Co', 'Bengaluru', 4.5, 2018), (30, 'Telangana Spice', 'Hyderabad', 4.2, 2022),
(31, 'Urban Tadka', 'Mumbai', 4.3, 2014), (32, 'Kothrud Canteen', 'Pune', 3.8, 2021), (33, 'Karol Bagh Dhaba', 'Delhi', 4.6, 2007), (34, 'Cubbon Crepes', 'Bengaluru', 4.4, 2019), (35, 'Banjara Kitchen', 'Hyderabad', 4.1, 2017),
(36, 'Juhu Beach Bites', 'Mumbai', 3.9, 2020), (37, 'Camp Rolls Corner', 'Pune', 4.2, 2015), (38, 'Connaught Grill', 'Delhi', 4.5, 2013), (39, 'Indiranagar Diner', 'Bengaluru', 4.6, 2016), (40, 'Secunderabad Bowls', 'Hyderabad', 4.0, 2020),
(41, 'Malabar Coast Kitchen', 'Mumbai', 4.7, 2011), (42, 'Viman Nagar Bites', 'Pune', 4.1, 2019), (43, 'Old Delhi Flavors', 'Delhi', 4.8, 2004), (44, 'Koramangala Wok', 'Bengaluru', 4.3, 2018), (45, 'Gachibowli Gourmet', 'Hyderabad', 4.2, 2021),
(46, 'Bandra Burgers', 'Mumbai', 4.0, 2022), (47, 'Kalyani Nagar Bistro', 'Pune', 4.4, 2016), (48, 'Lajpat Nagar Chaat', 'Delhi', 4.5, 2010), (49, 'Whitefield Tandoor', 'Bengaluru', 3.9, 2020), (50, 'Jubilee Hills Feast', 'Hyderabad', 4.7, 2015),
(51, 'Andheri Eats', 'Mumbai', 4.1, 2018), (52, 'Aundh Italian Den', 'Pune', 4.3, 2017), (53, 'Hauz Khas Socialite', 'Delhi', 4.2, 2019), (54, 'Jayanagar Tiffin', 'Bengaluru', 4.8, 2008), (55, 'Cyberabad Shawarma', 'Hyderabad', 4.4, 2018),
(56, 'Worli Wok', 'Mumbai', 3.8, 2021), (57, 'Baner Biryani House', 'Pune', 4.5, 2016), (58, 'Chandni Chowk Treats', 'Delhi', 4.7, 2003), (59, 'MG Road Bakery', 'Bengaluru', 4.6, 2014), (60, 'Madhapur Mealbox', 'Hyderabad', 4.0, 2022),
(61, 'Colaba Coffee House', 'Mumbai', 4.4, 2012), (62, 'Shivaji Nagar Snacks', 'Pune', 4.1, 2015), (63, 'Saket Sizzlers', 'Delhi', 4.3, 2017), (64, 'Malleshwaram Dosa Center', 'Bengaluru', 4.9, 2006), (65, 'Kondapur Kitchen', 'Hyderabad', 4.2, 2020),
(66, 'Dadar Express Thali', 'Mumbai', 4.5, 2010), (67, 'FC Road Fast Bites', 'Pune', 4.2, 2018), (68, 'Rohini Rolls', 'Delhi', 3.9, 2021), (69, 'HSR Layout Pizzeria', 'Bengaluru', 4.4, 2019), (70, 'Begumpet Barbecue', 'Hyderabad', 4.6, 2016),
(71, 'Goregaon Gourmet', 'Mumbai', 4.0, 2020), (72, 'Hadapsar Hot Pot', 'Pune', 3.8, 2022), (73, 'Pitampura Parathas', 'Delhi', 4.6, 2011), (74, 'Bellandur Biryani', 'Bengaluru', 4.1, 2018), (75, 'Mehdipatnam Mandi', 'Hyderabad', 4.7, 2015),
(76, 'Powai Pasta Co', 'Mumbai', 4.3, 2017), (77, 'Wakad Waffles', 'Pune', 4.5, 2019), (78, 'Dwarka Delights', 'Delhi', 4.0, 2020), (79, 'BTM Bengali Sweets', 'Bengaluru', 4.6, 2014), (80, 'Abids Irani Chai', 'Hyderabad', 4.8, 2008),
(81, 'Thane Tandoori Corner', 'Mumbai', 4.2, 2016), (82, 'Hinjewadi Healthy Bowls', 'Pune', 4.1, 2021), (83, 'Janakpuri Juice Bar', 'Delhi', 4.3, 2018), (84, 'Marathahalli Momos', 'Bengaluru', 4.0, 2022), (85, 'Somajiguda Sweets', 'Hyderabad', 4.5, 2013),
(86, 'Kurla Kebab Corner', 'Mumbai', 4.4, 2014), (87, 'Magarpatta Meals', 'Pune', 4.2, 2017), (88, 'Vasant Kunj Veggies', 'Delhi', 4.6, 2015), (89, 'Electronic City Eats', 'Bengaluru', 3.9, 2020), (90, 'Tolichowki Tiffin', 'Hyderabad', 4.7, 2012),
(91, 'Chembur Chaat House', 'Mumbai', 4.5, 2009), (92, 'Pimple Saudagar Spice', 'Pune', 4.3, 2018), (93, 'Rajouri Garden Grill', 'Delhi', 4.4, 2016), (94, 'Basavanagudi Bites', 'Bengaluru', 4.8, 2007), (95, 'Kukatpally Curry Point', 'Hyderabad', 4.1, 2021),
(96, 'Versova Vegan Cafe', 'Mumbai', 4.2, 2021), (97, 'Bavdhan Biryani', 'Pune', 4.0, 2019), (98, 'Mayur Vihar Momos', 'Delhi', 4.3, 2018), (99, 'Ulsoor Udupi Grand', 'Bengaluru', 4.6, 2011), (100, 'Manikonda Mughal Feast', 'Hyderabad', 4.4, 2017);

INSERT INTO food_categories (category_id, category_name) VALUES
(1, 'Fast Food'), (2, 'North Indian'), (3, 'South Indian'), (4, 'Chinese'), (5, 'Italian'),
(6, 'Desserts'), (7, 'Beverages'), (8, 'Biryani'), (9, 'Mughlai'), (10, 'Continental'),
(11, 'Mexican'), (12, 'Thai'), (13, 'Street Food'), (14, 'Bakery'), (15, 'Ice Cream'),
(16, 'Healthy Food'), (17, 'Salads'), (18, 'Seafood'), (19, 'Juices & Shakes'), (20, 'Snacks'),
(21, 'Rolls & Wraps'), (22, 'Sandwiches'), (23, 'Momos & Dumplings'), (24, 'Chaat'), (25, 'Sweets'),
(26, 'Breakfast Specials'), (27, 'Tandoori'), (28, 'Waffles'), (29, 'Pizzas'), (30, 'Burgers'),
(31, 'Pastas'), (32, 'Noodles'), (33, 'Fried Rice'), (34, 'Shawarma'), (35, 'Thalis'),
(36, 'Kebabs'), (37, 'Barbecue'), (38, 'Japanese'), (39, 'Sushi'), (40, 'Korean'),
(41, 'Mediterranean'), (42, 'Lebanese'), (43, 'American'), (44, 'Finger Food'), (45, 'Tea & Coffee'),
(46, 'Smoothies'), (47, 'Pancakes'), (48, 'Parathas'), (49, 'Dosas'), (50, 'Combos'),
(51, 'Kathi Rolls'), (52, 'Bao Buns'), (53, 'Dim Sums'), (54, 'Sizzlers'), (55, 'Gourmet Burgers'),
(56, 'Artisan Breads'), (57, 'Crepes'), (58, 'Cupcakes'), (59, 'Cheesecakes'), (60, 'Pies & Tarts'),
(61, 'Tacos'), (62, 'Burritos'), (63, 'Quesadillas'), (64, 'Nachos'), (65, 'Donuts'),
(66, 'Churros'), (67, 'Bagels'), (68, 'Soups'), (69, 'Platters'), (70, 'Roast & Grills'),
(71, 'Paneer Delights'), (72, 'Chicken Specials'), (73, 'Mutton Curries'), (74, 'Fish & Chips'), (75, 'Prawns Curries'),
(76, 'Veg Starters'), (77, 'Non-Veg Starters'), (78, 'Rice Bowls'), (79, 'Biryani Combos'), (80, 'Family Packs'),
(81, 'Midnight Cravings'), (82, 'Quick Bites'), (83, 'Kulfi'), (84, 'Falooda'), (85, 'Milkshakes'),
(86, 'Lassi Corner'), (87, 'Mocktails'), (88, 'Specialty Coffees'), (89, 'Herbal Teas'), (90, 'Detox Juices'),
(91, 'Protein Bowls'), (92, 'Keto Friendly'), (93, 'Vegan Cuisine'), (94, 'Gluten-Free'), (95, 'Gujarati Thali'),
(96, 'Rajasthani Thali'), (97, 'Bengali Sweets'), (98, 'Kerala Specials'), (99, 'Goan Curries'), (100, 'Chettinad Dishes');


INSERT INTO food_items (food_id, restaurant_id, category_id, food_name, price) VALUES
(1, 1, 2, 'Paneer Butter Masala', 280.00), (2, 1, 2, 'Butter Naan', 45.00),
(3, 2, 5, 'Margherita Pizza', 320.00), (4, 2, 5, 'Farmhouse Pizza', 450.00),
(5, 3, 4, 'Veg Hakka Noodles', 210.00), (6, 3, 4, 'Chilli Chicken Dry', 290.00),
(7, 4, 3, 'Masala Dosa', 110.00), (8, 4, 3, 'Idli Vada Combo', 90.00),
(9, 5, 8, 'Hyderabadi Chicken Dum Biryani', 360.00), (10, 5, 8, 'Mirchi Ka Salan', 120.00),
(11, 6, 1, 'Classic Cheese Burger', 180.00), (12, 6, 1, 'Crispy French Fries', 95.00),
(13, 7, 5, 'Creamy Alfredo Pasta', 310.00), (14, 7, 5, 'Arrabbiata Red Sauce Pasta', 290.00),
(15, 8, 2, 'Tandoori Chicken Full', 480.00), (16, 8, 2, 'Dal Makhani Royal', 240.00),
(17, 9, 6, 'Belgian Chocolate Waffle', 230.00), (18, 9, 6, 'Red Velvet Pastry', 150.00),
(19, 10, 7, 'Masala Chai Flask', 140.00), (20, 10, 7, 'Filter Coffee Flask', 160.00),
(21, 11, 2, 'Amritsari Kulcha Platter', 220.00), (22, 11, 2, 'Sarson Ka Saag & Makki Roti', 260.00),
(23, 12, 5, 'Four Cheese Thin Crust Pizza', 490.00), (24, 12, 5, 'Garlic Bread with Mozzarella', 170.00),
(25, 13, 4, 'Schezwan Fried Rice', 230.00), (26, 13, 4, 'Veg Manchurian Gravy', 210.00),
(27, 14, 3, 'Ghee Roast Dosa', 140.00), (28, 14, 3, 'Rava Onion Masala Dosa', 130.00),
(29, 15, 8, 'Mutton Biryani Nizami', 440.00), (30, 15, 8, 'Egg Biryani Spiced', 260.00),
(31, 16, 10, 'Grilled Chicken Steak', 420.00), (32, 16, 10, 'BBQ Chicken Wings', 280.00),
(33, 17, 14, 'Shrewsbury Biscuits Pack', 190.00), (34, 17, 14, 'Walnut Brownie', 120.00),
(35, 18, 13, 'Dahi Ke Sholay', 160.00), (36, 18, 13, 'Pani Puri Platter 8 Pcs', 80.00),
(37, 19, 16, 'Mediterranean Quinoa Salad', 290.00), (38, 19, 16, 'Avocado Toast with Seeds', 310.00),
(39, 20, 9, 'Mutton Galouti Kebab', 390.00), (40, 20, 9, 'Sheermal Naan', 70.00),
(41, 21, 2, 'Shahi Paneer Creamy', 270.00), (42, 21, 2, 'Lachha Paratha Crispy', 50.00),
(43, 22, 5, 'Woodfired Pepperoni Pizza', 520.00), (44, 22, 5, 'Stuffed Cheesy Garlic Sticks', 180.00),
(45, 23, 4, 'Steamed Chicken Momos', 160.00), (46, 23, 4, 'Pan Fried Veg Dimsums', 190.00),
(47, 24, 3, 'Mysore Masala Dosa', 125.00), (48, 24, 3, 'Filter Kaapi Cup', 50.00),
(49, 25, 36, 'Chicken Seekh Kebab', 290.00), (50, 25, 36, 'Mutton Boti Kebab', 380.00),
(51, 26, 22, 'Smoked Chicken Club Sandwich', 260.00), (52, 26, 22, 'Grilled Cheese Sandwich', 160.00),
(53, 27, 2, 'Kadhai Paneer Dhaba Style', 280.00), (54, 27, 2, 'Garlic Butter Naan', 60.00),
(55, 28, 9, 'Mughlai Chicken Handi', 370.00), (56, 28, 9, 'Mutton Rogan Josh', 430.00),
(57, 29, 45, 'Artisanal Cold Brew', 210.00), (58, 29, 45, 'Hot Cappuccino Regular', 150.00),
(59, 30, 2, 'Gongura Chicken Curry', 340.00), (60, 30, 2, 'Andhra Chicken Fry', 310.00),
(61, 31, 2, 'Paneer Tikka Masala', 290.00), (62, 31, 2, 'Jeera Rice Flavored', 140.00),
(63, 32, 26, 'Pohe Plate with Sev', 60.00), (64, 32, 26, 'Misal Pav Special', 110.00),
(65, 33, 27, 'Tandoori Roti Whole Wheat', 30.00), (66, 33, 27, 'Murgh Malai Tikka', 340.00),
(67, 34, 47, 'Nutella Banana Crepe', 220.00), (68, 34, 47, 'Classic Maple Pancake', 190.00),
(69, 35, 8, 'Kache Gosht Ki Biryani', 450.00), (70, 35, 8, 'Chicken 65 Spicy', 280.00),
(71, 36, 13, 'Pav Bhaji Extra Butter', 170.00), (72, 36, 13, 'Bhel Puri Tangy', 75.00),
(73, 37, 21, 'Chicken Kathi Roll', 180.00), (74, 37, 21, 'Double Paneer Roll', 160.00),
(75, 38, 37, 'Barbecue Smoked Pork Ribs', 580.00), (76, 38, 37, 'Grilled Cottage Cheese Steak', 320.00),
(77, 39, 1, 'Juicy Lucy Tender Burger', 360.00), (78, 39, 1, 'Peri Peri Fries Large', 130.00),
(79, 40, 78, 'Teriyaki Chicken Rice Bowl', 330.00), (80, 40, 78, 'Paneer Makhani Rice Bowl', 260.00),
(81, 41, 18, 'Prawns Ghee Roast', 460.00), (82, 41, 18, 'Surmai Fish Fry Curry', 490.00),
(83, 42, 20, 'Cheese Loaded Nachos', 220.00), (84, 42, 20, 'Crispy Onion Rings', 140.00),
(85, 43, 25, 'Gulab Jamun 2 Pcs', 80.00), (86, 43, 25, 'Kesar Rasmalai 2 Pcs', 110.00),
(87, 44, 4, 'Chilli Garlic Noodles', 220.00), (88, 44, 4, 'Crispy Honey Chilli Potatoes', 190.00),
(89, 45, 11, 'Chicken Burrito Bowl', 320.00), (90, 45, 11, 'Crispy Taco Trio Veg', 240.00),
(91, 46, 1, 'Double Bacon Smash Burger', 390.00), (92, 46, 1, 'Crispy Chicken Tenders 4 Pcs', 210.00),
(93, 47, 5, 'Penne Pesto Genovese', 330.00), (94, 47, 5, 'Classic Tiramisu Slice', 240.00),
(95, 48, 24, 'Papdi Chaat Delight', 95.00), (96, 48, 24, 'Raj Kachori Special', 130.00),
(97, 49, 27, 'Paneer Tikka Angara', 270.00), (98, 49, 27, 'Afghani Chicken Half', 310.00),
(99, 50, 8, 'Special Mutton Dum Biryani', 470.00), (100, 50, 8, 'Chicken Tikka Biryani Pot', 390.00);


INSERT INTO orders (order_id, customer_id, order_date, Status, total_amount) VALUES
(1, 1, '2024-01-05 12:30:00', 'Delivered', 370.00), (2, 2, '2024-01-05 13:00:00', 'Delivered', 200.00),
(3, 3, '2024-01-06 19:15:00', 'Delivered', 500.00), (4, 4, '2024-01-06 20:00:00', 'Delivered', 770.00),
(5, 5, '2024-01-07 13:45:00', 'Delivered', 480.00), (6, 6, '2024-01-07 14:10:00', 'Delivered', 275.00),
(7, 7, '2024-01-08 20:30:00', 'Delivered', 480.00), (8, 8, '2024-01-09 11:30:00', 'Delivered', 460.00),
(9, 9, '2024-01-10 18:20:00', 'Delivered', 310.00), (10, 10, '2024-01-11 17:00:00', 'Delivered', 140.00),
(11, 11, '2024-01-12 12:45:00', 'Delivered', 325.00), (12, 12, '2024-01-12 21:00:00', 'Delivered', 210.00),
(13, 13, '2024-01-13 13:15:00', 'Delivered', 320.00), (14, 14, '2024-01-14 20:00:00', 'Delivered', 480.00),
(15, 15, '2024-01-15 14:00:00', 'Cancelled', 360.00), (16, 16, '2024-01-15 19:30:00', 'Delivered', 200.00),
(17, 17, '2024-01-16 12:15:00', 'Delivered', 370.00), (18, 18, '2024-01-16 13:30:00', 'Delivered', 200.00),
(19, 19, '2024-01-17 19:00:00', 'Delivered', 500.00), (20, 20, '2024-01-17 20:45:00', 'Delivered', 770.00),
(21, 21, '2024-01-18 13:10:00', 'Delivered', 480.00), (22, 22, '2024-01-18 14:25:00', 'Delivered', 275.00),
(23, 23, '2024-01-19 20:15:00', 'Delivered', 480.00), (24, 24, '2024-01-20 11:45:00', 'Delivered', 460.00),
(25, 25, '2024-01-21 18:35:00', 'Delivered', 310.00), (26, 26, '2024-01-22 17:15:00', 'Delivered', 140.00),
(27, 27, '2024-01-23 12:50:00', 'Delivered', 325.00), (28, 28, '2024-01-23 21:10:00', 'Delivered', 210.00),
(29, 29, '2024-01-24 13:20:00', 'Delivered', 320.00), (30, 30, '2024-01-25 20:10:00', 'Delivered', 480.00),
(31, 31, '2024-01-26 14:15:00', 'Cancelled', 360.00), (32, 32, '2024-01-26 19:40:00', 'Delivered', 200.00),
(33, 33, '2024-01-27 12:25:00', 'Delivered', 370.00), (34, 34, '2024-01-27 13:40:00', 'Delivered', 200.00),
(35, 35, '2024-01-28 19:10:00', 'Delivered', 500.00), (36, 36, '2024-01-28 20:50:00', 'Delivered', 770.00),
(37, 37, '2024-01-29 13:20:00', 'Delivered', 480.00), (38, 38, '2024-01-29 14:35:00', 'Delivered', 275.00),
(39, 39, '2024-01-30 20:25:00', 'Delivered', 480.00), (40, 40, '2024-01-31 11:55:00', 'Delivered', 460.00),
(41, 41, '2024-02-01 18:45:00', 'Delivered', 310.00), (42, 42, '2024-02-02 17:25:00', 'Delivered', 140.00),
(43, 43, '2024-02-03 12:55:00', 'Delivered', 325.00), (44, 44, '2024-02-03 21:20:00', 'Delivered', 210.00),
(45, 45, '2024-02-04 13:30:00', 'Delivered', 320.00), (46, 46, '2024-02-05 20:20:00', 'Delivered', 480.00),
(47, 47, '2024-02-06 14:25:00', 'Cancelled', 360.00), (48, 48, '2024-02-06 19:50:00', 'Delivered', 200.00),
(49, 49, '2024-02-07 12:35:00', 'Delivered', 370.00), (50, 50, '2024-02-07 13:50:00', 'Delivered', 200.00),
(51, 51, '2024-02-08 19:20:00', 'Delivered', 500.00), (52, 52, '2024-02-08 21:00:00', 'Delivered', 770.00),
(53, 53, '2024-02-09 13:30:00', 'Delivered', 480.00), (54, 54, '2024-02-09 14:45:00', 'Delivered', 275.00),
(55, 55, '2024-02-10 20:35:00', 'Delivered', 480.00), (56, 56, '2024-02-11 12:05:00', 'Delivered', 460.00),
(57, 57, '2024-02-12 18:55:00', 'Delivered', 310.00), (58, 58, '2024-02-13 17:35:00', 'Delivered', 140.00),
(59, 59, '2024-02-14 13:05:00', 'Delivered', 325.00), (60, 60, '2024-02-14 21:30:00', 'Delivered', 210.00),
(61, 61, '2024-02-15 13:40:00', 'Delivered', 320.00), (62, 62, '2024-02-16 20:30:00', 'Delivered', 480.00),
(63, 63, '2024-02-17 14:35:00', 'Cancelled', 360.00), (64, 64, '2024-02-17 20:00:00', 'Delivered', 200.00),
(65, 65, '2024-02-18 12:45:00', 'Delivered', 370.00), (66, 66, '2024-02-18 14:00:00', 'Delivered', 200.00),
(67, 67, '2024-02-19 19:30:00', 'Delivered', 500.00), (68, 68, '2024-02-19 21:10:00', 'Delivered', 770.00),
(69, 69, '2024-02-20 13:40:00', 'Delivered', 480.00), (70, 70, '2024-02-20 14:55:00', 'Delivered', 275.00),
(71, 71, '2024-02-21 20:45:00', 'Delivered', 480.00), (72, 72, '2024-02-22 12:15:00', 'Delivered', 460.00),
(73, 73, '2024-02-23 19:05:00', 'Delivered', 310.00), (74, 74, '2024-02-24 17:45:00', 'Delivered', 140.00),
(75, 75, '2024-02-25 13:15:00', 'Delivered', 325.00), (76, 76, '2024-02-25 21:40:00', 'Delivered', 210.00),
(77, 77, '2024-02-26 13:50:00', 'Delivered', 320.00), (78, 78, '2024-02-27 20:40:00', 'Delivered', 480.00),
(79, 79, '2024-02-28 14:45:00', 'Cancelled', 360.00), (80, 80, '2024-02-28 20:10:00', 'Delivered', 200.00),
(81, 81, '2024-02-29 12:55:00', 'Delivered', 370.00), (82, 82, '2024-03-01 14:10:00', 'Delivered', 200.00),
(83, 83, '2024-03-01 19:40:00', 'Delivered', 500.00), (84, 84, '2024-03-02 21:20:00', 'Delivered', 770.00),
(85, 85, '2024-03-02 13:50:00', 'Delivered', 480.00), (86, 86, '2024-03-03 15:05:00', 'Delivered', 275.00),
(87, 87, '2024-03-03 20:55:00', 'Delivered', 480.00), (88, 88, '2024-03-04 12:25:00', 'Delivered', 460.00),
(89, 89, '2024-03-04 19:15:00', 'Delivered', 310.00), (90, 90, '2024-03-05 17:55:00', 'Delivered', 140.00),
(91, 91, '2024-03-05 13:25:00', 'Delivered', 325.00), (92, 92, '2024-03-06 21:50:00', 'Delivered', 210.00),
(93, 93, '2024-03-06 14:00:00', 'Delivered', 320.00), (94, 94, '2024-03-07 20:50:00', 'Delivered', 480.00),
(95, 95, '2024-03-07 14:55:00', 'Cancelled', 360.00), (96, 96, '2024-03-08 20:20:00', 'Delivered', 200.00),
(97, 97, '2024-03-08 13:05:00', 'Delivered', 370.00), (98, 98, '2024-03-09 14:20:00', 'Delivered', 200.00),
(99, 99, '2024-03-09 19:50:00', 'Delivered', 500.00), (100, 100, '2024-03-10 21:30:00', 'Delivered', 770.00);


INSERT INTO order_details (order_detail_id, order_id, food_id, quantity, AMOUNT) VALUES
(1, 1, 1, 1, 280.00), (2, 1, 2, 2, 90.00), (3, 2, 7, 1, 110.00), (4, 2, 8, 1, 90.00),
(5, 3, 5, 1, 210.00), (6, 3, 6, 1, 290.00), (7, 4, 3, 1, 320.00), (8, 4, 4, 1, 450.00),
(9, 5, 9, 1, 360.00), (10, 5, 10, 1, 120.00), (11, 6, 11, 1, 180.00), (12, 6, 12, 1, 95.00),
(13, 7, 15, 1, 480.00), (14, 8, 17, 2, 460.00), (15, 9, 13, 1, 310.00), (16, 10, 19, 1, 140.00),
(17, 11, 1, 1, 280.00), (18, 11, 2, 1, 45.00), (19, 12, 5, 1, 210.00), (20, 13, 3, 1, 320.00),
(21, 14, 15, 1, 480.00), (22, 15, 9, 1, 360.00), (23, 16, 7, 1, 110.00), (24, 16, 8, 1, 90.00),
(25, 17, 1, 1, 280.00), (26, 17, 2, 2, 90.00), (27, 18, 7, 1, 110.00), (28, 18, 8, 1, 90.00),
(29, 19, 5, 1, 210.00), (30, 19, 6, 1, 290.00), (31, 20, 3, 1, 320.00), (32, 20, 4, 1, 450.00),
(33, 21, 9, 1, 360.00), (34, 21, 10, 1, 120.00), (35, 22, 11, 1, 180.00), (36, 22, 12, 1, 95.00),
(37, 23, 15, 1, 480.00), (38, 24, 17, 2, 460.00), (39, 25, 13, 1, 310.00), (40, 26, 19, 1, 140.00),
(41, 27, 1, 1, 280.00), (42, 27, 2, 1, 45.00), (43, 28, 5, 1, 210.00), (44, 29, 3, 1, 320.00),
(45, 30, 15, 1, 480.00), (46, 31, 9, 1, 360.00), (47, 32, 7, 1, 110.00), (48, 32, 8, 1, 90.00),
(49, 33, 1, 1, 280.00), (50, 33, 2, 2, 90.00), (51, 34, 7, 1, 110.00), (52, 34, 8, 1, 90.00),
(53, 35, 5, 1, 210.00), (54, 35, 6, 1, 290.00), (55, 36, 3, 1, 320.00), (56, 36, 4, 1, 450.00),
(57, 37, 9, 1, 360.00), (58, 37, 10, 1, 120.00), (59, 38, 11, 1, 180.00), (60, 38, 12, 1, 95.00),
(61, 39, 15, 1, 480.00), (62, 40, 17, 2, 460.00), (63, 41, 13, 1, 310.00), (64, 42, 19, 1, 140.00),
(65, 43, 1, 1, 280.00), (66, 43, 2, 1, 45.00), (67, 44, 5, 1, 210.00), (68, 45, 3, 1, 320.00),
(69, 46, 15, 1, 480.00), (70, 47, 9, 1, 360.00), (71, 48, 7, 1, 110.00), (72, 48, 8, 1, 90.00),
(73, 49, 1, 1, 280.00), (74, 49, 2, 2, 90.00), (75, 50, 7, 1, 110.00), (76, 50, 8, 1, 90.00),
(77, 51, 5, 1, 210.00), (78, 51, 6, 1, 290.00), (79, 52, 3, 1, 320.00), (80, 52, 4, 1, 450.00),
(81, 53, 9, 1, 360.00), (82, 53, 10, 1, 120.00), (83, 54, 11, 1, 180.00), (84, 54, 12, 1, 95.00),
(85, 55, 15, 1, 480.00), (86, 56, 17, 2, 460.00), (87, 57, 13, 1, 310.00), (88, 58, 19, 1, 140.00),
(89, 59, 1, 1, 280.00), (90, 59, 2, 1, 45.00), (91, 60, 5, 1, 210.00), (92, 61, 3, 1, 320.00),
(93, 62, 15, 1, 480.00), (94, 63, 9, 1, 360.00), (95, 64, 7, 1, 110.00), (96, 64, 8, 1, 90.00),
(97, 65, 1, 1, 280.00), (98, 65, 2, 2, 90.00), (99, 66, 7, 1, 110.00), (100, 66, 8, 1, 90.00);

INSERT INTO payments (payment_id, order_id, payment_date, payment_modE, amount) VALUES
(1, 1, '2024-01-05 12:31:00', 'UPI', 370.00), (2, 2, '2024-01-05 13:02:00', 'Credit Card', 200.00),
(3, 3, '2024-01-06 19:16:00', 'Debit Card', 500.00), (4, 4, '2024-01-06 20:01:00', 'Net Banking', 770.00),
(5, 5, '2024-01-07 13:46:00', 'UPI', 480.00), (6, 6, '2024-01-07 14:11:00', 'Cash on Delivery', 275.00),
(7, 7, '2024-01-08 20:31:00', 'UPI', 480.00), (8, 8, '2024-01-09 11:32:00', 'Credit Card', 460.00),
(9, 9, '2024-01-10 18:21:00', 'UPI', 310.00), (10, 10, '2024-01-11 17:02:00', 'Cash on Delivery', 140.00),
(11, 11, '2024-01-12 12:46:00', 'UPI', 325.00), (12, 12, '2024-01-12 21:01:00', 'Debit Card', 210.00),
(13, 13, '2024-01-13 13:16:00', 'UPI', 320.00), (14, 14, '2024-01-14 20:02:00', 'Credit Card', 480.00),
(15, 15, '2024-01-15 14:01:00', 'UPI', 360.00), (16, 16, '2024-01-15 19:32:00', 'Net Banking', 200.00),
(17, 17, '2024-01-16 12:16:00', 'UPI', 370.00), (18, 18, '2024-01-16 13:32:00', 'Credit Card', 200.00),
(19, 19, '2024-01-17 19:01:00', 'Debit Card', 500.00), (20, 20, '2024-01-17 20:46:00', 'UPI', 770.00),
(21, 21, '2024-01-18 13:11:00', 'UPI', 480.00), (22, 22, '2024-01-18 14:26:00', 'Cash on Delivery', 275.00),
(23, 23, '2024-01-19 20:16:00', 'Credit Card', 480.00), (24, 24, '2024-01-20 11:47:00', 'UPI', 460.00),
(25, 25, '2024-01-21 18:36:00', 'Debit Card', 310.00), (26, 26, '2024-01-22 17:16:00', 'Cash on Delivery', 140.00),
(27, 27, '2024-01-23 12:51:00', 'UPI', 325.00), (28, 28, '2024-01-23 21:11:00', 'Net Banking', 210.00),
(29, 29, '2024-01-24 13:21:00', 'UPI', 320.00), (30, 30, '2024-01-25 20:11:00', 'Credit Card', 480.00),
(31, 31, '2024-01-26 14:16:00', 'UPI', 360.00), (32, 32, '2024-01-26 19:42:00', 'Debit Card', 200.00),
(33, 33, '2024-01-27 12:26:00', 'UPI', 370.00), (34, 34, '2024-01-27 13:41:00', 'Credit Card', 200.00),
(35, 35, '2024-01-28 19:11:00', 'Debit Card', 500.00), (36, 36, '2024-01-28 20:51:00', 'Net Banking', 770.00),
(37, 37, '2024-01-29 13:21:00', 'UPI', 480.00), (38, 38, '2024-01-29 14:36:00', 'Cash on Delivery', 275.00),
(39, 39, '2024-01-30 20:26:00', 'UPI', 480.00), (40, 40, '2024-01-31 11:57:00', 'Credit Card', 460.00),
(41, 41, '2024-02-01 18:46:00', 'UPI', 310.00), (42, 42, '2024-02-02 17:26:00', 'Cash on Delivery', 140.00),
(43, 43, '2024-02-03 12:56:00', 'UPI', 325.00), (44, 44, '2024-02-03 21:21:00', 'Debit Card', 210.00),
(45, 45, '2024-02-04 13:31:00', 'UPI', 320.00), (46, 46, '2024-02-05 20:21:00', 'Credit Card', 480.00),
(47, 47, '2024-02-06 14:26:00', 'UPI', 360.00), (48, 48, '2024-02-06 19:52:00', 'Net Banking', 200.00),
(49, 49, '2024-02-07 12:36:00', 'UPI', 370.00), (50, 50, '2024-02-07 13:52:00', 'Credit Card', 200.00),
(51, 51, '2024-02-08 19:21:00', 'Debit Card', 500.00), (52, 52, '2024-02-08 21:01:00', 'UPI', 770.00),
(53, 53, '2024-02-09 13:31:00', 'UPI', 480.00), (54, 54, '2024-02-09 14:46:00', 'Cash on Delivery', 275.00),
(55, 55, '2024-02-10 20:36:00', 'Credit Card', 480.00), (56, 56, '2024-02-11 12:07:00', 'UPI', 460.00),
(57, 57, '2024-02-12 18:56:00', 'Debit Card', 310.00), (58, 58, '2024-02-13 17:36:00', 'Cash on Delivery', 140.00),
(59, 59, '2024-02-14 13:06:00', 'UPI', 325.00), (60, 60, '2024-02-14 21:31:00', 'Net Banking', 210.00),
(61, 61, '2024-02-15 13:41:00', 'UPI', 320.00), (62, 62, '2024-02-16 20:31:00', 'Credit Card', 480.00),
(63, 63, '2024-02-17 14:36:00', 'UPI', 360.00), (64, 64, '2024-02-17 20:02:00', 'Debit Card', 200.00),
(65, 65, '2024-02-18 12:46:00', 'UPI', 370.00), (66, 66, '2024-02-18 14:01:00', 'Credit Card', 200.00),
(67, 67, '2024-02-19 19:31:00', 'Debit Card', 500.00), (68, 68, '2024-02-19 21:11:00', 'Net Banking', 770.00),
(69, 69, '2024-02-20 13:41:00', 'UPI', 480.00), (70, 70, '2024-02-20 14:56:00', 'Cash on Delivery', 275.00),
(71, 71, '2024-02-21 20:46:00', 'UPI', 480.00), (72, 72, '2024-02-22 12:17:00', 'Credit Card', 460.00),
(73, 73, '2024-02-23 19:06:00', 'UPI', 310.00), (74, 74, '2024-02-24 17:46:00', 'Cash on Delivery', 140.00),
(75, 75, '2024-02-25 13:16:00', 'UPI', 325.00), (76, 76, '2024-02-25 21:41:00', 'Debit Card', 210.00),
(77, 77, '2024-02-26 13:51:00', 'UPI', 320.00), (78, 78, '2024-02-27 20:41:00', 'Credit Card', 480.00),
(79, 79, '2024-02-28 14:46:00', 'UPI', 360.00), (80, 80, '2024-02-28 20:12:00', 'Net Banking', 200.00),
(81, 81, '2024-02-29 12:56:00', 'UPI', 370.00), (82, 82, '2024-03-01 14:12:00', 'Credit Card', 200.00),
(83, 83, '2024-03-01 19:41:00', 'Debit Card', 500.00), (84, 84, '2024-03-02 21:21:00', 'UPI', 770.00),
(85, 85, '2024-03-02 13:51:00', 'UPI', 480.00), (86, 86, '2024-03-03 15:06:00', 'Cash on Delivery', 275.00),
(87, 87, '2024-03-03 20:56:00', 'Credit Card', 480.00), (88, 88, '2024-03-04 12:27:00', 'UPI', 460.00),
(89, 89, '2024-03-04 19:16:00', 'Debit Card', 310.00), (90, 90, '2024-03-05 17:56:00', 'Cash on Delivery', 140.00),
(91, 91, '2024-03-05 13:26:00', 'UPI', 325.00), (92, 92, '2024-03-06 21:51:00', 'Net Banking', 210.00),
(93, 93, '2024-03-06 14:01:00', 'UPI', 320.00), (94, 94, '2024-03-07 20:51:00', 'Credit Card', 480.00),
(95, 95, '2024-03-07 14:56:00', 'UPI', 360.00), (96, 96, '2024-03-08 20:22:00', 'Debit Card', 200.00),
(97, 97, '2024-03-08 13:06:00', 'UPI', 370.00), (98, 98, '2024-03-09 14:21:00', 'Credit Card', 200.00),
(99, 99, '2024-03-09 19:51:00', 'Debit Card', 500.00), (100, 100, '2024-03-10 21:31:00', 'Net Banking', 770.00);

INSERT INTO reviews (review_id, customer_id, restaurant_id, rating, review_text, review_date) VALUES
(1, 1, 1, 5, 'Exceptional north Indian food! Paneer was super soft.', '2024-01-06'),
(2, 2, 4, 5, 'Authentic crisp dosas and fresh chutney.', '2024-01-06'),
(3, 3, 3, 4, 'Great noodles, but chilli chicken was a bit too spicy.', '2024-01-07'),
(4, 4, 2, 4, 'Crisp pizza crust and generous cheese toppings.', '2024-01-07'),
(5, 5, 5, 5, 'Best authentic Hyderabadi Dum Biryani in town!', '2024-01-08'),
(6, 6, 6, 3, 'Burger was decent but fries were slightly cold.', '2024-01-08'),
(7, 7, 8, 4, 'Smoky and well-marinated tandoori chicken.', '2024-01-09'),
(8, 8, 9, 5, 'The Belgian chocolate waffle is to die for.', '2024-01-10'),
(9, 9, 7, 4, 'Rich, creamy pasta sauce. Good portion size.', '2024-01-11'),
(10, 10, 10, 4, 'Hot chai packed well, perfect evening snack.', '2024-01-12'),
(11, 11, 11, 5, 'Butter naan and gravies were out of the world.', '2024-01-13'),
(12, 12, 13, 3, 'Manchurian was slightly salty, rice was good.', '2024-01-14'),
(13, 13, 12, 5, 'Best thin crust pizza I have tasted in Pune!', '2024-01-15'),
(14, 14, 15, 4, 'Flavorful rice and tender mutton pieces.', '2024-01-16'),
(15, 15, 14, 5, 'Filter coffee was aromatic and strong.', '2024-01-17'),
(16, 16, 17, 4, 'Freshly baked walnut brownie was delightful.', '2024-01-18'),
(17, 17, 16, 4, 'Juicy steak grilled to perfection.', '2024-01-19'),
(18, 18, 19, 4, 'Clean, guilt-free salad meal. Loved the dressing.', '2024-01-20'),
(19, 19, 18, 5, 'Mouthwatering chaat, very hygienic preparation.', '2024-01-21'),
(20, 20, 20, 5, 'Mutton galouti kebab literally melts in your mouth.', '2024-01-22'),
(21, 21, 21, 4, 'Shahi paneer was balanced, not overly sweet.', '2024-01-23'),
(22, 22, 22, 4, 'Generous garlic butter topping on cheesy bread.', '2024-01-24'),
(23, 23, 24, 5, 'Crisp Mysore masala dosa with spicy chutney.', '2024-01-25'),
(24, 24, 23, 3, 'Momos arrived lukewarm, chutney was delicious though.', '2024-01-26'),
(25, 25, 25, 5, 'Authentic seekh kebabs, highly recommended.', '2024-01-27'),
(26, 26, 26, 4, 'Smoked chicken sandwich was fresh and filling.', '2024-01-28'),
(27, 27, 28, 5, 'Nizami mutton rogan josh had great depth of flavors.', '2024-01-29'),
(28, 28, 27, 4, 'Spicy kadhai paneer with smoky lachha paratha.', '2024-01-30'),
(29, 29, 30, 4, 'Authentic Andhra spice level, made me sweat!', '2024-01-31'),
(30, 30, 29, 5, 'Top notch cold brew, clean packaging.', '2024-02-01'),
(31, 31, 31, 4, 'Thick creamy gravies with fresh paneer cubes.', '2024-02-02'),
(32, 32, 33, 4, 'Tandoori roti was soft and murgh malai was luscious.', '2024-02-03'),
(33, 33, 32, 5, 'Spicy misal pav with crunchy farsan was unbeatable.', '2024-02-04'),
(34, 34, 34, 4, 'Fluffy pancakes, sweet syrup was generous.', '2024-02-05'),
(35, 35, 36, 4, 'Pav bhaji had that signature Mumbai street flavor.', '2024-02-06'),
(36, 36, 35, 5, 'Chicken 65 was crunchy and deeply spiced.', '2024-02-07'),
(37, 37, 37, 4, 'Well-stuffed kathi roll with pickled onions.', '2024-02-08'),
(38, 38, 38, 5, 'Exceptional grilled platter, smoky aroma.', '2024-02-09'),
(39, 39, 40, 4, 'Teriyaki bowl was comforting and warm.', '2024-02-10'),
(40, 40, 39, 3, 'Burger was soggy due to condensed steam inside box.', '2024-02-11'),
(41, 41, 41, 5, 'Prawns ghee roast was rich and spicy.', '2024-02-12'),
(42, 42, 43, 4, 'Soft gulab jamuns soaked in aromatic syrup.', '2024-02-13'),
(43, 43, 42, 4, 'Crisp nachos with warm cheese dip.', '2024-02-14'),
(44, 44, 44, 4, 'Chilli garlic noodles had nice wok hei aroma.', '2024-02-15'),
(45, 45, 46, 5, 'Smash burger patties had wonderful caramelized crust.', '2024-02-16'),
(46, 46, 45, 4, 'Loaded burrito bowl was filling and wholesome.', '2024-02-17'),
(47, 47, 48, 5, 'Raj kachori with creamy yogurt and chutneys was divine.', '2024-02-18'),
(48, 48, 47, 4, 'Authentic basil pesto coating each pasta penne.', '2024-02-19'),
(49, 49, 50, 5, 'Mutton dum biryani was cooked to tender perfection.', '2024-02-20'),
(50, 50, 49, 4, 'Smoky paneer tikka angara had intense heat.', '2024-02-21'),
(51, 51, 51, 4, 'Crispy bites and rapid delivery.', '2024-02-22'),
(52, 52, 52, 4, 'Creamy white sauce with plenty of mushrooms.', '2024-02-23'),
(53, 53, 54, 5, 'Ghee podi idli was heavenly and fragrant.', '2024-02-24'),
(54, 54, 53, 3, 'Portion was smaller than expected for the price.', '2024-02-25'),
(55, 55, 55, 5, 'Tender chicken shawarma rolls with garlic toum.', '2024-02-26'),
(56, 56, 57, 4, 'Aromatic long grain basmati rice in the biryani.', '2024-02-27'),
(57, 57, 56, 3, 'Noodles were a bit greasy, vegetables were fresh.', '2024-02-28'),
(58, 58, 58, 5, 'Unmatched Old Delhi style butter chicken.', '2024-02-29'),
(59, 59, 60, 4, 'Well balanced home style curry bowl.', '2024-03-01'),
(60, 60, 59, 4, 'Freshly baked croissants with flaky layers.', '2024-03-02'),
(61, 61, 61, 5, 'Vintage coffee shop vibes and robust brew.', '2024-03-03'),
(62, 62, 62, 4, 'Crispy batata vada with spicy red garlic chutney.', '2024-03-04'),
(63, 63, 64, 5, 'Crisp golden brown dosa with fresh coconut chutney.', '2024-03-05'),
(64, 64, 63, 4, 'Sizzler arrived warm, good assortment of veggies.', '2024-03-06'),
(65, 65, 65, 4, 'Homestyle South Indian meals packed cleanly.', '2024-03-07'),
(66, 66, 67, 3, 'Fries were somewhat soggy upon arrival.', '2024-03-08'),
(67, 67, 66, 5, 'Elaborate Maharashtrian thali with puran poli.', '2024-03-09'),
(68, 68, 68, 4, 'Warm kathi rolls, good amount of paneer.', '2024-03-10'),
(69, 69, 70, 5, 'Smoked kebabs were succulent and flavorful.', '2024-03-11'),
(70, 70, 69, 4, 'Cheesy woodfired pizza with crispy crust.', '2024-03-12'),
(71, 71, 72, 3, 'Hot pot was lukewarm, broth flavor was pleasant.', '2024-03-13'),
(72, 72, 71, 4, 'Rich pasta arrabbiata with fresh herbs.', '2024-03-14'),
(73, 73, 73, 5, 'Crisp stuffed parathas with white butter dollop.', '2024-03-15'),
(74, 74, 75, 5, 'Authentic Yemeni Mandi rice with tender mutton.', '2024-03-16'),
(75, 75, 74, 4, 'Fragrant biryani rice, spicy chicken pieces.', '2024-03-17'),
(76, 76, 77, 4, 'Crispy waffles topped with berries and chocolate.', '2024-03-18'),
(77, 77, 76, 4, 'Rich fettuccine alfredo with parmesan.', '2024-03-19'),
(78, 78, 78, 4, 'Classic North Indian gravies with soft naans.', '2024-03-20'),
(79, 79, 80, 5, 'Irani chai paired with osmania biscuits is elite.', '2024-03-21'),
(80, 80, 79, 5, 'Spongy rasgullas and creamy sandesh.', '2024-03-22'),
(81, 81, 82, 4, 'Nutrient dense grain bowl with clean chicken breast.', '2024-03-23'),
(82, 82, 81, 4, 'Tandoori chicken marinated with fragrant mustard.', '2024-03-24'),
(83, 83, 83, 4, 'Cold pressed juices were refreshing without sugar.', '2024-03-25'),
(84, 84, 85, 5, 'Creamy badam halwa and fresh motichoor ladoos.', '2024-03-26'),
(85, 85, 84, 4, 'Spicy momos with fiery schezwan dip.', '2024-03-27'),
(86, 86, 87, 4, 'Wholesome office lunch box with chapati and dal.', '2024-03-28'),
(87, 87, 86, 5, 'Spicy seekh kebabs straight from the sigri.', '2024-03-29'),
(88, 88, 88, 4, 'Fresh seasonal salads with vinaigrette dressing.', '2024-03-30'),
(89, 89, 90, 4, 'Crispy vadas with piping hot sambar.', '2024-03-31'),
(90, 90, 89, 3, 'Delivery delayed slightly, food was still warm.', '2024-04-01'),
(91, 91, 92, 4, 'Flavorful chicken curry with steamed rice.', '2024-04-02'),
(92, 92, 91, 5, 'Sev puri and dahi puri bursting with flavors.', '2024-04-03'),
(93, 93, 93, 5, 'Succulent tandoori chops and creamy daal.', '2024-04-04'),
(94, 94, 95, 4, 'Homestyle spicy Andhra meals, love the pickles.', '2024-04-05'),
(95, 95, 94, 5, 'Classic set dosa served with sagu and coconut chutney.', '2024-04-06'),
(96, 96, 97, 4, 'Aromatic basmati rice cooked on dum.', '2024-04-07'),
(97, 97, 96, 4, 'Wholesome vegan bowl with roasted chickpeas.', '2024-04-08'),
(98, 98, 98, 4, 'Steamed momos with minced chicken filling.', '2024-04-09'),
(99, 99, 100, 5, 'Rich Mughlai gravy with tender lamb pieces.', '2024-04-10'),
(100, 100, 99, 5, 'Crisp golden brown paper roast dosa.', '2024-04-11');

INSERT INTO order_deliveries (delivery_record_id, order_id, delivery_id, assigned_date, pickup_time, delivery_time, delivery_status) VALUES
(1, 1, 1, '2024-01-05 12:35:00', '2024-01-05 12:48:00', '2024-01-05 13:12:00', 'Delivered'),
(2, 2, 3, '2024-01-05 13:05:00', '2024-01-05 13:18:00', '2024-01-05 13:38:00', 'Delivered'),
(3, 3, 2, '2024-01-06 19:20:00', '2024-01-06 19:35:00', '2024-01-06 20:02:00', 'Delivered'),
(4, 4, 4, '2024-01-06 20:05:00', '2024-01-06 20:22:00', '2024-01-06 20:47:00', 'Delivered'),
(5, 5, 5, '2024-01-07 13:50:00', '2024-01-07 14:05:00', '2024-01-07 14:28:00', 'Delivered'),
(6, 6, 6, '2024-01-07 14:15:00', '2024-01-07 14:28:00', '2024-01-07 14:50:00', 'Delivered'),
(7, 7, 7, '2024-01-08 20:35:00', '2024-01-08 20:50:00', '2024-01-08 21:18:00', 'Delivered'),
(8, 8, 8, '2024-01-09 11:35:00', '2024-01-09 11:48:00', '2024-01-09 12:10:00', 'Delivered'),
(9, 9, 9, '2024-01-10 18:25:00', '2024-01-10 18:38:00', '2024-01-10 19:02:00', 'Delivered'),
(10, 10, 10, '2024-01-11 17:05:00', '2024-01-11 17:15:00', '2024-01-11 17:35:00', 'Delivered'),
(11, 11, 11, '2024-01-12 12:50:00', '2024-01-12 13:05:00', '2024-01-12 13:30:00', 'Delivered'),
(12, 12, 12, '2024-01-12 21:05:00', '2024-01-12 21:20:00', '2024-01-12 21:44:00', 'Delivered'),
(13, 13, 13, '2024-01-13 13:20:00', '2024-01-13 13:35:00', '2024-01-13 14:01:00', 'Delivered'),
(14, 14, 14, '2024-01-14 20:05:00', '2024-01-14 20:20:00', '2024-01-14 20:45:00', 'Delivered'),
(15, 15, 15, '2024-01-15 14:03:00', NULL, NULL, 'Cancelled'),
(16, 16, 16, '2024-01-15 19:35:00', '2024-01-15 19:48:00', '2024-01-15 20:12:00', 'Delivered'),
(17, 17, 17, '2024-01-16 12:20:00', '2024-01-16 12:33:00', '2024-01-16 12:58:00', 'Delivered'),
(18, 18, 18, '2024-01-16 13:35:00', '2024-01-16 13:48:00', '2024-01-16 14:10:00', 'Delivered'),
(19, 19, 19, '2024-01-17 19:05:00', '2024-01-17 19:20:00', '2024-01-17 19:47:00', 'Delivered'),
(20, 20, 20, '2024-01-17 20:50:00', '2024-01-17 21:07:00', '2024-01-17 21:32:00', 'Delivered'),
(21, 21, 21, '2024-01-18 13:15:00', '2024-01-18 13:30:00', '2024-01-18 13:53:00', 'Delivered'),
(22, 22, 22, '2024-01-18 14:30:00', '2024-01-18 14:43:00', '2024-01-18 15:05:00', 'Delivered'),
(23, 23, 23, '2024-01-19 20:20:00', '2024-01-19 20:35:00', '2024-01-19 21:03:00', 'Delivered'),
(24, 24, 24, '2024-01-20 11:50:00', '2024-01-20 12:03:00', '2024-01-20 12:25:00', 'Delivered'),
(25, 25, 25, '2024-01-21 18:40:00', '2024-01-21 18:53:00', '2024-01-21 19:17:00', 'Delivered'),
(26, 26, 26, '2024-01-22 17:20:00', '2024-01-22 17:30:00', '2024-01-22 17:50:00', 'Delivered'),
(27, 27, 27, '2024-01-23 12:55:00', '2024-01-23 13:10:00', '2024-01-23 13:35:00', 'Delivered'),
(28, 28, 28, '2024-01-23 21:15:00', '2024-01-23 21:30:00', '2024-01-23 21:54:00', 'Delivered'),
(29, 29, 29, '2024-01-24 13:25:00', '2024-01-24 13:40:00', '2024-01-24 14:06:00', 'Delivered'),
(30, 30, 30, '2024-01-25 20:15:00', '2024-01-25 20:30:00', '2024-01-25 20:55:00', 'Delivered'),
(31, 31, 31, '2024-01-26 14:18:00', NULL, NULL, 'Cancelled'),
(32, 32, 32, '2024-01-26 19:45:00', '2024-01-26 19:58:00', '2024-01-26 20:22:00', 'Delivered'),
(33, 33, 33, '2024-01-27 12:30:00', '2024-01-27 12:43:00', '2024-01-27 13:08:00', 'Delivered'),
(34, 34, 34, '2024-01-27 13:45:00', '2024-01-27 13:58:00', '2024-01-27 14:20:00', 'Delivered'),
(35, 35, 35, '2024-01-28 19:15:00', '2024-01-28 19:30:00', '2024-01-28 19:57:00', 'Delivered'),
(36, 36, 36, '2024-01-28 20:55:00', '2024-01-28 21:12:00', '2024-01-28 21:37:00', 'Delivered'),
(37, 37, 37, '2024-01-29 13:25:00', '2024-01-29 13:40:00', '2024-01-29 14:03:00', 'Delivered'),
(38, 38, 38, '2024-01-29 14:40:00', '2024-01-29 14:53:00', '2024-01-29 15:15:00', 'Delivered'),
(39, 39, 39, '2024-01-30 20:30:00', '2024-01-30 20:45:00', '2024-01-30 21:13:00', 'Delivered'),
(40, 40, 40, '2024-01-31 12:00:00', '2024-01-31 12:13:00', '2024-01-31 12:35:00', 'Delivered'),
(41, 41, 41, '2024-02-01 18:50:00', '2024-02-01 19:03:00', '2024-02-01 19:27:00', 'Delivered'),
(42, 42, 42, '2024-02-02 17:30:00', '2024-02-02 17:40:00', '2024-02-02 18:00:00', 'Delivered'),
(43, 43, 43, '2024-02-03 13:00:00', '2024-02-03 13:15:00', '2024-02-03 13:40:00', 'Delivered'),
(44, 44, 44, '2024-02-03 21:25:00', '2024-02-03 21:40:00', '2024-02-03 22:04:00', 'Delivered'),
(45, 45, 45, '2024-02-04 13:35:00', '2024-02-04 13:50:00', '2024-02-04 14:16:00', 'Delivered'),
(46, 46, 46, '2024-02-05 20:25:00', '2024-02-05 20:40:00', '2024-02-05 21:05:00', 'Delivered'),
(47, 47, 47, '2024-02-06 14:28:00', NULL, NULL, 'Cancelled'),
(48, 48, 48, '2024-02-06 19:55:00', '2024-02-06 20:08:00', '2024-02-06 20:32:00', 'Delivered'),
(49, 49, 49, '2024-02-07 12:40:00', '2024-02-07 12:53:00', '2024-02-07 13:18:00', 'Delivered'),
(50, 50, 50, '2024-02-07 13:55:00', '2024-02-07 14:08:00', '2024-02-07 14:30:00', 'Delivered'),
(51, 51, 51, '2024-02-08 19:25:00', '2024-02-08 19:40:00', '2024-02-08 20:07:00', 'Delivered'),
(52, 52, 52, '2024-02-08 21:05:00', '2024-02-08 21:22:00', '2024-02-08 21:47:00', 'Delivered'),
(53, 53, 53, '2024-02-09 13:35:00', '2024-02-09 13:50:00', '2024-02-09 14:13:00', 'Delivered'),
(54, 54, 54, '2024-02-09 14:50:00', '2024-02-09 15:03:00', '2024-02-09 15:25:00', 'Delivered'),
(55, 55, 55, '2024-02-10 20:40:00', '2024-02-10 20:55:00', '2024-02-10 21:23:00', 'Delivered'),
(56, 56, 56, '2024-02-11 12:10:00', '2024-02-11 12:23:00', '2024-02-11 12:45:00', 'Delivered'),
(57, 57, 57, '2024-02-12 19:00:00', '2024-02-12 19:13:00', '2024-02-12 19:37:00', 'Delivered'),
(58, 58, 58, '2024-02-13 17:40:00', '2024-02-13 17:50:00', '2024-02-13 18:10:00', 'Delivered'),
(59, 59, 59, '2024-02-14 13:10:00', '2024-02-14 13:25:00', '2024-02-14 13:50:00', 'Delivered'),
(60, 60, 60, '2024-02-14 21:35:00', '2024-02-14 21:50:00', '2024-02-14 22:14:00', 'Delivered'),
(61, 61, 61, '2024-02-15 13:45:00', '2024-02-15 14:00:00', '2024-02-15 14:26:00', 'Delivered'),
(62, 62, 62, '2024-02-16 20:35:00', '2024-02-16 20:50:00', '2024-02-16 21:15:00', 'Delivered'),
(63, 63, 63, '2024-02-17 14:38:00', NULL, NULL, 'Cancelled'),
(64, 64, 64, '2024-02-17 20:05:00', '2024-02-17 20:18:00', '2024-02-17 20:42:00', 'Delivered'),
(65, 65, 65, '2024-02-18 12:50:00', '2024-02-18 13:03:00', '2024-02-18 13:28:00', 'Delivered'),
(66, 66, 66, '2024-02-18 14:05:00', '2024-02-18 14:18:00', '2024-02-18 14:40:00', 'Delivered'),
(67, 67, 67, '2024-02-19 19:35:00', '2024-02-19 19:50:00', '2024-02-19 20:17:00', 'Delivered'),
(68, 68, 68, '2024-02-19 21:15:00', '2024-02-19 21:32:00', '2024-02-19 21:57:00', 'Delivered'),
(69, 69, 69, '2024-02-20 13:45:00', '2024-02-20 14:00:00', '2024-02-20 14:23:00', 'Delivered'),
(70, 70, 70, '2024-02-20 15:00:00', '2024-02-20 15:13:00', '2024-02-20 15:35:00', 'Delivered'),
(71, 71, 71, '2024-02-21 20:50:00', '2024-02-21 21:05:00', '2024-02-21 21:33:00', 'Delivered'),
(72, 72, 72, '2024-02-22 12:20:00', '2024-02-22 12:33:00', '2024-02-22 12:55:00', 'Delivered'),
(73, 73, 73, '2024-02-23 19:10:00', '2024-02-23 19:23:00', '2024-02-23 19:47:00', 'Delivered'),
(74, 74, 74, '2024-02-24 17:50:00', '2024-02-24 18:00:00', '2024-02-24 18:20:00', 'Delivered'),
(75, 75, 75, '2024-02-25 13:20:00', '2024-02-25 13:35:00', '2024-02-25 14:00:00', 'Delivered'),
(76, 76, 76, '2024-02-25 21:45:00', '2024-02-25 22:00:00', '2024-02-25 22:24:00', 'Delivered'),
(77, 77, 77, '2024-02-26 13:55:00', '2024-02-26 14:10:00', '2024-02-26 14:36:00', 'Delivered'),
(78, 78, 78, '2024-02-27 20:45:00', '2024-02-27 21:00:00', '2024-02-27 21:25:00', 'Delivered'),
(79, 79, 79, '2024-02-28 14:48:00', NULL, NULL, 'Cancelled'),
(80, 80, 80, '2024-02-28 20:15:00', '2024-02-28 20:28:00', '2024-02-28 20:52:00', 'Delivered'),
(81, 81, 81, '2024-02-29 13:00:00', '2024-02-29 13:13:00', '2024-02-29 13:38:00', 'Delivered'),
(82, 82, 82, '2024-03-01 14:15:00', '2024-03-01 14:28:00', '2024-03-01 14:50:00', 'Delivered'),
(83, 83, 83, '2024-03-01 19:45:00', '2024-03-01 20:00:00', '2024-03-01 20:27:00', 'Delivered'),
(84, 84, 84, '2024-03-02 21:25:00', '2024-03-02 21:42:00', '2024-03-02 22:07:00', 'Delivered'),
(85, 85, 85, '2024-03-02 13:55:00', '2024-03-02 14:10:00', '2024-03-02 14:33:00', 'Delivered'),
(86, 86, 86, '2024-03-03 15:10:00', '2024-03-03 15:23:00', '2024-03-03 15:45:00', 'Delivered'),
(87, 87, 87, '2024-03-03 21:00:00', '2024-03-03 21:15:00', '2024-03-03 21:43:00', 'Delivered'),
(88, 88, 88, '2024-03-04 12:30:00', '2024-03-04 12:43:00', '2024-03-04 13:05:00', 'Delivered'),
(89, 89, 89, '2024-03-04 19:20:00', '2024-03-04 19:33:00', '2024-03-04 19:57:00', 'Delivered'),
(90, 90, 90, '2024-03-05 18:00:00', '2024-03-05 18:10:00', '2024-03-05 18:30:00', 'Delivered'),
(91, 91, 91, '2024-03-05 13:30:00', '2024-03-05 13:45:00', '2024-03-05 14:10:00', 'Delivered'),
(92, 92, 92, '2024-03-06 21:55:00', '2024-03-06 22:10:00', '2024-03-06 22:34:00', 'Delivered'),
(93, 93, 93, '2024-03-06 14:05:00', '2024-03-06 14:20:00', '2024-03-06 14:46:00', 'Delivered'),
(94, 94, 94, '2024-03-07 20:55:00', '2024-03-07 21:10:00', '2024-03-07 21:35:00', 'Delivered'),
(95, 95, 95, '2024-03-07 14:58:00', NULL, NULL, 'Cancelled'),
(96, 96, 96, '2024-03-08 20:25:00', '2024-03-08 20:38:00', '2024-03-08 21:02:00', 'Delivered'),
(97, 97, 97, '2024-03-08 13:10:00', '2024-03-08 13:23:00', '2024-03-08 13:48:00', 'Delivered'),
(98, 98, 98, '2024-03-09 14:25:00', '2024-03-09 14:38:00', '2024-03-09 15:00:00', 'Delivered'),
(99, 99, 99, '2024-03-09 19:55:00', '2024-03-09 20:10:00', '2024-03-09 20:37:00', 'Delivered'),
(100, 100, 100, '2024-03-10 21:35:00', '2024-03-10 21:52:00', '2024-03-10 22:17:00', 'Delivered');

INSERT INTO delivery_partners (delivery_id, delivery_PERSON, phone, city, joining_date) VALUES
(1, 'Suresh Gaikwad', '9700110001', 'Mumbai', '2022-01-10'), (2, 'Manoj Kumar', '9700110002', 'Delhi', '2022-01-15'),
(3, 'Karthik Raja', '9700110003', 'Bengaluru', '2022-01-20'), (4, 'Santosh Shinde', '9700110004', 'Pune', '2022-01-25'),
(5, 'Venkat Rao', '9700110005', 'Hyderabad', '2022-02-01'), (6, 'Ramesh Patil', '9700110006', 'Mumbai', '2022-02-08'),
(7, 'Amit Singh', '9700110007', 'Delhi', '2022-02-14'), (8, 'Deepak Hegde', '9700110008', 'Bengaluru', '2022-02-21'),
(9, 'Mahesh Pawar', '9700110009', 'Pune', '2022-03-01'), (10, 'Srinivas Murthy', '9700110010', 'Hyderabad', '2022-03-08'),
(11, 'Sachin Tendulkar', '9700110011', 'Mumbai', '2022-03-15'), (12, 'Virender Sehwag', '9700110012', 'Delhi', '2022-03-22'),
(13, 'Rahul Dravid', '9700110013', 'Bengaluru', '2022-04-01'), (14, 'Nitin Gadkari', '9700110014', 'Pune', '2022-04-07'),
(15, 'VVS Laxman', '9700110015', 'Hyderabad', '2022-04-14'), (16, 'Rohit Sharma', '9700110016', 'Mumbai', '2022-04-21'),
(17, 'Gautam Gambhir', '9700110017', 'Delhi', '2022-05-01'), (18, 'Anil Kumble', '9700110018', 'Bengaluru', '2022-05-08'),
(19, 'Ajinkya Rahane', '9700110019', 'Pune', '2022-05-15'), (20, 'Ambati Rayudu', '9700110020', 'Hyderabad', '2022-05-22'),
(21, 'Zaheer Khan', '9700110021', 'Mumbai', '2022-06-01'), (22, 'Ashish Nehra', '9700110022', 'Delhi', '2022-06-08'),
(23, 'Javagal Srinath', '9700110023', 'Bengaluru', '2022-06-15'), (24, 'Kedar Jadhav', '9700110024', 'Pune', '2022-06-22'),
(25, 'Pragyan Ojha', '9700110025', 'Hyderabad', '2022-07-01'), (26, 'Suryakumar Yadav', '9700110026', 'Mumbai', '2022-07-08'),
(27, 'Ishant Sharma', '9700110027', 'Delhi', '2022-07-15'), (28, 'KL Rahul', '9700110028', 'Bengaluru', '2022-07-22'),
(29, 'Ruturaj Gaikwad', '9700110029', 'Pune', '2022-08-01'), (30, 'Mohammed Siraj', '9700110030', 'Hyderabad', '2022-08-08'),
(31, 'Shardul Thakur', '9700110031', 'Mumbai', '2022-08-15'), (32, 'Rishabh Pant', '9700110032', 'Delhi', '2022-08-22'),
(33, 'Mayank Agarwal', '9700110033', 'Bengaluru', '2022-09-01'), (34, 'Dhawal Kulkarni', '9700110034', 'Pune', '2022-09-08'),
(35, 'Tilak Varma', '9700110035', 'Hyderabad', '2022-09-15'), (36, 'Prithvi Shaw', '9700110036', 'Mumbai', '2022-09-22'),
(37, 'Shikhar Dhawan', '9700110037', 'Delhi', '2022-10-01'), (38, 'Manish Pandey', '9700110038', 'Bengaluru', '2022-10-08'),
(39, 'Rahul Tripathi', '9700110039', 'Pune', '2022-10-15'), (40, 'Hanuma Vihari', '9700110040', 'Hyderabad', '2022-10-22'),
(41, 'Shivam Dube', '9700110041', 'Mumbai', '2022-11-01'), (42, 'Harshit Rana', '9700110042', 'Delhi', '2022-11-08'),
(43, 'Devdutt Padikkal', '9700110043', 'Bengaluru', '2022-11-15'), (44, 'Rajvardhan Hangargekar', '9700110044', 'Pune', '2022-11-22'),
(45, 'Nitish Kumar Reddy', '9700110045', 'Hyderabad', '2022-12-01'), (46, 'Yashasvi Jaiswal', '9700110046', 'Mumbai', '2022-12-08'),
(47, 'Mayank Yadav', '9700110047', 'Delhi', '2022-12-15'), (48, 'Prasidh Krishna', '9700110048', 'Bengaluru', '2022-12-22'),
(49, 'Arshin Kulkarni', '9700110049', 'Pune', '2023-01-05'), (50, 'Tanmay Agarwal', '9700110050', 'Hyderabad', '2023-01-12'),
(51, 'Tushar Deshpande', '9700110051', 'Mumbai', '2023-01-19'), (52, 'Ayush Badoni', '9700110052', 'Delhi', '2023-01-26'),
(53, 'Abhimanyu Mithun', '9700110053', 'Bengaluru', '2023-02-02'), (54, 'Ankeet Bawne', '9700110054', 'Pune', '2023-02-09'),
(55, 'Ravi Teja', '9700110055', 'Hyderabad', '2023-02-16'), (56, 'Sarfaraz Khan', '9700110056', 'Mumbai', '2023-02-23'),
(57, 'Navdeep Saini', '9700110057', 'Delhi', '2023-03-02'), (58, 'Krishnappa Gowtham', '9700110058', 'Bengaluru', '2023-03-09'),
(59, 'Mukesh Choudhary', '9700110059', 'Pune', '2023-03-16'), (60, 'Chama Milind', '9700110060', 'Hyderabad', '2023-03-23'),
(61, 'Musheer Khan', '9700110061', 'Mumbai', '2023-03-30'), (62, 'Lalit Yadav', '9700110062', 'Delhi', '2023-04-06'),
(63, 'Shreyas Gopal', '9700110063', 'Bengaluru', '2023-04-13'), (64, 'Pradeep Dadhe', '9700110064', 'Pune', '2023-04-20'),
(65, 'Bavanaka Sandeep', '9700110065', 'Hyderabad', '2023-04-27'), (66, 'Tanush Kotian', '9700110066', 'Mumbai', '2023-05-04'),
(67, 'Himmat Singh', '9700110067', 'Delhi', '2023-05-11'), (68, 'Jagadeesha Suchith', '9700110068', 'Bengaluru', '2023-05-18'),
(69, 'Satyajeet Bachhav', '9700110069', 'Pune', '2023-05-25'), (70, 'Akshath Reddy', '9700110070', 'Hyderabad', '2023-06-01'),
(71, 'Mohit Avasthi', '9700110071', 'Mumbai', '2023-06-08'), (72, 'Pawan Suyal', '9700110072', 'Delhi', '2023-06-15'),
(73, 'Ronit More', '9700110073', 'Bengaluru', '2023-06-22'), (74, 'Manoj Ingale', '9700110074', 'Pune', '2023-06-29'),
(75, 'Ashish Reddy', '9700110075', 'Hyderabad', '2023-07-06'), (76, 'Shams Mulani', '9700110076', 'Mumbai', '2023-07-13'),
(77, 'Suyash Sharma', '9700110077', 'Delhi', '2023-07-20'), (78, 'Pavan Deshpande', '9700110078', 'Bengaluru', '2023-07-27'),
(79, 'Vicky Ostwal', '9700110079', 'Pune', '2023-08-03'), (80, 'Mehdi Hasan', '9700110080', 'Hyderabad', '2023-08-10'),
(81, 'Hardik Tamore', '9700110081', 'Mumbai', '2023-08-17'), (82, 'Hrithik Shokeen', '9700110082', 'Delhi', '2023-08-24'),
(83, 'Sharath BR', '9700110083', 'Bengaluru', '2023-08-31'), (84, 'Azim Kazi', '9700110084', 'Pune', '2023-09-07'),
(85, 'Kartikeya Kak', '9700110085', 'Hyderabad', '2023-09-14'), (86, 'Royston Dias', '9700110086', 'Mumbai', '2023-09-21'),
(87, 'Pranshu Vijayran', '9700110087', 'Delhi', '2023-09-28'), (88, 'V Koushik', '9700110088', 'Bengaluru', '2023-10-05'),
(89, 'Shamshuzama Kazi', '9700110089', 'Pune', '2023-10-12'), (90, 'Rohit Rayudu', '9700110090', 'Hyderabad', '2023-10-19'),
(91, 'Suved Parkar', '9700110091', 'Mumbai', '2023-10-26'), (92, 'Vaibhav Kandpal', '9700110092', 'Delhi', '2023-11-02'),
(93, 'Nikin Jose', '9700110093', 'Bengaluru', '2023-11-09'), (94, 'Divyang Hinganekar', '9700110094', 'Pune', '2023-11-16'),
(95, 'Mickil Jaiswal', '9700110095', 'Hyderabad', '2023-11-23'), (96, 'Armaan Jaffer', '9700110096', 'Mumbai', '2023-11-30'),
(97, 'Lakshay Thareja', '9700110097', 'Delhi', '2023-12-07'), (98, 'Aneeshwar Gautam', '9700110098', 'Bengaluru', '2023-12-14'),
(99, 'Vishant More', '9700110099', 'Pune', '2023-12-21'), (100, 'Rakshann Readdi', '9700110100', 'Hyderabad', '2023-12-28');

-- 1. Display all customers.
SELECT * FROM customers;

-- 2. Display all restaurants.
SELECT * FROM restaurants;

-- 3. Find customers from Pune.
SELECT * FROM CUSTOMERS WHERE CITY = "PUNE" ;

-- 4. Show food items costing more than ₹300.
SELECT * FROM food_items  WHERE PRICE > 300;

-- 5. Display delivered orders only.
SELECT * FROM orders WHERE status= "delivered" ;

-- 6. Count total customers
SELECT COUNT(*) AS TOTAL_CUSTOMER FROM CUSTOMERS;

-- 7. Find maximum order amount.
SELECT max(total_amount) FROM ORDERS;

-- 8. Find minimum food price.
SELECT MIN(PRICE) FROM food_items;

-- 9. Display average restaurant rating.
SELECT AVG(RATING) FROM restaurants ;

-- 10. Sort restaurants by rating.
SELECT * FROM restaurants order by RATING DESC;

-- 11. Display customer name with order details.
SELECT CUSTOMERS.customer_id, customer_name,order_id ,order_date,total_amount, STATUS  FROM customers 
JOIN ORDERS 
ON customers.customer_id = orders.order_id;

-- 12. Show restaurant and food item names.
SELECT restaurant_name, food_name from Restaurants
join food_items 
ON restaurants.restaurant_id = food_id;

-- 13. Display customer payment history.
SELECT CUSTOMERS.customer_name, ORDERS.order_id , payment_id ,payment_date ,payment_modE, amount FROM CUSTOMERS
JOIN ORDERS
ON customers.customer_id = orders.order_id
JOIN payments 
ON orders.order_id = PAYMENTS.PAYMENT_ID;

-- 14. Show order details with food names.
SELECT order_detail_id ,order_id,food_items.food_id ,quantity ,AMOUNT, food_name FROM order_details 
JOIN food_items
ON ORDER_DETAILS.order_detail_id = food_items.FOOD_ID;

-- 15. Display restaurant-wise total orders.
SELECT 
    r.restaurant_name,
    COUNT(DISTINCT od.order_id) AS total_orders
FROM restaurants r
JOIN food_items f
    ON r.restaurant_id = f.restaurant_id
JOIN order_details od
    ON f.food_id = od.food_id
GROUP BY r.restaurant_id, r.restaurant_name;

-- 16. Show city-wise customer count.
SELECT CITY, COUNT(CUSTOMER_ID) FROM CUSTOMERS GROUP BY CITY;

-- 17.Find customers who never ordered.
SELECT c.customer_id,c.customer_name,c.email,c.city FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 18. Display total sales by restaurant.
SELECT 
    r.restaurant_name,
    SUM(od.amount) AS total_sales
FROM restaurants r
JOIN food_items f
    ON r.restaurant_id = f.restaurant_id
JOIN order_details od
    ON f.food_id = od.food_id
JOIN orders o
    ON od.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY r.restaurant_id, r.restaurant_name; 

-- 19. Find the highest-selling food item.
SELECT 
    f.food_name,
    SUM(od.quantity) AS total_quantity_sold
FROM food_items f
JOIN order_details od
    ON f.food_id = od.food_id
GROUP BY f.food_id, f.food_name
ORDER BY total_quantity_sold DESC
LIMIT 1; 

-- 20. Display payment mode-wise revenue.
SELECT 
    payment_mode,
    SUM(amount) AS total_revenue
FROM payments
GROUP BY payment_mode; 

-- 21. Find top 5 customers by spending.
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 5;

-- 22. Find top 3 restaurants by revenue.
SELECT
    r.restaurant_id,
    r.restaurant_name,
    SUM(od.amount) AS total_revenue
FROM restaurants r
JOIN food_items f
    ON r.restaurant_id = f.restaurant_id
JOIN order_details od
    ON f.food_id = od.food_id
JOIN orders o
    ON od.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY total_revenue DESC
LIMIT 3;

-- 23. Find monthly sales.
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_sales
FROM orders
WHERE status = 'Delivered'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- 24. Find daily order count.
SELECT
    DATE(order_date) AS order_day,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day;

-- 25. Find average order value per customer.
SELECT
    c.customer_id,
    c.customer_name,
    AVG(o.total_amount) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY average_order_value DESC;

-- 26. Find customers spending above average.
WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.total_amount) AS total_spending
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spending
FROM customer_spending
WHERE total_spending > (
    SELECT AVG(total_spending)
    FROM customer_spending
)
ORDER BY total_spending DESC;

-- 27. Find restaurants with rating greater than average rating.
SELECT
    restaurant_id,
    restaurant_name,
    rating
FROM restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM restaurants
)
ORDER BY rating DESC; 

-- 28. Find the most active customer.
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name
ORDER BY total_orders DESC
LIMIT 1;

-- 29. Find the least active restaurant.
SELECT
    r.restaurant_id,
    r.restaurant_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM restaurants r
LEFT JOIN food_items f
    ON r.restaurant_id = f.restaurant_id
LEFT JOIN order_details od
    ON f.food_id = od.food_id
LEFT JOIN orders o
    ON od.order_id = o.order_id
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY total_orders ASC
LIMIT 1;

-- 30. Find customers ordering from multiple restaurants.
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT f.restaurant_id) AS total_restaurants
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON o.order_id = od.order_id
JOIN food_items f
    ON od.food_id = f.food_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT f.restaurant_id) > 1;


-- 31.Customers spending above average
SELECT 
    c.customer_name,
    SUM(o.total_amount) AS total_spending
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_amount) > (
    SELECT AVG(total_spending)
    FROM (
        SELECT SUM(total_amount) AS total_spending
        FROM orders
        GROUP BY customer_id
    ) AS customer_spending
);

