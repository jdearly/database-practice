-- Author: Joshua Early
-- 2017
start inventoryPO2_D2L.sql;

drop sequence order_id;
drop table Sim_Data;
drop table Sim_Product;

create table Sim_Product
(
	  SKU integer
	, Vendor varchar(25)
	, Delivery_Days integer
	, Cost number
	, Cost_Inc number
	, Price_Inc number 
	, PO_ID integer
);
 
create table Sim_Data
(
      Name    varchar(20)
    , Value  integer
);

create sequence po_id_seq increment by 10
	start with 260;
	
commit;

create or replace procedure purchase_inventory is
begin 
null;

end purchase_inventory;
/

create or replace procedure receive_inventory is
begin 
null;
end receive_inventory;
/


create or replace trigger po_trigger
	after update of on_hand on product
	for each row
	declare 
	new_vendor varchar(20);
    new_value integer;
    new_SKU integer;

	begin
	select Vendor into new_vendor
    from Sim_Product
    where Sim_Product.SKU = :new.SKU;

	select Value into new_value
	from Sim_Data
    where name = 'Sim_Day';
	
if (:new.On_Hand + :new.On_Order) <= :new.Reorder_Target then
	insert into Purchase_Order (PO_ID, Vendor, Order_Date, Status)
    values (PO_ID_SEQ.NextVal, new_vendor, new_value, 'new');
    insert into Inventory (PO_ID) select PO_ID from Purchase_Order
    group by PO_ID;
	end if;
end po_trigger;
/
	
