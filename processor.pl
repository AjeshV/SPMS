if(open(myfile,"C:/SPMS/Resource-Skillset.csv"))
   {
      $line=<myfile>;
      @array1=split(/,/,$line);
      $size1=@array1-1;
      print "$size1";
   open(OUTFILE,">proout1.csv");
      print  OUTFILE "$line";
   close(OUTFILE);
   open(OUTFILE,">>proout1.csv");
      $line=<myfile>; 
    
    while($line ne "")
        {
          chop($line);
          chop($line);
          @array=split(/,/,$line);
          $size=@array;

$k=3;
$l=4;

         if($array[$k]<=24)
              {
                 $array[$l]=L1;
              }
              elsif($array[$k]>24 and $array[$k]<84)
              {
                 $array[$l]=L2;
              }
              else
              {
                 $array[$l]=L3;
              }
    
       $value=$array[$size1];
       $part=substr($value,1);
                                                                                                 
                                      
 
 
       $array[$size1]=$part;

  
                for($i=$size1;$i<$size;$i++)
                      {
  
                          for($j=0;$j<$size1;$j++)
                            {
   
                               print OUTFILE "$array[$j],";

                            }
 
                         print OUTFILE "$array[$i]\n";
 
 
                       }
  
        $line=<myfile>;

      }

close(myfile);
close(OUTFILE);

             }                                                                             

else

   {
      print "Error : couldn't open the specified file";
   }