create schema sgdbpedidos default character set utf8;

use sgdbpedidos;

/* uauario e senha do owner
user: root
pwd: m@ster72
*/

 
create table cliente(
  cli_id int not null auto_increment,
  cli_codigo int not null,
  cli_nome varchar(128) not null,
  cli_cidade varchar(64) not null,
  cli_uf char(2) not null,
  primary key(cli_id)
);

create unique index uk_cli_codigo on cliente(cli_codigo);
create index idx_cli_nome on cliente(cli_nome);

create table produto(
  pro_id int not null auto_increment,
  pro_codigo int not null, 
  pro_descricao varchar(250) not null,
  pro_preco_venda decimal(10,4) not null,
  primary key(pro_id),
  CONSTRAINT chk_preco_venda CHECK (pro_preco_venda >= 0)
);

create unique index uk_pro_codigo on produto(pro_codigo);
create index idx_pro_descricao on produto(pro_descricao) ;

create table pedido_venda(
  ped_id int not null auto_increment,
  ped_cliente int not null,
  ped_numero int not null,
  ped_emissao timestamp default current_timestamp() not null,
  ped_valor_total decimal(10,2),
  primary key(ped_id),
  unique key(ped_numero),
  foreign key(ped_cliente) references cliente(cli_id),
  constraint chk_ped_valor_total check(ped_valor_total >= 0)
);

create index idx_ped_cliente on pedido_venda(ped_cliente);

create table pedido_venda_item(
  pit_pedido_venda int not null,
  pit_sequencia int not null,
  pit_produto int not null,
  pit_quantidade decimal(6,2),
  pit_valor_unitario decimal(10,2),
  pti_valor_total decimal(10,2),
  primary key(pit_pedido_venda, pit_sequencia),
  foreign key(pit_produto) references produto(pro_id)  
);

create index idx_pit_produto on pedido_venda_item(pit_pedido_venda);
create index idx_pit_sequencia on pedido_venda_item(pit_pedido_venda, pit_sequencia);


/*criand um usuario para utilizar o sistema, sem permisão para criar ou excluir tabelas

create user 'developer' identified by 'dev';
grant select, insert, update , delete on *.* to 'develope'@'localhost';

*/