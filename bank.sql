use bank;

create table accounts(
	account_id int primary key auto_increment,
    customer_id int,
    name varchar(100) not null,
    address  varchar(100),
    phone_number varchar(255),
    account_type varchar(50) not null,
    balance decimal(15,2) not null,
    created_at timestamp default current_timestamp
    );
    
    create table savings(
	  account_id int primary key ,foreign key(account_id) references accounts(account_id),
      interest_rate decimal(5,2) not null
      );
	create table currents(
	  account_id int primary key ,foreign key(account_id) references accounts(account_id),
      overdraft_limit decimal(15,2) not null
      );
      
	create table transactions(
     transaction_id int primary key auto_increment,
     account_id int,foreign key(account_id) references accounts(account_id),
     transaction_type varchar(50) not null,
     amount decimal(15,2) not null,
     transaction_date timestamp default current_timestamp
     );
     
     create table deposits(
      transaction_id int primary key,foreign key(transaction_id) references transactions(transaction_id),
      deposit_method varchar(50) not null
      );
      
      create table withdrawals(
	  transaction_id int primary key,foreign key(transaction_id) references transactions(transaction_id),
      withdrawal_method varchar(50) not null
      );
      
      create table banks(
	   bank_id int primary key auto_increment,
       bank_name varchar(100) not null,
       bank_branch varchar(100) not null
       );