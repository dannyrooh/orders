object dmdDataMain: TdmdDataMain
  OldCreateOrder = False
  Height = 250
  Width = 312
  object conexao: TSQLConnection
    DriverName = 'DevartMySQL'
    GetDriverFunc = 'getSQLDriverMySQL'
    LibraryName = 
      'C:\Program Files (x86)\Devart\dbExpress\MySql\Bin\Win32\dbexpmda' +
      '40.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=localhost'
      'DataBase=sgdbpedidos'
      'User_Name=root'
      'Password=m@ster72'
      'IPVersion=IPv4'
      'ProductName=MySQL'
      
        'DriverAssemblyLoader=Devart.DbxMda.DriverLoader.TCRDynalinkDrive' +
        'rLoader,Devart.DbxMda.DriverLoader,Version=11.0.0.5001,Culture=n' +
        'eutral,PublicKeyToken=09af7300eec23701')
    VendorLib = 'libmysql.dll'
    Left = 81
    Top = 64
  end
end
