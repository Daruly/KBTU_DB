CREATE TABLE Airline_info(
	airline_id INT,
	airline_code VARCHAR(30),
	airline_name VARCHAR(50),
	airline_country VARCHAR(50),
	CREATEd_at TIMESTAMP,
	updated_at TIMESTAMP,
	info VARCHAR(50)
);

CREATE TABLE Airport (
    airport_id INT,
    airport_name VARCHAR(50),
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    CREATEd_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE baggage_check (
	baggage_check_id INT,
	check_result VARCHAR(50),
	CREATEd_at TIMESTAMP,
	updated_at TIMESTAMP,
	booking_id INT,
	passenger_id INT
);

CREATE TABLE Baggage(
	baggage_id INT,
	weight_in_kg DECIMAL(4,2),
	CREATEd_at TIMESTAMP,
	updated_at TIMESTAMP,
	booking_id INT
);

CREATE TABLE boarding_pass(
    boarding_pass_id INT,
    booking_id INT,
    seat VARCHAR(50),
    boarding_time TIMESTAMP,
    CREATEd_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE booking_flight(
	booking_flight_id INT,
	booking_id INT,
	flight_id INT,
	CREATEd_at TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE booking (
	booking_id INT,
	flight_id INT,
	passenger_id INT,
	booking_platform VARCHAR(50),
	CREATEd_at TIMESTAMP,
	updated_at TIMESTAMP,
	status VARCHAR(50),
	price decimal(7,2)
);

CREATE TABLE flights(
    flight_id INT,
    sch_departure_time TIMESTAMP,
    sch_arrival_time TIMESTAMP,
    departing_airport_id INT,
    arriving_airport_id INT,
    departing_gate VARCHAR(50),
    arriving_gate VARCHAR(50),
    airline_id INT,
    act_departure_time TIMESTAMP,
    act_arrival_time TIMESTAMP,
    CREATEd_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE passengers(
	passenger_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	date_of_birth date,
	gender VARCHAR(50),
	country_of_citizenship VARCHAR(50),
	country_of_residence VARCHAR(50),
	passport_number VARCHAR(20),
	CREATEd_at TIMESTAMP,
	updated_at TIMESTAMP
);

CREATE TABLE security_check(
	security_check_id INT,
	check_result VARCHAR(20),
	CREATEd_at TIMESTAMP,
	updated_at TIMESTAMP,
	passenger_id INT
);
-- 

ALTER TABLE airline_info ADD CONSTRAINT pk_airline_info PRIMARY KEY (airline_id);
ALTER TABLE airport ADD CONSTRAINT pk_airport PRIMARY KEY (airport_id);
ALTER TABLE baggage_check ADD CONSTRAINT pk_baggage_check PRIMARY KEY (baggage_check_id);
ALTER TABLE baggage ADD CONSTRAINT pk_baggage PRIMARY KEY (baggage_id);
ALTER TABLE boarding_pass ADD CONSTRAINT pk_boarding_pass PRIMARY KEY (boarding_pass_id);
ALTER TABLE booking_flight ADD CONSTRAINT pk_booking_flight PRIMARY KEY (booking_flight_id);
ALTER TABLE booking ADD CONSTRAINT pk_booking PRIMARY KEY (booking_id);
ALTER TABLE flights ADD CONSTRAINT pk_flights PRIMARY KEY (flight_id);
ALTER TABLE passengers ADD CONSTRAINT pk_passengers PRIMARY KEY (passenger_id);
ALTER TABLE security_check ADD CONSTRAINT pk_security_check PRIMARY KEY (security_check_id);

-- 
ALTER TABLE airline_info
ALTER COLUMN airline_id SET NOT NULL,
ALTER COLUMN airline_code SET NOT NULL,
ALTER COLUMN airline_name SET NOT NULL,
ALTER COLUMN airline_country SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN info SET NOT NULL;

ALTER TABLE airport
	ALTER COLUMN airport_id SET NOT NULL,
	ALTER COLUMN airport_name SET NOT NULL,
	ALTER COLUMN country SET NOT NULL,
	ALTER COLUMN state SET NOT NULL,
	ALTER COLUMN city SET NOT NULL,
	ALTER COLUMN created_at SET NOT NULL,
	ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE baggage_check
ALTER COLUMN baggage_check_id SET NOT NULL,
ALTER COLUMN check_result SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN booking_id SET NOT NULL,
ALTER COLUMN passenger_id SET NOT NULL;

ALTER TABLE baggage
ALTER COLUMN baggage_id SET NOT NULL,
ALTER COLUMN weight_in_kg SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN booking_id SET NOT NULL;

ALTER TABLE boarding_pass
	ALTER COLUMN boarding_pass_id SET NOT NULL,
	ALTER COLUMN booking_id SET NOT NULL,
	ALTER COLUMN seat SET NOT NULL,
	ALTER COLUMN boarding_time SET NOT NULL,
	ALTER COLUMN created_at SET NOT NULL,
	ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE booking_flight
ALTER COLUMN booking_flight_id SET NOT NULL,
ALTER COLUMN booking_id SET NOT NULL,
ALTER COLUMN flight_id SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE booking
	ALTER COLUMN booking_id SET NOT NULL,
	ALTER COLUMN flight_id SET NOT NULL,
	ALTER COLUMN passenger_id SET NOT NULL,
	ALTER COLUMN booking_platform SET NOT NULL,
	ALTER COLUMN created_at SET NOT NULL,
	ALTER COLUMN updated_at SET NOT NULL,
	ALTER COLUMN status SET NOT NULL,
	ALTER COLUMN price SET NOT NULL;

ALTER TABLE flights
ALTER COLUMN flight_id SET NOT NULL,
ALTER COLUMN sch_departure_time SET NOT NULL,
ALTER COLUMN sch_arrival_time SET NOT NULL,
ALTER COLUMN departing_airport_id SET NOT NULL,
ALTER COLUMN arriving_airport_id SET NOT NULL,
ALTER COLUMN departing_gate SET NOT NULL,
ALTER COLUMN arriving_gate SET NOT NULL,
ALTER COLUMN airline_id SET NOT NULL,
ALTER COLUMN act_departure_time SET NOT NULL,
ALTER COLUMN act_arrival_time SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE passengers
	ALTER COLUMN passenger_id SET NOT NULL,
	ALTER COLUMN first_name SET NOT NULL,
	ALTER COLUMN last_name SET NOT NULL,
	ALTER COLUMN date_of_birth SET NOT NULL,
	ALTER COLUMN gender SET NOT NULL,
	ALTER COLUMN country_of_citizenship SET NOT NULL,
	ALTER COLUMN country_of_residence SET NOT NULL,
	ALTER COLUMN passport_number SET NOT NULL,
	ALTER COLUMN created_at SET NOT NULL,
	ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE security_check
ALTER COLUMN security_check_id SET NOT NULL,
ALTER COLUMN check_result SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN passenger_id SET NOT NULL;
-- 

ALTER TABLE airline_info RENAME TO airline

-- 

ALTER TABLE Booking
RENAME COLUMN price TO ticket_price;

-- 

ALTER TABLE Flights
ALTER COLUMN departing_gate TYPE text;

-- 

ALTER TABLE airline
DROP COLUMN info;

-- 

-- 9.1
ALTER TABLE security_check
	ADD CONSTRAINT fk_secuitiry_check_to_passengers
	FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id) ON DELETE CASCADE;

ALTER TABLE booking
	ADD CONSTRAINT fk_booking_to_passengers
	FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id) ON DELETE CASCADE;
ALTER TABLE baggage_check
	ADD CONSTRAINT fk_baggage_check_to_passengers
	FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id) ON DELETE CASCADE;
-- 9.2

ALTER TABLE baggage_check
	ADD CONSTRAINT fk_baggage_check_to_booking
	FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE;

ALTER TABLE baggage
    ADD CONSTRAINT fk_baggage_to_booking
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE;

ALTER TABLE boarding_pass
    ADD CONSTRAINT fk_boarding_pass_to_booking
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE;

ALTER TABLE booking_flight
    ADD CONSTRAINT fk_booking_flight_to_booking
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE;

-- 9.3

ALTER TABLE booking_flight
    ADD CONSTRAINT fk_booking_flight_to_flight
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE;

-- 9.4

ALTER TABLE flights
    ADD CONSTRAINT fk_flights_to_departing_airport
    FOREIGN KEY (departing_airport_id) REFERENCES airport(airport_id) ON DELETE CASCADE;

-- 9.5

ALTER TABLE flights
    ADD CONSTRAINT fk_flights_to_arriving_airport
    FOREIGN KEY (arriving_airport_id) REFERENCES airport(airport_id) ON DELETE CASCADE;

-- 9.6

ALTER TABLE flights
    ADD CONSTRAINT fk_flights_to_airline
    FOREIGN KEY (airline_id) REFERENCES airline(airline_id) ON DELETE CASCADE;

-- 

INSERT INTO airport (airport_id, airport_name, country, state, city, created_at, updated_at) VALUES
(1, 'John F. Kennedy International Airport', 'United States', 'New York', 'New York', NOW(), NOW()),
(2, 'Heathrow Airport', 'United Kingdom', 'England', 'London', NOW(), NOW()),
(3, 'Charles de Gaulle Airport', 'France', 'Île-de-France', 'Paris', NOW(), NOW()),
(4, 'Dubai International Airport', 'United Arab Emirates', 'Dubai', 'Dubai', NOW(), NOW()),
(5, 'Tokyo Haneda Airport', 'Japan', 'Tokyo', 'Tokyo', NOW(), NOW()),
(6, 'Los Angeles International Airport', 'United States', 'California', 'Los Angeles', NOW(), NOW()),
(7, 'Frankfurt Airport', 'Germany', 'Hesse', 'Frankfurt', NOW(), NOW()),
(8, 'Singapore Changi Airport', 'Singapore', 'Central Region', 'Singapore', NOW(), NOW()),
(9, 'Amsterdam Airport Schiphol', 'Netherlands', 'North Holland', 'Amsterdam', NOW(), NOW()),
(10, 'Madrid-Barajas Airport', 'Spain', 'Madrid', 'Madrid', NOW(), NOW()),
(11, 'Beijing Capital International Airport', 'China', 'Beijing', 'Beijing', NOW(), NOW()),
(12, 'Istanbul Airport', 'Turkey', 'Istanbul', 'Istanbul', NOW(), NOW()),
(13, 'Sydney Kingsford Smith Airport', 'Australia', 'New South Wales', 'Sydney', NOW(), NOW()),
(14, 'Toronto Pearson International Airport', 'Canada', 'Ontario', 'Toronto', NOW(), NOW()),
(15, 'Munich Airport', 'Germany', 'Bavaria', 'Munich', NOW(), NOW()),
(16, 'Hong Kong International Airport', 'Hong Kong', 'New Territories', 'Hong Kong', NOW(), NOW()),
(17, 'Zurich Airport', 'Switzerland', 'Zurich', 'Zurich', NOW(), NOW()),
(18, 'Barcelona-El Prat Airport', 'Spain', 'Catalonia', 'Barcelona', NOW(), NOW()),
(19, 'Rome Fiumicino Airport', 'Italy', 'Lazio', 'Rome', NOW(), NOW()),
(20, 'Copenhagen Airport', 'Denmark', 'Capital Region', 'Copenhagen', NOW(), NOW()),
(21, 'Vienna International Airport', 'Austria', 'Lower Austria', 'Vienna', NOW(), NOW()),
(22, 'Stockholm Arlanda Airport', 'Sweden', 'Stockholm County', 'Stockholm', NOW(), NOW()),
(23, 'Oslo Airport', 'Norway', 'Viken', 'Oslo', NOW(), NOW()),
(24, 'Brussels Airport', 'Belgium', 'Flemish Brabant', 'Brussels', NOW(), NOW()),
(25, 'Warsaw Chopin Airport', 'Poland', 'Masovian', 'Warsaw', NOW(), NOW()),
(26, 'Prague Václav Havel Airport', 'Czech Republic', 'Prague', 'Prague', NOW(), NOW()),
(27, 'Budapest Ferenc Liszt Airport', 'Hungary', 'Pest', 'Budapest', NOW(), NOW()),
(28, 'Bucharest Henri Coandă Airport', 'Romania', 'Ilfov', 'Bucharest', NOW(), NOW()),
(29, 'Sofia Airport', 'Bulgaria', 'Sofia Province', 'Sofia', NOW(), NOW()),
(30, 'Athens International Airport', 'Greece', 'Attica', 'Athens', NOW(), NOW()),
(31, 'Helsinki-Vantaa Airport', 'Finland', 'Uusimaa', 'Helsinki', NOW(), NOW()),
(32, 'Riga International Airport', 'Latvia', 'Riga', 'Riga', NOW(), NOW()),
(33, 'Vilnius Airport', 'Lithuania', 'Vilnius County', 'Vilnius', NOW(), NOW()),
(34, 'Tallinn Airport', 'Estonia', 'Harju County', 'Tallinn', NOW(), NOW()),
(35, 'Dublin Airport', 'Ireland', 'Leinster', 'Dublin', NOW(), NOW()),
(36, 'Edinburgh Airport', 'United Kingdom', 'Scotland', 'Edinburgh', NOW(), NOW()),
(37, 'Manchester Airport', 'United Kingdom', 'England', 'Manchester', NOW(), NOW()),
(38, 'Birmingham Airport', 'United Kingdom', 'England', 'Birmingham', NOW(), NOW()),
(39, 'Glasgow Airport', 'United Kingdom', 'Scotland', 'Glasgow', NOW(), NOW()),
(40, 'Bristol Airport', 'United Kingdom', 'England', 'Bristol', NOW(), NOW()),
(41, 'Lisbon Portela Airport', 'Portugal', 'Lisbon', 'Lisbon', NOW(), NOW()),
(42, 'Porto Airport', 'Portugal', 'Norte', 'Porto', NOW(), NOW()),
(43, 'Milan Malpensa Airport', 'Italy', 'Lombardy', 'Milan', NOW(), NOW()),
(44, 'Venice Marco Polo Airport', 'Italy', 'Veneto', 'Venice', NOW(), NOW()),
(45, 'Naples International Airport', 'Italy', 'Campania', 'Naples', NOW(), NOW()),
(46, 'Nice Côte dAzur Airport', 'France', 'Provence-Alpes-Côte dAzur', 'Nice', NOW(), NOW()),
(47, 'Lyon-Saint Exupéry Airport', 'France', 'Auvergne-Rhône-Alpes', 'Lyon', NOW(), NOW()),
(48, 'Marseille Provence Airport', 'France', 'Provence-Alpes-Côte dAzur', 'Marseille', NOW(), NOW()),
(49, 'Toulouse-Blagnac Airport', 'France', 'Occitanie', 'Toulouse', NOW(), NOW()),
(50, 'Bordeaux-Mérignac Airport', 'France', 'Nouvelle-Aquitaine', 'Bordeaux', NOW(), NOW()),
(51, 'Düsseldorf Airport', 'Germany', 'North Rhine-Westphalia', 'Düsseldorf', NOW(), NOW()),
(52, 'Hamburg Airport', 'Germany', 'Hamburg', 'Hamburg', NOW(), NOW()),
(53, 'Berlin Brandenburg Airport', 'Germany', 'Brandenburg', 'Berlin', NOW(), NOW()),
(54, 'Stuttgart Airport', 'Germany', 'Baden-Württemberg', 'Stuttgart', NOW(), NOW()),
(55, 'Cologne Bonn Airport', 'Germany', 'North Rhine-Westphalia', 'Cologne', NOW(), NOW()),
(56, 'São Paulo–Guarulhos International Airport', 'Brazil', 'São Paulo', 'São Paulo', NOW(), NOW()),
(57, 'Rio de Janeiro–Galeão International Airport', 'Brazil', 'Rio de Janeiro', 'Rio de Janeiro', NOW(), NOW()),
(58, 'Brasília International Airport', 'Brazil', 'Federal District', 'Brasília', NOW(), NOW()),
(59, 'Salvador International Airport', 'Brazil', 'Bahia', 'Salvador', NOW(), NOW()),
(60, 'Recife International Airport', 'Brazil', 'Pernambuco', 'Recife', NOW(), NOW()),
(61, 'Mexico City International Airport', 'Mexico', 'Mexico City', 'Mexico City', NOW(), NOW()),
(62, 'Cancún International Airport', 'Mexico', 'Quintana Roo', 'Cancún', NOW(), NOW()),
(63, 'Guadalajara International Airport', 'Mexico', 'Jalisco', 'Guadalajara', NOW(), NOW()),
(64, 'Monterrey International Airport', 'Mexico', 'Nuevo León', 'Monterrey', NOW(), NOW()),
(65, 'Tijuana International Airport', 'Mexico', 'Baja California', 'Tijuana', NOW(), NOW()),
(66, 'Jorge Newbery Airfield', 'Argentina', 'Buenos Aires', 'Buenos Aires', NOW(), NOW()),
(67, 'Córdoba Airport', 'Argentina', 'Córdoba', 'Córdoba', NOW(), NOW()),
(68, 'Mendoza Airport', 'Argentina', 'Mendoza', 'Mendoza', NOW(), NOW()),
(69, 'Santiago International Airport', 'Chile', 'Santiago Metropolitan', 'Santiago', NOW(), NOW()),
(70, 'Lima Jorge Chávez International Airport', 'Peru', 'Lima', 'Lima', NOW(), NOW()),
(71, 'Bogotá El Dorado International Airport', 'Colombia', 'Cundinamarca', 'Bogotá', NOW(), NOW()),
(72, 'Medellín José María Córdova International Airport', 'Colombia', 'Antioquia', 'Medellín', NOW(), NOW()),
(73, 'Caracas Simón Bolívar International Airport', 'Venezuela', 'Vargas', 'Caracas', NOW(), NOW()),
(74, 'Quito Mariscal Sucre International Airport', 'Ecuador', 'Pichincha', 'Quito', NOW(), NOW()),
(75, 'La Paz El Alto International Airport', 'Bolivia', 'La Paz', 'La Paz', NOW(), NOW()),
(76, 'Asunción Silvio Pettirossi International Airport', 'Paraguay', 'Central', 'Asunción', NOW(), NOW()),
(77, 'Montevideo Carrasco International Airport', 'Uruguay', 'Canelones', 'Montevideo', NOW(), NOW()),
(78, 'Georgetown Cheddi Jagan International Airport', 'Guyana', 'Demerara-Mahaica', 'Georgetown', NOW(), NOW()),
(79, 'Paramaribo Johan Adolf Pengel International Airport', 'Suriname', 'Para', 'Paramaribo', NOW(), NOW()),
(80, 'Cayenne – Félix Eboué Airport', 'French Guiana', 'Guyane', 'Cayenne', NOW(), NOW()),
(81, 'Mumbai Chhatrapati Shivaji International Airport', 'India', 'Maharashtra', 'Mumbai', NOW(), NOW()),
(82, 'Delhi Indira Gandhi International Airport', 'India', 'Delhi', 'New Delhi', NOW(), NOW()),
(83, 'Bengaluru Kempegowda International Airport', 'India', 'Karnataka', 'Bengaluru', NOW(), NOW()),
(84, 'Chennai International Airport', 'India', 'Tamil Nadu', 'Chennai', NOW(), NOW()),
(85, 'Kolkata Netaji Subhas Chandra Bose International Airport', 'India', 'West Bengal', 'Kolkata', NOW(), NOW()),
(86, 'Hyderabad Rajiv Gandhi International Airport', 'India', 'Telangana', 'Hyderabad', NOW(), NOW()),
(87, 'Ahmedabad Sardar Vallabhbhai Patel International Airport', 'India', 'Gujarat', 'Ahmedabad', NOW(), NOW()),
(88, 'Pune Airport', 'India', 'Maharashtra', 'Pune', NOW(), NOW()),
(89, 'Goa Dabolim Airport', 'India', 'Goa', 'Goa', NOW(), NOW()),
(90, 'Kochi International Airport', 'India', 'Kerala', 'Kochi', NOW(), NOW()),
(91, 'Islamabad International Airport', 'Pakistan', 'Islamabad Capital Territory', 'Islamabad', NOW(), NOW()),
(92, 'Karachi Jinnah International Airport', 'Pakistan', 'Sindh', 'Karachi', NOW(), NOW()),
(93, 'Lahore Allama Iqbal International Airport', 'Pakistan', 'Punjab', 'Lahore', NOW(), NOW()),
(94, 'Dhaka Hazrat Shahjalal International Airport', 'Bangladesh', 'Dhaka', 'Dhaka', NOW(), NOW()),
(95, 'Colombo Bandaranaike International Airport', 'Sri Lanka', 'Western Province', 'Colombo', NOW(), NOW()),
(96, 'Kathmandu Tribhuvan International Airport', 'Nepal', 'Bagmati', 'Kathmandu', NOW(), NOW()),
(97, 'Thimphu Paro Airport', 'Bhutan', 'Paro', 'Paro', NOW(), NOW()),
(98, 'Malé Velana International Airport', 'Maldives', 'Kaafu Atoll', 'Malé', NOW(), NOW()),
(99, 'Bangkok Suvarnabhumi Airport', 'Thailand', 'Samut Prakan', 'Bangkok', NOW(), NOW()),
(100, 'Bangkok Don Mueang International Airport', 'Thailand', 'Bangkok', 'Bangkok', NOW(), NOW()),
(101, 'Phuket International Airport', 'Thailand', 'Phuket', 'Phuket', NOW(), NOW()),
(102, 'Chiang Mai International Airport', 'Thailand', 'Chiang Mai', 'Chiang Mai', NOW(), NOW()),
(103, 'Kuala Lumpur International Airport', 'Malaysia', 'Selangor', 'Kuala Lumpur', NOW(), NOW()),
(104, 'Penang International Airport', 'Malaysia', 'Penang', 'Penang', NOW(), NOW()),
(105, 'Kota Kinabalu International Airport', 'Malaysia', 'Sabah', 'Kota Kinabalu', NOW(), NOW()),
(106, 'Jakarta Soekarno-Hatta International Airport', 'Indonesia', 'Banten', 'Jakarta', NOW(), NOW()),
(107, 'Bali Ngurah Rai International Airport', 'Indonesia', 'Bali', 'Denpasar', NOW(), NOW()),
(108, 'Surabaya Juanda International Airport', 'Indonesia', 'East Java', 'Surabaya', NOW(), NOW()),
(109, 'Manila Ninoy Aquino International Airport', 'Philippines', 'Metro Manila', 'Manila', NOW(), NOW()),
(110, 'Cebu Mactan-Cebu International Airport', 'Philippines', 'Central Visayas', 'Cebu', NOW(), NOW()),
(111, 'Ho Chi Minh City Tan Son Nhat International Airport', 'Vietnam', 'Ho Chi Minh City', 'Ho Chi Minh City', NOW(), NOW()),
(112, 'Hanoi Noi Bai International Airport', 'Vietnam', 'Hanoi', 'Hanoi', NOW(), NOW()),
(113, 'Da Nang International Airport', 'Vietnam', 'Da Nang', 'Da Nang', NOW(), NOW()),
(114, 'Phnom Penh International Airport', 'Cambodia', 'Phnom Penh', 'Phnom Penh', NOW(), NOW()),
(115, 'Siem Reap International Airport', 'Cambodia', 'Siem Reap', 'Siem Reap', NOW(), NOW()),
(116, 'Vientiane Wattay International Airport', 'Laos', 'Vientiane Prefecture', 'Vientiane', NOW(), NOW()),
(117, 'Yangon International Airport', 'Myanmar', 'Yangon Region', 'Yangon', NOW(), NOW()),
(118, 'Naypyidaw International Airport', 'Myanmar', 'Naypyidaw Union Territory', 'Naypyidaw', NOW(), NOW()),
(119, 'Seoul Incheon International Airport', 'South Korea', 'Incheon', 'Seoul', NOW(), NOW()),
(120, 'Seoul Gimpo International Airport', 'South Korea', 'Seoul', 'Seoul', NOW(), NOW()),
(121, 'Busan Gimhae International Airport', 'South Korea', 'Busan', 'Busan', NOW(), NOW()),
(122, 'Jeju International Airport', 'South Korea', 'Jeju', 'Jeju', NOW(), NOW()),
(123, 'Tokyo Narita International Airport', 'Japan', 'Chiba', 'Tokyo', NOW(), NOW()),
(124, 'Osaka Kansai International Airport', 'Japan', 'Osaka', 'Osaka', NOW(), NOW()),
(125, 'Nagoya Chubu Centrair International Airport', 'Japan', 'Aichi', 'Nagoya', NOW(), NOW()),
(126, 'Fukuoka Airport', 'Japan', 'Fukuoka', 'Fukuoka', NOW(), NOW()),
(127, 'Sapporo New Chitose Airport', 'Japan', 'Hokkaido', 'Sapporo', NOW(), NOW()),
(128, 'Okinawa Naha Airport', 'Japan', 'Okinawa', 'Naha', NOW(), NOW()),
(129, 'Taipei Taoyuan International Airport', 'Taiwan', 'Taoyuan', 'Taipei', NOW(), NOW()),
(130, 'Kaohsiung International Airport', 'Taiwan', 'Kaohsiung', 'Kaohsiung', NOW(), NOW()),
(131, 'Macau International Airport', 'Macau', 'Macau Peninsula', 'Macau', NOW(), NOW()),
(132, 'Shanghai Pudong International Airport', 'China', 'Shanghai', 'Shanghai', NOW(), NOW()),
(133, 'Shanghai Hongqiao International Airport', 'China', 'Shanghai', 'Shanghai', NOW(), NOW()),
(134, 'Guangzhou Baiyun International Airport', 'China', 'Guangdong', 'Guangzhou', NOW(), NOW()),
(135, 'Shenzhen Bao an International Airport', 'China', 'Guangdong', 'Shenzhen', NOW(), NOW()),
(136, 'Chengdu Shuangliu International Airport', 'China', 'Sichuan', 'Chengdu', NOW(), NOW()),
(137, 'Xi an Xianyang International Airport', 'China', 'Shaanxi', 'Xi an', NOW(), NOW()),
(138, 'Kunming Changshui International Airport', 'China', 'Yunnan', 'Kunming', NOW(), NOW()),
(139, 'Hangzhou Xiaoshan International Airport', 'China', 'Zhejiang', 'Hangzhou', NOW(), NOW()),
(140, 'Nanjing Lukou International Airport', 'China', 'Jiangsu', 'Nanjing', NOW(), NOW()),
(141, 'Almaty International Airport', 'Kazakhstan', 'Almaty', 'Almaty', NOW(), NOW()),
(142, 'Nur-Sultan Nazarbayev International Airport', 'Kazakhstan', 'Nur-Sultan', 'Nur-Sultan', NOW(), NOW()),
(143, 'Shymkent Airport', 'Kazakhstan', 'Turkestan', 'Shymkent', NOW(), NOW()),
(144, 'Tashkent International Airport', 'Uzbekistan', 'Tashkent', 'Tashkent', NOW(), NOW()),
(145, 'Samarkand International Airport', 'Uzbekistan', 'Samarkand', 'Samarkand', NOW(), NOW()),
(146, 'Bishkek Manas International Airport', 'Kyrgyzstan', 'Chuy', 'Bishkek', NOW(), NOW()),
(147, 'Dushanbe International Airport', 'Tajikistan', 'Dushanbe', 'Dushanbe', NOW(), NOW()),
(148, 'Ashgabat International Airport', 'Turkmenistan', 'Ahal', 'Ashgabat', NOW(), NOW()),
(149, 'Baku Heydar Aliyev International Airport', 'Azerbaijan', 'Baku', 'Baku', NOW(), NOW()),
(150, 'Yerevan Zvartnots International Airport', 'Armenia', 'Ararat', 'Yerevan', NOW(), NOW()),
(151, 'Tbilisi International Airport', 'Georgia', 'Kvemo Kartli', 'Tbilisi', NOW(), NOW()),
(152, 'Tehran Imam Khomeini International Airport', 'Iran', 'Tehran', 'Tehran', NOW(), NOW()),
(153, 'Mashhad International Airport', 'Iran', 'Razavi Khorasan', 'Mashhad', NOW(), NOW()),
(154, 'Isfahan International Airport', 'Iran', 'Isfahan', 'Isfahan', NOW(), NOW()),
(155, 'Baghdad International Airport', 'Iraq', 'Baghdad', 'Baghdad', NOW(), NOW()),
(156, 'Erbil International Airport', 'Iraq', 'Kurdistan Region', 'Erbil', NOW(), NOW()),
(157, 'Kuwait International Airport', 'Kuwait', 'Al Farwaniyah', 'Kuwait City', NOW(), NOW()),
(158, 'King Fahd International Airport', 'Saudi Arabia', 'Eastern Province', 'Dammam', NOW(), NOW()),
(159, 'King Abdulaziz International Airport', 'Saudi Arabia', 'Makkah', 'Jeddah', NOW(), NOW()),
(160, 'King Khalid International Airport', 'Saudi Arabia', 'Riyadh', 'Riyadh', NOW(), NOW()),
(161, 'Doha Hamad International Airport', 'Qatar', 'Doha', 'Doha', NOW(), NOW()),
(162, 'Abu Dhabi International Airport', 'United Arab Emirates', 'Abu Dhabi', 'Abu Dhabi', NOW(), NOW()),
(163, 'Dubai Al Maktoum International Airport', 'United Arab Emirates', 'Dubai', 'Dubai', NOW(), NOW()),
(164, 'Sharjah International Airport', 'United Arab Emirates', 'Sharjah', 'Sharjah', NOW(), NOW()),
(165, 'Muscat International Airport', 'Oman', 'Muscat', 'Muscat', NOW(), NOW()),
(166, 'Salalah Airport', 'Oman', 'Dhofar', 'Salalah', NOW(), NOW()),
(167, 'Manama Bahrain International Airport', 'Bahrain', 'Northern Governorate', 'Manama', NOW(), NOW()),
(168, 'Ben Gurion Airport', 'Israel', 'Central District', 'Tel Aviv', NOW(), NOW()),
(169, 'Queen Alia International Airport', 'Jordan', 'Amman', 'Amman', NOW(), NOW()),
(170, 'Damascus International Airport', 'Syria', 'Rif Dimashq', 'Damascus', NOW(), NOW()),
(171, 'Beirut Rafic Hariri International Airport', 'Lebanon', 'Mount Lebanon', 'Beirut', NOW(), NOW()),
(172, 'Larnaca International Airport', 'Cyprus', 'Larnaca', 'Larnaca', NOW(), NOW()),
(173, 'Paphos International Airport', 'Cyprus', 'Paphos', 'Paphos', NOW(), NOW()),
(174, 'Antalya Airport', 'Turkey', 'Antalya', 'Antalya', NOW(), NOW()),
(175, 'Sabiha Gökçen International Airport', 'Turkey', 'Istanbul', 'Istanbul', NOW(), NOW()),
(176, 'Ankara Esenboğa Airport', 'Turkey', 'Ankara', 'Ankara', NOW(), NOW()),
(177, 'İzmir Adnan Menderes Airport', 'Turkey', 'İzmir', 'İzmir', NOW(), NOW()),
(178, 'Cairo International Airport', 'Egypt', 'Cairo', 'Cairo', NOW(), NOW()),
(179, 'Sharm El Sheikh International Airport', 'Egypt', 'South Sinai', 'Sharm El Sheikh', NOW(), NOW()),
(180, 'Hurghada International Airport', 'Egypt', 'Red Sea', 'Hurghada', NOW(), NOW()),
(181, 'Casablanca Mohammed V International Airport', 'Morocco', 'Casablanca-Settat', 'Casablanca', NOW(), NOW()),
(182, 'Marrakech Menara Airport', 'Morocco', 'Marrakech-Safi', 'Marrakech', NOW(), NOW()),
(183, 'Tunis-Carthage International Airport', 'Tunisia', 'Tunis', 'Tunis', NOW(), NOW()),
(184, 'Algiers Houari Boumediene Airport', 'Algeria', 'Algiers', 'Algiers', NOW(), NOW()),
(185, 'Tripoli International Airport', 'Libya', 'Tripoli', 'Tripoli', NOW(), NOW()),
(186, 'Cape Town International Airport', 'South Africa', 'Western Cape', 'Cape Town', NOW(), NOW()),
(187, 'Johannesburg O.R. Tambo International Airport', 'South Africa', 'Gauteng', 'Johannesburg', NOW(), NOW()),
(188, 'Durban King Shaka International Airport', 'South Africa', 'KwaZulu-Natal', 'Durban', NOW(), NOW()),
(189, 'Lagos Murtala Muhammed International Airport', 'Nigeria', 'Lagos', 'Lagos', NOW(), NOW()),
(190, 'Abuja Nnamdi Azikiwe International Airport', 'Nigeria', 'Federal Capital Territory', 'Abuja', NOW(), NOW()),
(191, 'Nairobi Jomo Kenyatta International Airport', 'Kenya', 'Nairobi', 'Nairobi', NOW(), NOW()),
(192, 'Addis Ababa Bole International Airport', 'Ethiopia', 'Addis Ababa', 'Addis Ababa', NOW(), NOW()),
(193, 'Dar es Salaam Julius Nyerere International Airport', 'Tanzania', 'Dar es Salaam', 'Dar es Salaam', NOW(), NOW()),
(194, 'Entebbe International Airport', 'Uganda', 'Central Region', 'Entebbe', NOW(), NOW()),
(195, 'Kigali International Airport', 'Rwanda', 'Eastern Province', 'Kigali', NOW(), NOW()),
(196, 'Lusaka Kenneth Kaunda International Airport', 'Zambia', 'Lusaka', 'Lusaka', NOW(), NOW()),
(197, 'Harare Robert Gabriel Mugabe International Airport', 'Zimbabwe', 'Harare', 'Harare', NOW(), NOW()),
(198, 'Gaborone Sir Seretse Khama International Airport', 'Botswana', 'South-East District', 'Gaborone', NOW(), NOW()),
(199, 'Windhoek Hosea Kutako International Airport', 'Namibia', 'Khomas', 'Windhoek', NOW(), NOW()),
(200, 'Maputo International Airport', 'Mozambique', 'Maputo', 'Maputo', NOW(), NOW());

-- 

-- DML

-- 
INSERT INTO Airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES (1, 'KZ001', 'KazAir', 'Kazakhstan', NOW(), NOW());

--
UPDATE Airline
SET airline_country = 'Turkey'
WHERE airline_name = 'KazAir';

-- 
INSERT INTO Airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES 
(2, 'FR001', 'AirEasy', 'France', NOW(), NOW()),
(3, 'BR001', 'FlyHigh', 'Brazil', NOW(), NOW()),
(4, 'PL001', 'FlyFly', 'Poland', NOW(), NOW());

-- 
DELETE FROM Flights
WHERE EXTRACT(YEAR FROM sch_arrival_time) = 2024;

--
UPDATE Booking
SET ticket_price = ticket_price * 1.15;

-- 
DELETE FROM Booking
WHERE ticket_price < 10000;