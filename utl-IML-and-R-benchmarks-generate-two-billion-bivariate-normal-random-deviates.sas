IML and R benchmarks generate two billion bivariate normal random deviates                                                                     
                                                                                                                                               
github                                                                                                                                         
https://tinyurl.com/ycr9rtbd                                                                                                                   
https://github.com/rogerjdeangelis/utl-IML-and-R-benchmarks-generate-two-billion-bivariate-normal-random-deviates                              
                                                                                                                                               
Benchmarks can be influences by many factors be skepitical.                                                                                    
Run your own benchmarks, code is below.                                                                                                        
                                                                                                                                               
I have 16 cores and 32 threads and input and output are using NVMe drives(little slower than the dual channel NVMe drives).                    
Less than $1,000 ebay  T7610. You cannot boot from NVMe drives on the T7610 and                                                                
the T7610 does not support dual channel NVMe drives. However the T7610 supports too single channel MVMe drives.                                
                                                                                                                                               
After installing the NVMe drives make sure yo manually install the manufactures driver software, MS default driver seems much slower.          
                                                                                                                                               
 2 Billion pairs of random variables from bivariate normal)                                                                                    
 no output to SAS                                                                                                                              
 ==========================================================                                                                                    
                                                                                                                                               
              Seconds                                                                                                                          
 Microsoft R    25.0   * Never exceeded 60% system utilization (9-10 cores at 100%)                                                            
      Cran R    27.4                                                                                                                           
 SAS Proc IML   83.1                                                                                                                           
                                                                                                                                               
                                                                                                                                               
 100 million pairs of random variables from bivariate normal                                                                                   
 output to SAS and then proc corr                                                                                                              
 ===========================================================                                                                                   
                                                                                                                                               
              Seconds                                                                                                                          
 Microsoft R    36.0 (R writes floats to binary file and then sas reads the binary file - extra processing)                                    
      Cran R    38.0 (R writes floats to binary file and then sas reads the binary file - extra processing)                                    
 SAS Proc IML   47.1 (no need for the binary write/read file communication)                                                                    
                                                                                                                                               
SAS Forum (related to)                                                                                                                         
https://tinyurl.com/ycosvp9v                                                                                                                   
https://communities.sas.com/t5/SAS-IML-Software-and-Matrix/Simulate-bivariate-normal-data-for-multiple-Sample-size-for-two/m-p/647061          
                                                                                                                                               
https://tinyurl.com/yccl3kws                                                                                                                   
https://stackoverflow.com/questions/59997925/how-to-generate-multivariate-normal-data-in-r                                                     
                                                                                                                                               
*_                   _                                                                                                                         
(_)_ __  _ __  _   _| |_                                                                                                                       
| | '_ \| '_ \| | | | __|                                                                                                                      
| | | | | |_) | |_| | |_                                                                                                                       
|_|_| |_| .__/ \__,_|\__|                                                                                                                      
        |_|                                                                                                                                    
;                                                                                                                                              
                                                                                                                                               
Mean of x =0                                                                                                                                   
Mean of Y =0                                                                                                                                   
Covariance                                                                                                                                     
       1.0 0.5                                                                                                                                 
       0.5 1.0                                                                                                                                 
                                                                                                                                               
options cpucount=16;                                                                                                                           
                                                                                                                                               
%let n  = 2000000000; * two billion (I don't think R supports larger than 2gb sample sizes);                                                   
%let cov= %str(matrix(c(1, 0.5, 0.5, 1 ), nrow = 2, ncol = 2));  * covariance matrix;                                                          
%let mu = %str(c(X = 0, Y = 0)); * means;                                                                                                      
                                                                                                                                               
*            _               _                                                                                                                 
  ___  _   _| |_ _ __  _   _| |_                                                                                                               
 / _ \| | | | __| '_ \| | | | __|                                                                                                              
| (_) | |_| | |_| |_) | |_| | |_                                                                                                               
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                              
                |_|                                                                                                                            
;                                                                                                                                              
                                                                                                                                               
100,000,000 Pairs                                                                                                                              
                                                                                                                                               
The CORR Procedure                                                                                                                             
                                                                                                                                               
   2  Variables:    x        y                                                                                                                 
                                    Simple Statistics                                                                                          
                                                                                                                                               
Var         N            Mean       Std Dev           Sum       Minimum       Maximum                                                          
                                                                                                                                               
x   100,000,000    -0.0001020       1.00002        -10200      -5.66573       5.83698                                                          
y   100,000,000     0.0000397       1.00002          3972      -5.48425       5.52148                                                          
                                                                                                                                               
Pearson Correlation Coefficients, N = 100000000                                                                                                
        Prob > |r| under H0: Rho=0                                                                                                             
                                                                                                                                               
           x             y                                                                                                                     
                                                                                                                                               
