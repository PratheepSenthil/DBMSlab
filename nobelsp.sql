SQL> @z:nobel.sql
drop table nobel
           *
ERROR at line 1:
ORA-00942: table or view does not exist 



Table created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.




SQL> select name,dob from nobel where dob>'01-JUL-1960';

NAME                           DOB                                              
------------------------------ ---------                                        
Eric A Cornell                 19-DEC-61                                        
Carol W Greider                15-APR-61                                        
Barack H Obama                 04-AUG-61                                        




SQL> select name, category, field, country, year_award from nobel where country ='India' and category ='Che';

NAME                           CAT FIELD                     COUNTRY            
------------------------------ --- ------------------------- ----------         
YEAR_AWARD                                                                      
----------                                                                      
Venkatraman Ramakrishnan       Che Biochemistry              India              
      2009                                                                      

                                                                                

SQL> select name, category, field, year_award from nobel where year_award between 2000 and 2005 and category in ('Che','Phy');

NAME                           CAT FIELD                     YEAR_AWARD         
------------------------------ --- ------------------------- ----------         
Eric A Cornell                 Phy Atomic physics                  2001         
Carl E Wieman                  Phy Atomic physics                  2001         
Ryoji Noyori                   Che Organic Chemistry               2001         
K Barry Sharpless              Che Organic Chemistry               2001         




SQL> select name,year_award-extract(year from dob) "Age" from nobel where category ='Pea';

NAME                                  Age                                       
------------------------------ ----------                                       
John Hume                              61                                       
David Trimble                          54                                       
Kofi Annan                             63                                       
Barack H Obama                         48                                       




SQL> select name,category,aff_role,country from nobel where ( name like ('A%') or name like ('%a')) and country not like 'Isreal';

NAME                           CAT AFF_ROLE                       COUNTRY       
------------------------------ --- ------------------------------ ----------    
Amartya Sen                    Eco Trinity College                India         
Barack H Obama                 Pea President of USA               USA           





SQL> select name, gender, aff_role, dob "Born 1950" , country from nobel where (extract(year from dob) between 1950 and 1960);

NAME                           G AFF_ROLE                       Born 1950       
------------------------------ - ------------------------------ ---------       
COUNTRY                                                                         
----------                                                                      
Robert B. Laughlin             m Stanford University            01-NOV-50       
USA                                                                             
                                                                                
Carl E Wieman                  m University of Colorado         26-MAR-51       
USA                                                                             
                                                                                
Venkatraman Ramakrishnan       m MRC Laboratory                 19-AUG-52       
India                                                                           
                                                                                

NAME                           G AFF_ROLE                       Born 1950       
------------------------------ - ------------------------------ ---------       
COUNTRY                                                                         
----------                                                                      
Herta Muller                   f                                17-AUG-53       
Romania                                                                         
                                                                                



SQL> select name,gender,category,aff_role,country from nobel where (name like 'A%' or name like 'H%' or name like 'D%') and aff_role is not null order by name;

NAME                           G CAT AFF_ROLE                       COUNTRY     
------------------------------ - --- ------------------------------ ----------  
Ada E Yonath                   f Che Weizmann Institute of Science  Isreal      
Amartya Sen                    m Eco Trinity College                India       
Daniel C. Tsui                 m Phy Princeton University           China       
David Trimble                  m Pea Ulster Unionist party Leader   Ireland     
Horst L Stormer                m Phy Columbia University            Germany     





SQL> select aff_role,count(aff_role) from nobel group by aff_role having count(*)>1;

AFF_ROLE                       COUNT(AFF_ROLE)                                  
------------------------------ ---------------                                  
                                             0                                  
Bell Laboratories                            2                                  
University of California                     5                                  
University of Colorado                       2                                  




SQL>  select country,max(dob) "youngest" ,min(dob) "eldest" from nobel
     group by country
     having count(*)>1
     order by country;

COUNTRY    youngest  eldest                                                     
---------- --------- ---------                                                  
China      28-FEB-39 04-NOV-33                                                  
India      19-AUG-52 03-NOV-33                                                  
Ireland    15-OCT-44 18-JAN-37                                                  
UK         17-AUG-32 31-OCT-25                                                  
USA        19-DEC-61 10-MAY-30                                                  




SQL> select year_award,category,field from nobel
      where country !='USA'
      group by year_award,category,field
      having count(*)>1;

YEAR_AWARD CAT FIELD                                                            
---------- --- -------------------------                                        
      2009 Che Biochemistry                                                     
      1998 Che Theoretical Chemistry                                            
      1998 Phy Condensed matter                                                 
      1998 Pea Negotiation                                                      

SQL> spool off
