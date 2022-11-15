select * from crash c ;

-- negara bagian
select distinct(c.state_name) state from crash c ;

-- kota kota 
select distinct(c.city_name)  city_name from crash c ;

-- area / wilayah
-- tidak dilaporkan / tidak dikenal / trafic tidak di miliki negara / pedesaan / perkotaan
select distinct(c.land_use_name) land_name from crash c ;

-- nama system functional
-- tidak di kenal / kolektor utama / kolektor kecil / tidak dilaporkan 
-- antar negara bagian / jalur lalu lintas tidak di kuasai negara /
-- jalan ateri utama lain nya / jalur lokal / jalan ateri kecil / jalan tol ateri utama
select distinct(c.functional_system_name) fsysname from crash c ;

-- kodisi cuaca lalu lintas
-- angin kencang yg parah / laporan tidak diketahui / lain nya 
-- hembusan pasir tanah kotoran / hujan es / cuaca jernih bersih 
-- hujan beku atau gerimis / angin salju / kabut asap 
-- tidak di laporkan / salju / hujan / berwawan
select distinct(c.atmospheric_conditions_1_name) as cuaca from crash c ;

-- kondisi laporan kejadian
-- dilaporkan sebagai tidak di kenal / lain nya / sideswipe sama arah
-- sudut / depan ke belakang / belakang ke belakang / tidak di laporkan 
-- belakang ke sisi / peristiwa merugikan bukan tabrakan dengan kendaraan
-- angkutan bergeser arah berlawanan arah / depan dengan depan 
select distinct(c.manner_of_collision_name) manner from crash c ;

--type persimpangan jalan 
-- persimpangan jalan / bukan persimpangan jalan / persimpangan jalan lain nya 
-- tidak di laporkan / jalan empat jalur / persimpangan L 8 arah/ lingkar lalu lintas 
-- buundaran / di laporkan tidak di ketahui / persimangan tiga arah
select distinct(c.type_of_intersection_name) type_intersection from crash c ;

--kondisi 
--kondisi gelap / senja / dilaporak tidak di ketahui / lain nya 
--gelap - terang / gelap - tidak terang / fajar - subuh / tidak ter lapor / siang hari
select distinct(c.light_condition_name)  from crash c ;

-- istilah :
-- consercutive number = angka berurutan
-- milepoint = titik tolak ukur
-- number of fatalities = jumlah kematian
-- number of drunk driver = jumlah pengemudi mabuk
-- timestamp of crash = waktu kecelakaan

-- global cek jumlah data 560115 -10001 = 550.114 / 35.451 data 
select count(*) from crash c ;
select * from crash c order by c.consecutive_number asc ;

-- angka jumlah kejadian di tiap negara bagian
select distinct c.state_name, count(c.consecutive_number) jumlah from crash c group by c.state_name ; 

-- angka jumlah kejadian di tiap negara bagian
select distinct c.state_name, 
  count(c.consecutive_number) countdata,
  sum(c.number_of_fatalities) fatalities,
  sum(c.number_of_drunk_drivers) drunk_drivers,
  sum(c.number_of_vehicle_forms_submitted_all) vehicle_forms_submit,
  sum(c.number_of_motor_vehicles_in_transport_mvit) number_of_motor_vehicles 
from crash c group by c.state_name ;