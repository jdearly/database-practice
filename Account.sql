-- Joshua Early
-- 2017

set echo on;
drop table Account;

create table Account
(
	custID smallint
	, accType varchar2(12)
	, balance number(10,2) check (balance >= 0)
	, constraint acct_PK Primary Key (custID, accType)
);
commit;
-- add some data
insert into account(custID, accType, balance) 
values(1, 'savings', 500.00);

insert into account(custID, accType, balance) 
values(1, 'checking', 450.00);
commit;
-- check the table and data
set linesize 160;
select * from Account;

set serveroutput on;

-- create stored procedure named transfer to transfer money between accounts
create or replace procedure sp_transfer
 (acustID in account.custid%type, 
  asource in account.accType%type, 
  atarget in account.accType%type, 
  aNamount in account.balance%type 
 ) is

  oldBalance account.balance%type;
  sqlerrm varchar2(30) := 'Error in sp_transfer';

-- note the use of the specification 'for update' to ensure a lock	
begin
	select balance into oldBalance 
	from account 
	where custID = acustID and accType = asource
	for update of balance;

	dbms_output.put_line('Existing balance on account: ' || oldBalance);
	dbms_output.put_line('Amount to be transferred: ' || aNamount);

	if oldBalance > aNamount then
		update account set balance = oldBalance - aNamount 
			where custid = acustID and account.accType = asource;
		
		update account set balance = balance + aNamount
			where custid = acustID and account.accType = atarget;
	else
		dbms_output.put_line('Existing balance of ' || oldBalance || ' insufficient to transfer ' || aNamount);
	end if;
	commit;
	exception
		when others then
			dbms_output.put_line('Error! ' || sqlerrm);
		rollback;
end;
/
show errors