x    1.00000       0.50007                                                                                                                     
y    0.50007       1.00000                                                                                                                     
                                                                                                                                               
*          _       _   _                                                                                                                       
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                                       
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                                                      
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                                      
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                                      
*                                                                                                                                              
  __ _     _ __ ___  ___    ___  _ __   ___ _ __    _ __                                                                                       
 / _` |   | '_ ` _ \/ __|  / _ \| '_ \ / _ \ '_ \  | '__|                                                                                      
| (_| |_  | | | | | \__ \ | (_) | |_) |  __/ | | | | |                                                                                         
 \__,_(_) |_| |_| |_|___/  \___/| .__/ \___|_| |_| |_|                                                                                         
                                |_|                                                                                                            
;                                                                                                                                              
                                                                                                                                               
* NO OUTPUT TO SAS;                                                                                                                            
                                                                                                                                               
%symdel n cov mu / nowarn;                                                                                                                     
                                                                                                                                               
%let n  = 2000000000; * two billion (I don't think R supports larger than 2gb sample sizes);                                                   
%let cov= %str(matrix(c(1, 0.5, 0.5, 1 ), nrow = 2, ncol = 2));  * covariance matrix;                                                          
%let mu = %str(c(X = 0, Y = 0)); * means;                                                                                                      
                                                                                                                                               
%utl_submit_msr64(resolve('                                                                                                                    
library(mvnfast);                                                                                                                              
set.seed(123);                                                                                                                                 
want<-mvnfast::rmvn(&n, &mu, &cov, ncores =16);                                                                                                
'));                                                                                                                                           
                                                                                                                                               
NOTE: 2 records were read from the infile RUT.                                                                                                 
      The minimum record length was 2.                                                                                                         
      The maximum record length was 247.                                                                                                       
NOTE: DATA statement used (Total process time):                                                                                                
      real time           25.04 seconds                                                                                                        
      user cpu time        0.03 seconds                                                                                                        
      system cpu time     0.14 seconds                                                                                                         
      memory              315.31k                                                                                                              
      OS Memory           34296.00k                                                                                                            
      Timestamp           05/12/2020 02:19:36 PM                                                                                               
      Step Count                        409  Switch Count  0                                                                                   
                                                                                                                                               
                                                                                                                                               
                                                                                                                                               
                                                                                                                                               
* 100,000,000 WITH OUTPUT TO SAS;                                                                                                              
* RAN PROC CORR ON THE 100,000,000;                                                                                                            
                                                                                                                                               
%utlfkil(f:/bin/want.bin);                                                                                                                     
%symdel n cov mu / nowarn;                                                                                                                     
                                                                                                                                               
%let n  = 100000000; * 100,000,000 (I don't think R supports larger than 2gb sample sizes);                                                    
%let cov= %str(matrix(c(1, 0.5, 0.5, 1 ), nrow = 2, ncol = 2));  * covariance matrix;                                                          
%let mu = %str(c(X = 0, Y = 0)); * means;                                                                                                      
                                                                                                                                               
%utl_submit_msr64("                                                                                                                            
library(mvnfast);                                                                                                                              
set.seed(123);                                                                                                                                 
want<-as.vector(t(mvnfast::rmvn(&n, &mu, &cov, ncores =16)));                                                                                  
outbin <- 'f:/bin/want.bin';                                                                                                                   
writeBin(want, file(outbin, 'wb'), size=8);                                                                                                    
");                                                                                                                                            
                                                                                                                                               
NOTE: DATA statement used (Total process time):                                                                                                
      real time           6.02 seconds                                                                                                         
      cpu time            0.12 seconds                                                                                                         
                                                                                                                                               
filename bin "f:/bin/want.bin" lrecl=8 recfm=f;                                                                                                
data want;                                                                                                                                     
 infile bin;                                                                                                                                   
 input x rb8.  @@;                                                                                                                             
 input y rb8.  @@;                                                                                                                             
 output;                                                                                                                                       
run;quit;                                                                                                                                      
                                                                                                                                               
NOTE: 200000000 records were read from the infile BIN.                                                                                         
NOTE: SAS went to a new line when INPUT statement reached past the end of a line.                                                              
NOTE: The data set WORK.WANT has 100000000 observations and 2 variables.                                                                       
NOTE: DATA statement used (Total process time):                                                                                                
      real time           19.05 seconds                                                                                                        
      cpu time            18.97 seconds                                                                                                        
                                                                                                                                               
                                                                                                                                               
proc corr data=want;                                                                                                                           
var x y;                                                                                                                                       
run;quit;                                                                                                                                      
                                                                                                                                               
NOTE: PROCEDURE CORR used (Total process time):                                                                                                
      real time           11.91 seconds                                                                                                        
                                                                                                                                               
*_                                                                                                                                             
| |__      ___ _ __ __ _ _ __    _ __                                                                                                          
| '_ \    / __| '__/ _` | '_ \  | '__|                                                                                                         
| |_) |  | (__| | | (_| | | | | | |                                                                                                            
|_.__(_)  \___|_|  \__,_|_| |_| |_|                                                                                                            
                                                                                                                                               
;                                                                                                                                              
                                                                                                                                               
%utlfkil(f:/bin/want.bin);                                                                                                                     
%symdel n cov mu / nowarn;                                                                                                                     
                                                                                                                                               
%let n  = 100000000; * two billion (I don't think R supports larger than 2gb sample sizes);                                                    
%let cov= %str(matrix(c(1, 0.5, 0.5, 1 ), nrow = 2, ncol = 2));  * covariance matrix;                                                          
%let mu = %str(c(X = 0, Y = 0)); * means;                                                                                                      
                                                                                                                                               
%utl_submit_r64("                                                                                                                              
library(mvnfast);                                                                                                                              
set.seed(123);                                                                                                                                 
want<-as.vector(t(mvnfast::rmvn(&n, &mu, &cov, ncores =16)));                                                                                  
outbin <- 'f:/bin/want.bin';                                                                                                                   
writeBin(want, file(outbin, 'wb'), size=8);                                                                                                    
");                                                                                                                                            
                                                                                                                                               
NOTE: DATA statement used (Total process time):                                                                                                
      real time           6.84 seconds                                                                                                         
      cpu time            0.06 seconds                                                                                                         
                                                                                                                                               
filename bin "f:/bin/want.bin" lrecl=8 recfm=f;                                                                                                
data want;                                                                                                                                     
 infile bin;                                                                                                                                   
 input x rb8.  @@;                                                                                                                             
 input y rb8.  @@;                                                                                                                             
 output;                                                                                                                                       
run;quit;                                                                                                                                      
                                                                                                                                               
NOTE: DATA statement used (Total process time):                                                                                                
      real time           19.32 seconds                                                                                                        
      cpu time            19.26 seconds                                                                                                        
                                                                                                                                               
proc corr data=want;                                                                                                                           
var x y;                                                                                                                                       
run;quit;                                                                                                                                      
                                                                                                                                               
NOTE: PROCEDURE CORR used (Total process time):                                                                                                
      real time           12.31 seconds                                                                                                        
                                                                                                                                               
*         _           _                                                                                                                        
  ___    (_)_ __ ___ | |                                                                                                                       
 / __|   | | '_ ` _ \| |                                                                                                                       
| (__ _  | | | | | | | |                                                                                                                       
 \___(_) |_|_| |_| |_|_|                                                                                                                       
                                                                                                                                               
;                                                                                                                                              
                                                                                                                                               
options cpucount=16;                                                                                                                           
proc iml;                                                                                                                                      
NumSamples = 100000000;                                                                                                                        
Mean = {0, 0};                                                                                                                                 
Cov = {1 .5,                                                                                                                                   
      .5  1};                                                                                                                                  
call randseed(4321);                                                                                                                           
X = RandNormal(NumSamples, Mean, Cov);                                                                                                         
create want from X[c={"X" "Y" }];                                                                                                              
append from X;                                                                                                                                 
close want;                                                                                                                                    
quit;                                                                                                                                          
                                                                                                                                               
NOTE: PROCEDURE IML used (Total process time):                                                                                                 
      real time           33.71 seconds                                                                                                        
      user cpu time       32.53 seconds                                                                                                        
      system cpu time     5.28 seconds                                                                                                         
      memory              4687823.00k                                                                                                          
      OS Memory           4717456.00k                                                                                                          
      Timestamp           05/12/2020 05:20:11 PM                                                                                               
      Step Count                        662  Switch Count  0                                                                                   
                                                                                                                                               
proc corr data=want;                                                                                                                           
var x y;                                                                                                                                       
run;quit;                                                                                                                                      
                                                                                                                                               
NOTE: PROCEDURE CORR used (Total process time):                                                                                                
      real time           13.12 seconds                                                                                                        
      user cpu time       11.09 seconds                                                                                                        
      system cpu time     2.03 seconds                                                                                                         
      memory              1513.53k                                                                                                             
      OS Memory           30460.00k                                                                                                            
      Timestamp           05/12/2020 05:20:57 PM                                                                                               
      Step Count                        663  Switch Count  11                                                                                  
                                                                                                                                               
4242!     quit;                                                                                                                                
                                                                                                                                               
