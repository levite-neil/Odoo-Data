select 
MAX(sale_order.date_order)as Latest_Date_Serviced,
rp.create_date,
rp.name as Store_location,
rp.display_name,
rp.commercial_company_name as Parent_Company,
rp.street,
rp.street2,
rp.city,
rcs.code,
rp.zip,
rp.partner_latitude,
rp.partner_longitude,
--rp.comment,
rp.phone,
rp.email
--COUNT(sale_order.id) as Salecount
from sale_order, res_partner rp, res_country_state rcs 
--where partner_id = '13212' and partner_id = rp.id
where partner_id = rp.id 
and rp.active = true 
and rcs.id = rp.state_id
and rp.commercial_company_name not in ('Advanced Climate Solutions','Advanced Mechanical Services','Alpine Mechanical Services','','Design Air Systems')
group by 
rp.create_date,
rp.name,
rp.display_name,
rp.commercial_company_name,
rp.street,
rp.street2,
rp.city,
rcs.code,
rp.zip,
rp.partner_latitude,
rp.partner_longitude,
--rp.comment,
rp.phone,
rp.email;