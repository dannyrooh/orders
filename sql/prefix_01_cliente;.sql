delete from cliente where cli_id > 0;

insert into cliente(cli_codigo, cli_nome, cli_cidade, cli_uf) 
values
   (1, "Johh Doe CWB", "Curiba", "PR"),
   (2, "Mary key CWB", "Curitiba", "PR"),
   (3, "Petter Pan CWB", "Curitiba", "PR"),
   (4, "Joe  Fox CWB", "Curitiba", "PR");
   
insert into cliente(cli_codigo, cli_nome, cli_cidade, cli_uf)
  select (select MAX(x.cli_codigo) from cliente x) + c.cli_codigo , REPLACE( c.cli_nome , "CWB", "FLN") , "Florianópolis", "SC"
   from cliente c    
   where c.cli_uf = "PR";
   
insert into cliente(cli_codigo, cli_nome, cli_cidade, cli_uf)
  select (select MAX(x.cli_codigo) from cliente x) + c.cli_codigo , REPLACE( c.cli_nome , "CWB", "GRU") , "São Paulo", "SP"
   from cliente c    
   where c.cli_uf = "PR";   

insert into cliente(cli_codigo, cli_nome, cli_cidade, cli_uf)
  select (select MAX(x.cli_codigo) from cliente x) + c.cli_codigo , REPLACE( c.cli_nome , "CWB", "GIG") , "Rio de Janeiro", "RJ"
   from cliente c    
   where c.cli_uf = "PR";   
   
insert into cliente(cli_codigo, cli_nome, cli_cidade, cli_uf)
  select (select MAX(x.cli_codigo) from cliente x) + c.cli_codigo , REPLACE( c.cli_nome , "CWB", "CNF"), "Minas Gerais", "MG"
   from cliente c    
   where c.cli_uf = "PR";   
