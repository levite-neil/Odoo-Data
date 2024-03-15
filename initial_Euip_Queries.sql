--select name, display_name, commercial_company_name, calendar_last_notif_ack,last_udpated_on, write_date from res_partner where id = '13212';

select me.create_date, me.name, eir.res_partner_id, rp."name", rp.display_name,
me."location",me.model, me.serial_no , me.unit_tag_number, me.manufactured_year,me.catalog_number, 
me.tonnage, me.refrigerant_type, me.variable_speed_drive, me.filter_count, me.filter_size, me.banner, me.store, me.rtu, 
me.unit_tag, filt.name as Filter1, me.unit_number, me.filter_id_new as filter2, me.filter_count_new, me.belt_size_id as beltsize
from equipment_ids_rel eir, res_partner rp,maintenance_equipment me
full join 
	(
	select fd.id,fd.name
	from filter_data fd
	) as filt
	on me.filter_id = filt.id
where me.category_id = eir.maintenance_equipment_category_id
and eir.res_partner_id = rp.id

--limit 100;