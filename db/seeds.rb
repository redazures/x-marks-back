# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'pry'
require 'rest-client'
require 'json'

puts "run time! let's go go go"
# Currency.delete_all

# Currency.create(price:5.00,symbol:"SCHB", name:"Schrute Buck")
# Currency.create(price:5.00,symbol:"STLNK", name:"Stanley Nickle")

users="Jules,Taevon,Csatherine,steveD,greg,alexS,Tashawn,IanG,James,IanR,Jennifer,Alex,Junko,RyanW,Karan,SeMin,JakeL,Brian,Devin,Muhtasim,Josh,DavidKir,Amit,JakeM,Victor,Kevin,RyanF,Vincent,DavidK,Ward,Codyd,RyanL,Matthew,Gregory,Codyc,Mimi,Minelie,Joseph,Samuel,Sawandi,Iuri,Jzavier,Israel,Vlad,Teddy"
users=users.split(",")
users.each{|u|Member.create(name:u, email:"#{u}@flat.com",age:rand(20..40),creditcard:rand(10000000..99999999))}

countries={
    "AED"=>["United Arab Emirates Dirham","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "AFN"=>["Afghanistan Afghani","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "ALL"=>["Albania Lek","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "AMD"=>["Armenia Dram","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "ANG"=>["Netherlands Antilles Guilder","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "AOA"=>["Angola Kwanza","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "ARS"=>["Argentina Peso","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "AUD"=>["Australia Dollar","http://www.geonames.org/flags/l/au.gif"],
    "AWG"=>["Aruba Guilder","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "AZN"=>["Azerbaijan Manat","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BAM"=>["Bosnia and Herzegovina Convertible Mark","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BBD"=>["Barbados Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BDT"=>["Bangladesh Taka","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BGN"=>["Bulgaria Lev","http://www.geonames.org/flags/l/bg.gif"],
    "BHD"=>["Bahrain Dinar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BIF"=>["Burundi Franc","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BMD"=>["Bermuda Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BND"=>["Brunei Darussalam Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BOB"=>["Bolivia Bolíviano","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BRL"=>["Brazil Real","http://www.geonames.org/flags/l/br.gif"],
    "BSD"=>["Bahamas Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BTN"=>["Bhutan Ngultrum","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BWP"=>["Botswana Pula","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BYN"=>["Belarus Ruble","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "BZD"=>["Belize Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "CAD"=>["Canada Dollar","http://www.geonames.org/flags/l/ca.gif"],
    "CDF"=>["Congo/Kinshasa Franc","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "CHF"=>["Switzerland Franc","http://www.geonames.org/flags/l/ch.gif"],
    "CLP"=>["Chile Peso","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "CNY"=>["China Yuan Renminbi","http://www.geonames.org/flags/l/cn.gif"],
    "COP"=>["Colombia Peso","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "CRC"=>["Costa Rica Colon","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "CUC"=>["Cuba Convertible Peso","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "CUP"=>["Cuba Peso","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "CVE"=>["Cape Verde Escudo","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "CZK"=>["Czech Republic Koruna","http://www.geonames.org/flags/l/cz.gif"],
    "DJF"=>["Djibouti Franc","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "DKK"=>["Denmark Krone","http://www.geonames.org/flags/l/dk.gif"],
    "DOP"=>["Dominican Republic Peso","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "DZD"=>["Algeria Dinar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "EGP"=>["Egypt Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "ERN"=>["Eritrea Nakfa","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "ETB"=>["Ethiopia Birr","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "EUR"=>["Euro Member Countries","https://upload.wikimedia.org/wikipedia/commons/b/b7/Flag_of_Europe.svg"],
    "FJD"=>["Fiji Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "FKP"=>["Falkland Islands (Malvinas) Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "GBP"=>["United Kingdom Pound","http://www.geonames.org/flags/l/uk.gif"],
    "GEL"=>["Georgia Lari","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "GGP"=>["Guernsey Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "GHS"=>["Ghana Cedi","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "GIP"=>["Gibraltar Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "GMD"=>["Gambia Dalasi","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "GNF"=>["Guinea Franc","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "GTQ"=>["Guatemala Quetzal","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "GYD"=>["Guyana Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "HKD"=>["Hong Kong Dollar","http://www.geonames.org/flags/l/hk.gif"],
    "HNL"=>["Honduras Lempira","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "HRK"=>["Croatia Kuna","http://www.geonames.org/flags/l/hr.gif"],
    "HTG"=>["Haiti Gourde","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "HUF"=>["Hungary Forint","http://www.geonames.org/flags/l/hu.gif"],
    "IDR"=>["Indonesia Rupiah","http://www.geonames.org/flags/l/id.gif"],
    "ILS"=>["Israel Shekel","http://www.geonames.org/flags/l/il.gif"],
    "IMP"=>["Isle of Man Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "INR"=>["India Rupee","http://www.geonames.org/flags/l/in.gif"],
    "IQD"=>["Iraq Dinar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "IRR"=>["Iran Rial","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "ISK"=>["Iceland Krona","http://www.geonames.org/flags/l/is.gif"],
    "JEP"=>["Jersey Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "JMD"=>["Jamaica Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "JOD"=>["Jordan Dinar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "JPY"=>["Japan Yen","http://www.geonames.org/flags/l/jp.gif"],
    "KES"=>["Kenya Shilling","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "KGS"=>["Kyrgyzstan Som","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "KHR"=>["Cambodia Riel","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "KMF"=>["Comorian Franc","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "KPW"=>["Korea (North) Won","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "KRW"=>["Korea (South) Won","http://www.geonames.org/flags/l/kr.gif"],
    "KWD"=>["Kuwait Dinar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "KYD"=>["Cayman Islands Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "KZT"=>["Kazakhstan Tenge","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "LAK"=>["Laos Kip","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "LBP"=>["Lebanon Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "LKR"=>["Sri Lanka Rupee","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "LRD"=>["Liberia Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "LSL"=>["Lesotho Loti","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "LYD"=>["Libya Dinar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MAD"=>["Morocco Dirham","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MDL"=>["Moldova Leu","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MGA"=>["Madagascar Ariary","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MKD"=>["Macedonia Denar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MMK"=>["Myanmar (Burma) Kyat","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MNT"=>["Mongolia Tughrik","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MOP"=>["Macau Pataca","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MRU"=>["Mauritania Ouguiya","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MUR"=>["Mauritius Rupee","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MVR"=>["Maldives (Maldive Islands) Rufiyaa","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MWK"=>["Malawi Kwacha","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "MXN"=>["Mexico Peso","http://www.geonames.org/flags/l/mx.gif"],
    "MYR"=>["Malaysia Ringgit","http://www.geonames.org/flags/l/my.gif"],
    "MZN"=>["Mozambique Metical","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "NAD"=>["Namibia Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "NGN"=>["Nigeria Naira","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "NIO"=>["Nicaragua Cordoba","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "NOK"=>["Norway Krone","http://www.geonames.org/flags/l/no.gif"],
    "NPR"=>["Nepal Rupee","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "NZD"=>["New Zealand Dollar","http://www.geonames.org/flags/l/nz.gif"],
    "OMR"=>["Oman Rial","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "PAB"=>["Panama Balboa","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "PEN"=>["Peru Sol","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "PGK"=>["Papua New Guinea Kina","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "PHP"=>["Philippines Peso","http://www.geonames.org/flags/l/ph.gif"],
    "PKR"=>["Pakistan Rupee","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "PLN"=>["Poland Zloty","http://www.geonames.org/flags/l/pl.gif"],
    "PYG"=>["Paraguay Guarani","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "QAR"=>["Qatar Riyal","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "RON"=>["Romania Leu","http://www.geonames.org/flags/l/ro.gif"],
    "RSD"=>["Serbia Dinar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "RUB"=>["Russia Ruble","http://www.geonames.org/flags/l/ru.gif"],
    "RWF"=>["Rwanda Franc","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SAR"=>["Saudi Arabia Riyal","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SBD"=>["Solomon Islands Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SCR"=>["Seychelles Rupee","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SDG"=>["Sudan Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SEK"=>["Sweden Krona","http://www.geonames.org/flags/l/se.gif"],
    "SGD"=>["Singapore Dollar","http://www.geonames.org/flags/l/sg.gif"],
    "SHP"=>["Saint Helena Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SLL"=>["Sierra Leone Leone","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SOS"=>["Somalia Shilling","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SPL*"=>["Seborga Luigino","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SRD"=>["Suriname Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "STN"=>["São Tomé and Príncipe Dobra","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SVC"=>["El Salvador Colon","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SYP"=>["Syria Pound","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "SZL"=>["eSwatini Lilangeni","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "THB"=>["Thailand Baht","http://www.geonames.org/flags/l/th.gif"],
    "TJS"=>["Tajikistan Somoni","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "TMT"=>["Turkmenistan Manat","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "TND"=>["Tunisia Dinar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "TOP"=>["Tonga Pa'anga","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "TRY"=>["Turkey Lira","http://www.geonames.org/flags/l/tr.gif"],
    "TTD"=>["Trinidad and Tobago Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "TVD"=>["Tuvalu Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "TWD"=>["Taiwan New Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "TZS"=>["Tanzania Shilling","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "UAH"=>["Ukraine Hryvnia","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "UGX"=>["Uganda Shilling","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "USD"=>["United States Dollar","http://www.geonames.org/flags/l/us.gif"],
    "UYU"=>["Uruguay Peso","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "UZS"=>["Uzbekistan Som","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "VEF"=>["Venezuela Bolívar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "VND"=>["Viet Nam Dong","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "VUV"=>["Vanuatu Vatu","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "WST"=>["Samoa Tala","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "XAF"=>["Communauté Financière Africaine (BEAC) CFA Franc BEAC","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "XCD"=>["East Caribbean Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "XDR"=>["International Monetary Fund (IMF) Special Drawing Rights","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "XOF"=>["Communauté Financière Africaine (BCEAO) Franc","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "XPF"=>["Comptoirs Français du Pacifique (CFP) Franc","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "YER"=>["Yemen Rial","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "ZAR"=>["South Africa Rand","http://www.geonames.org/flags/l/za.gif"],
    "ZMW"=>["Zambia Kwacha","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
    "ZWD"=>["Zimbabwe Dollar","https://static.wikia.nocookie.net/iracing/images/f/f1/Untitled-3.png/revision/latest/scale-to-width-down/340?cb=20190502155639"],
}
response=RestClient.get('https://api.exchangeratesapi.io/latest?base=USD')
result=JSON.parse(response.body)
rates=result["rates"]
rates = rates.sort
rates.each{|k,v| Currency.create(price:v,symbol:k, name:countries[k][0],image:countries[k][1])}
# binding.pry
Member.all.each do |m|
    10.times do
        cur = Currency.all.sample
        Transaction.create(price:cur.price,member_id:m.id,currency_id:cur.id,serial:rand(100000..999999),quantity:1000)
    end
end

p Transaction.count
p Member.count
p Currency.count
p "Cash Money"